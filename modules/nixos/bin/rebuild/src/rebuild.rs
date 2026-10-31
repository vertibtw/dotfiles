// small utility for, uh, not seeing the output of nixos-rebuild. mostly because I'm too lazy to fix
// eval warnings, and I do not like looking at them.
// also rust looks cool in the language overview on github
use std::{
    fs::File,
    io::{IsTerminal, Read, Write},
    process::{Command, Stdio},
    thread,
    time::{Duration, SystemTime, UNIX_EPOCH},
};

const LOG: &str = "/tmp/last_nix_rebuild.log";

struct LogTail {
    file: File,
    buf: Vec<u8>,
    last: String,
}

impl LogTail {
    fn new() -> std::io::Result<Self> {
        Ok(Self {
            file: File::open(LOG)?,
            buf: Vec::new(),
            last: "starting...".into(),
        })
    }

    fn poll(&mut self) -> &str {
        let mut chunk = Vec::new();
        if self.file.read_to_end(&mut chunk).is_ok() {
            self.buf.extend_from_slice(&chunk);
        }

        if let Some(pos) = self.buf.iter().rposition(|&b| b == b'\n' || b == b'\r') {
            let done: Vec<u8> = self.buf.drain(..=pos).collect();
            let text = String::from_utf8_lossy(&done);
            if let Some(line) = text
                .split(|c: char| c == '\n' || c == '\r')
                .rev()
                .map(str::trim)
                .find(|l| !l.is_empty())
            {
                self.last = strip_ansi(line).replace('\t', " ");
            }
        }

        if self.buf.len() > 64 * 1024 {
            self.buf.clear();
        }
        &self.last
    }
}

fn strip_ansi(s: &str) -> String {
    let mut out = String::with_capacity(s.len());
    let mut chars = s.chars();
    while let Some(c) = chars.next() {
        if c == '\x1b' {
            for c in chars.by_ref() {
                if c.is_ascii_alphabetic() {
                    break;
                }
            }
        } else {
            out.push(c);
        }
    }
    out
}

// there's a crate for this but i don't wanna do that so
#[repr(C)]
struct WinSize {
    rows: u16,
    cols: u16,
    x_pixel: u16,
    y_pixel: u16,
}

unsafe extern "C" {
    fn ioctl(fd: i32, request: u64, ...) -> i32;
}

const TIOCGWINSZ: u64 = 0x5413;

fn term_cols() -> usize {
    let mut ws = WinSize {
        rows: 0,
        cols: 0,
        x_pixel: 0,
        y_pixel: 0,
    };
    let ok = unsafe { ioctl(1, TIOCGWINSZ, &mut ws as *mut WinSize) } == 0;
    if ok && ws.cols > 0 {
        ws.cols as usize
    } else {
        80
    }
}

fn truncate(s: &str, max: usize) -> String {
    if s.chars().count() <= max {
        s.to_owned()
    } else {
        let keep = max.saturating_sub(3);
        format!("{}...", s.chars().take(keep).collect::<String>())
    }
}

fn status_line(spinner: &str, message: &str, log_line: &str, cols: usize) -> String {
    let width = cols.saturating_sub(1);
    let prefix_plain = format!("[ {spinner} ] {message} (");
    let log_budget = width.saturating_sub(prefix_plain.chars().count() + 1);

    if log_budget < 4 {
        return truncate(&format!("[ {spinner} ] {message}"), width);
    }

    format!(
        "[\x1b[32m {spinner} \x1b[0m] {message} \x1b[2m({})\x1b[0m",
        truncate(log_line, log_budget)
    )
}

fn main() {
    let log_file = File::create(LOG).expect("failed to create log file");
    let err_log = log_file.try_clone().expect("failed to clone log file");

    let mut tail = LogTail::new().expect("failed to open log for reading");

    let mut child = match Command::new("nixos-rebuild")
        .args(std::env::args_os().skip(1))
        .stdout(Stdio::from(log_file))
        .stderr(Stdio::from(err_log))
        .spawn()
    {
        Ok(child) => child,
        Err(e) => {
            eprintln!("failed to run nixos-rebuild: {e}");
            std::process::exit(127);
        }
    };

    let interactive = std::io::stdout().is_terminal();

    //let spinner_frames = ["|", "/", "-", "\\"];
    let spinner_frames = ["⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"]; // idk if i like this

    let messages = [
        "rebuilding...",
        "hiding eval warnings...",
        "asking nix nicely...",
        "petting cats...",
        "fetching half of cache.nixos.org...",
        "taking a long time because your config is ass...",
        "nix eval says no...",
        "searching for a package that doesn't exist...",
        "the machine spirit demands another reboot...",
        "the flake is not flaking...",
        "consulting the wonderful scrolls of the nix manual...",
        "sacrificing you to the nix gods...",
        "consulting the manual...",
        "larping touhou...",
        "touching grass (deferred)...",
        "pretending this is reproducible...",
        ":3ing...",
        "eating your resources...",
    ];
    let random_message = || {
        SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .map(|d| d.subsec_nanos() as usize % messages.len())
            .unwrap_or(0)
    };
    let mut m_index = random_message();
    let mut tick: usize = 0;

    let status = loop {
        if let Some(status) = child.try_wait().expect("failed to wait on nixos-rebuild") {
            break status;
        }

        let log_line = tail.poll().to_owned();

        if tick % 50 == 49 {
            m_index = random_message();
        }

        if interactive {
            print!(
                "\r\x1b[2K{}",
                status_line(
                    spinner_frames[tick % spinner_frames.len()],
                    messages[m_index],
                    &log_line,
                    term_cols(),
                )
            );
            std::io::stdout().flush().ok();
        }
        thread::sleep(Duration::from_millis(200));
        tick += 1;
    };

    if interactive {
        print!("\r\x1b[2K");
        std::io::stdout().flush().ok();
    }

    if status.success() {
        println!("\x1b[32m󰄬\x1b[0m system rebuilt successfully!");
        println!("logs at {LOG}");
    } else {
        let log =
            std::fs::read_to_string(LOG).unwrap_or_else(|_| "could not read log file".into());

        let reason = match status.code() {
            Some(code) => format!("exit code {code}"),
            None => "killed by signal".to_owned(),
        };
        eprintln!("\x1b[31m󰅖\x1b[0m system rebuild failed ({reason}). Log at {LOG}:");
        eprintln!("{log}");
        std::process::exit(status.code().unwrap_or(1));
    }
}
