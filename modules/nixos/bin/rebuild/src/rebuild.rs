// small utility for, uh, not seeing the output of nixos-rebuild. mostly because I'm too lazy to fix
// eval warnings, and I do not like looking at them.
// also rust looks cool in the language overview on github

use std::{
    fs::File,
    process::{Command, Stdio},
};

fn main() {
    println!("/ᐠ｡ꞈ｡ᐟ\\");
    let log = File::create("/tmp/last_nix_rebuild.log")
        .expect("failed to create log file");

    let err_log = log.try_clone().expect("failed to clone log file");

    let status = Command::new("nixos-rebuild")
        .args(std::env::args_os().skip(1))
        .stdout(Stdio::from(log))
        .stderr(Stdio::from(err_log))
        .status()
        .expect("failed to run nixos-rebuild");

    if status.success() {
        println!("\x1b[32m󰄬\x1b[0m system rebuilt successfully!");
        println!("logs at /tmp/last_nix_rebuild.log");
    } else {
        eprintln!("\x1b[31m󰅖\x1b[0m system rebuild failed. Log:");

        let log = std::fs::read_to_string("/tmp/last_nix_rebuild.log")
            .unwrap_or_else(|_| "could not read log file".into());

        eprintln!("{log}");
        std::process::exit(status.code().unwrap_or(1));
    }
}
