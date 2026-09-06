{
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      PubkeyAuthentication = true;
      PermitEmptyPasswords = false;
      ChallengeResponseAuthentication = false;
      UsePAM = true;

      Protocol = 2;
      MaxAuthTries = 3;
      MaxSessions = 4;
      LoginGraceTime = "30s";

      KexAlgorithms = [
        "curve25519-sha256"
        "curve25519-sha256@libssh.org"
        "diffie-hellman-group16-sha512"
        "diffie-hellman-group18-sha512"
      ];
      Ciphers = [
        "chacha20-poly1305@openssh.com"
        "aes256-gcm@openssh.com"
        "aes128-gcm@openssh.com"
        "aes256-ctr"
        "aes192-ctr"
        "aes128-ctr"
      ];
      MACs = [
        "hmac-sha2-256-etm@openssh.com"
        "hmac-sha2-512-etm@openssh.com"
        "umac-128-etm@openssh.com"
      ];

      X11Forwarding = false;
      AllowAgentForwarding = false;
      AllowTcpForwarding = false;
      PermitTunnel = "no";
      SyslogFacility = "AUTH";
      ClientAliveInterval = 60;
      ClientAliveCountMax = 2;
    };

    openFirewall = true;
  };
}
