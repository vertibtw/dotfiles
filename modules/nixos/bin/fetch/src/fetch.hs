-- it looks cool in the github language overview
-- I hate this language with a burning passion

import System.Process (readProcess)

sh :: String -> IO String
sh cmd = filter (/= '\n') <$> readProcess "sh" ["-c", cmd] ""

c :: Int -> String -> String
c n s = "\ESC[1;" ++ show n ++ "m" ++ s ++ "\ESC[0m"

pad :: String -> String
pad s = take 15 (s ++ repeat ' ')

nixLogo, tux :: [String]
-- from my fastfetch config, which is from some github repo uh idk really
nixLogo = [ "  ▗▄   ▗▄ ▄▖    ",
            " ▄▄🬸█▄▄▄🬸█▛ ▃   ",
            "   ▟▛    ▜▃▟🬕   ",
            "🬋🬋🬫█      █🬛🬋🬋  ",
            " 🬷▛🮃▙    ▟▛     ",
            " 🮃 ▟█🬴▀▀▀█🬴▀▀   ",
            "  ▝▀ ▀▘   ▀▘    " ]
-- from: https://asciiart.website/art/2093
tux = [ "    .--.",
        "   |o_o |",
        "   |:_/ |",
        "  //   \\ \\",
        " (|     | )",
        "/'\\_   _/`\\",
        "\\___)=(___/" ]

main :: IO ()
main = do
  user <- sh "whoami"
  host <- sh "cat /proc/sys/kernel/hostname"
  os   <- sh ". /etc/os-release; echo $ID"
  name <- sh ". /etc/os-release; echo $PRETTY_NAME"
  mem  <- sh "awk '/MemTotal/{t=$2} /MemAvailable/{a=$2} END{printf \"%dM / %dM\", (t-a)/1024, t/1024}' /proc/meminfo"
  pkgs <- sh "if [ -e /run/current-system/sw ]; then nix-store -q --requisites /run/current-system/sw | wc -l; elif command -v pacman >/dev/null; then pacman -Qq | wc -l; else dpkg-query -f '.\\n' -W 2>/dev/null | wc -l; fi"
  disk <- sh "df -h / | awk 'NR==2{print $3 \" / \" $2}'"
  de   <- sh "echo ${XDG_CURRENT_DESKTOP:-${DESKTOP_SESSION:-unknown}}"
  let nix  = os == "nixos"
      logo = if nix then nixLogo else tux
      col  = if nix then 34 else 33
      row k v = c 32 k ++ ": " ++ v
      info = [ c 36 (user ++ c 37 "@" ++ c 36 host)
             , c 36 (replicate (length user + length host + 1) '-')
             , row "OS" name
             , row "Memory" mem
             , row "Packages" pkgs
             , row "Disk" disk
             , row "WM/DE" de ]
  putStr (unlines (zipWith (\l i -> c col (pad l) ++ i) logo info))
