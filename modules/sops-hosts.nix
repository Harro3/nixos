{
  lib,
  config,
  inputs,
  ...
}: {
  options = {
    sops-hosts.enable = lib.mkEnableOption "sops hosts";
  };
  config = lib.mkIf config.sops-hosts.enable {
    sops = {
      defaultSopsFile = ../secrets.yaml;
      validateSopsFiles = false;

      age = {
        sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
        keyFile = "/var/lib/sops-nix/key.txt";
        generateKey = true;
      };
    };
  };
}
