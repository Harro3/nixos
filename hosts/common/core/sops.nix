{
  inputs,
  vars,
  config,
  ...
}: let
  secretspath = builtins.toString inputs.secrets;
  homeDirectory = "/home/${vars.mainUser}";
in {
  sops = {
    defaultSopsFile = "${secretspath}/secrets.yaml";
    validateSopsFiles = false;

    age = {
      sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };

    secrets = {
      "yubico/u2f_keys" = {
        owner = config.users.users.${vars.mainUser}.name;
        inherit (config.users.users.${vars.mainUser}) group;
        path = "${homeDirectory}/.config/Yubico/u2f_keys";
      };
    };
  };
}
