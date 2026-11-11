
use std::process::Command;

// from some random fastfetch config repo probably idk tbh
const NIX: [&str; 7] = [
    "  ▗▄   ▗▄ ▄▖    ",
    " ▄▄🬸█▄▄▄🬸█▛ ▃   ",
    "   ▟▛    ▜▃▟🬕   ",
    "🬋🬋🬫█      █🬛🬋🬋  ",
    " 🬷▛🮃▙    ▟▛     ",
    " 🮃 ▟█🬴▀▀▀█🬴▀▀   ",
    "  ▝▀ ▀▘   ▀▘    ",
];

// from: https://asciiart.website/art/2093
const TUX: [&str; 7] = [
    "    .--.",
    "   |o_o |",
    "   |:_/ |",
    "  //   \\ \\",
    " (|     | )",
    "/'\\_   _/`\\",
    "\\___)=(___/",
];

fn sh(cmd: &str) -> String {
    Command::new("sh")
        .args(["-c", cmd])
        .output()
        .map(|o| String::from_utf8_lossy(&o.stdout).trim_end().to_string())
        .unwrap_or_default()
}

fn main() {
    let user = sh("whoami");
    let host = sh("cat /proc/sys/kernel/hostname");
    let os = sh(". /etc/os-release; echo $ID");

    let nix = os == "nixos";
    let (logo, color) = if nix { (&NIX, 34) } else { (&TUX, 33) };
    let row = |k: &str, v: &str| format!("\x1b[1;32m{k}\x1b[0m: {v}");

    let info = [
        format!("\x1b[1;36m{user}\x1b[1;37m@\x1b[1;36m{host}\x1b[0m"),
        format!(
            "\x1b[1;36m{}\x1b[0m",
            "-".repeat(user.chars().count() + host.chars().count() + 1)
        ),
        row("OS", &sh(". /etc/os-release; echo $PRETTY_NAME")),
        row("Kernel", &sh("uname -r")),
        row(
            "Memory",
            &sh("awk '/MemTotal/{t=$2} /MemAvailable/{a=$2} END{printf \"%dM / %dM\", (t-a)/1024, t/1024}' /proc/meminfo"),
        ),
        row(
            "Packages",
            &sh("if [ -e /run/current-system/sw ]; then nix-store -q --requisites /run/current-system/sw | wc -l; elif command -v pacman >/dev/null; then pacman -Qq | wc -l; else dpkg-query -f '.\\n' -W 2>/dev/null | wc -l; fi"),
        ),
        row("Disk", &sh("df -h / | awk 'NR==2{print $3 \" / \" $2}'")),
        row("WM/DE", &sh("echo ${XDG_CURRENT_DESKTOP:-${DESKTOP_SESSION:-unknown}}")),
    ];

    for i in 0..logo.len().max(info.len()) {
        let art = logo
            .get(i)
            .copied()
            .unwrap_or("")
            .chars()
            .take(15)
            .collect::<String>();
        let text = info.get(i).map(String::as_str).unwrap_or("");
        println!("\x1b[1;{color}m{art:<15}\x1b[0m{text}");
    }
}
