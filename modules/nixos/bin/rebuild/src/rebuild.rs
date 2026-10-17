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

fn main() {
    let log = File::create(LOG).expect("failed to create log file");

    let err_log = log.try_clone().expect("failed to clone log file");

    let mut child = Command::new("nixos-rebuild")
        .args(std::env::args_os().skip(1))
        .stdout(Stdio::from(log))
        .stderr(Stdio::from(err_log))
        .spawn()
        .expect("failed to run nixos-rebuild");

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
    let mut i = 0;
    let mut log_offset: u64 = 0;
    let mut last_log_line = String::from("starting...");
    let status = loop {
        match child.try_wait().expect("failed to wait on nixos-rebuild") {
            Some(status) => break status,
            None => {
                if let Ok(mut log_file) = File::open(LOG) {
                    let log_len = log_file.metadata().map(|md| md.len()).unwrap_or(0);
                    if log_len < log_offset {
                        log_offset = 0;
                    }
                    if log_file.seek(SeekFrom::Start(log_offset)).is_ok() {
                        let mut buf = Vec::new();
                        if log_file.read_to_end(&mut buf).is_ok() {
                            for log_line in String::from_utf8_lossy(&buf).lines() {
                                if !log_line.trim().is_empty() {
                                    last_log_line.clear();
                                    last_log_line.push_str(log_line.trim_end());
                                }
                            }
                            log_offset = log_len;
                        }
                    }
                }
                if i % 50 == 49 {
                    m_index = random_message();
                }
                let mut status_line = format!(
                    "[\x1b[32m {} \x1b[0m] {} ({})",
                    spinner_frames[i % 4], messages[m_index], last_log_line
                );
                if status_line.chars().count() > 100 {
                    status_line = format!("{}...)", status_line.chars().take(97).collect::<String>());
                }
                print!("\r\x1b[2K{status_line}");
                std::io::stdout().flush().ok();
                thread::sleep(Duration::from_millis(200));
                i += 1;
            }
        }
    };
    print!("\r\x1b[2K");
    std::io::stdout().flush().ok();

    if status.success() {
        println!("\x1b[32m󰄬\x1b[0m system rebuilt successfully!");
        println!("logs at {LOG}");
    } else {
        eprintln!("\x1b[31m󰅖\x1b[0m system rebuild failed. Log:");

        let log =
            std::fs::read_to_string(LOG).unwrap_or_else(|_| "could not read log file".into());

        eprintln!("{log}");
        std::process::exit(status.code().unwrap_or(1));
    }
}
