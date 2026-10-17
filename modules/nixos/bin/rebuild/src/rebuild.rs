// small utility for, uh, not seeing the output of nixos-rebuild. mostly because I'm too lazy to fix
// eval warnings, and I do not like looking at them.
// also rust looks cool in the language overview on github

use std::{
    fs::File,
    io::{Read, Seek, SeekFrom, Write},
    process::{Command, Stdio},
    thread,
    time::{Duration, SystemTime, UNIX_EPOCH},
};

const LOG: &str = "/tmp/last_nix_rebuild.log";
const STATUS_WIDTH: usize = 100;

fn get_log_line(log_offset: &mut u64) -> Option<String> {
    let mut log_file = File::open(LOG).ok()?;
    let log_len = log_file.metadata().map(|md| md.len()).unwrap_or(0);
    if log_len < *log_offset {
        *log_offset = 0;
    }
    log_file.seek(SeekFrom::Start(*log_offset)).ok()?;

    let mut buf = Vec::new();
    log_file.read_to_end(&mut buf).ok()?;
    *log_offset = log_len;

    String::from_utf8_lossy(&buf)
        .lines()
        .rev()
        .find(|line| !line.trim().is_empty())
        .map(|line| line.trim_end().to_owned())
}

fn status_line(spinner: &str, message: &str, log_line: &str) -> String {
    let fixed_len = format!("[ {spinner} ] {message} (").chars().count() + 1;
    let budget = STATUS_WIDTH.saturating_sub(fixed_len + "...".len());

    let shown = if log_line.chars().count() > budget {
        format!("{}...", log_line.chars().take(budget).collect::<String>())
    } else {
        log_line.to_owned()
    };
    format!("[\x1b[32m {spinner} \x1b[0m] {message} ({shown})")
}

fn main() {
    let log_file = File::create(LOG).expect("failed to create log file");

    let err_log = log_file.try_clone().expect("failed to clone log file");

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

    let spinner_frames = ["|", "/", "-", "\\"];
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
    let mut log_offset: u64 = 0;
    let mut last_log_line = String::from("starting...");

    let status = loop {
        if let Some(status) = child.try_wait().expect("failed to wait on nixos-rebuild") {
            break status;
        }

        if let Some(line) = get_log_line(&mut log_offset) {
            last_log_line = line;
        }

        if tick % 50 == 49 {
            m_index = random_message();
        }

        print!(
            "\r\x1b[2K{}",
            status_line(
                spinner_frames[tick % spinner_frames.len()],
                messages[m_index],
                &last_log_line,
            )
        );
        std::io::stdout().flush().ok();
        thread::sleep(Duration::from_millis(200));
        tick += 1;
    };
    print!("\r\x1b[2K");
    std::io::stdout().flush().ok();

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
