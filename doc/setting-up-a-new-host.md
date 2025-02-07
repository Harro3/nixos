# Setting up a new host

This document goes through the steps to take in order to add a new host to be managed by the config.
The process described here is quite long, I plan on maybe making it more automated if I find the need to.

## Install basic NixOS

- Boot on the **NixOS** iso image
- Start the installer
- Install nixos (with or without a DE)
- Reboot on fresh install
- Enter a dev shell with needed tools

```sh
nix-shell -p git vim sops ssh-to-age
```

- Add a root channel:

```sh
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --update nixos
```

- Add those lines to `/etc/nixos/configuration.nix`:

```nix
services.openssh.enable = true;
nix.settings.experimental-features = ["nix-command" "flakes"];
```

- Rebuild the system:

```sh
sudo nixos-rebuild switch
```

## Gain access to config repos

- Generate a temporary ssh key for your user (we will delete it soon)
- Add the ssh key to your github / gitlab account (with the config and secrets repos)
- Clone both repos, in my case:

```sh
git clone git@github.com:Harro3/nixos.git
git clone git@github.com:Harro3/nix-secrets.git
```

## Setup secrets

- Get your private age key and store it in `~/.config/sops/age/keys.txt`:

```sh
mkdir -p ~/.config/sops/age
echo '<my-age-key>' > ~/.config/sops/age/keys.txt
```

- Get and copy your host's age key:

```sh
cat /etc/ssh/ssh_host_ed25519_key.pub | ssh-to-age
```

- Add the new host and age key in the `nix-secrets/.sops.yaml` file
- Update the keys:

```sh
sops --config nix-secrets/.sops.yaml updatekeys nix-secrets/.sops.yaml
```

- Update the repo (git add / commit / push)

## Setup The host's config

- Go to the nixos config dir:

```sh
cd nixos
```

- Create the host's config file:

```sh
mkdir -p hosts/nixos/<host-name>
touch hosts/nixos/<host-name>/default.nix
```

- Edit the config as you like, enable at least one user
- For each user created, create and edit the file: `home/<user-name>/<host-name>/nix`
- Copy the hardware config:

```sh
cp /etc/nixos/hardware-configuration.nix hosts/nixos/<host-name>
```

- Update the secrets input:

```sh
nix flake update secrets
```

- Build the system

```sh
sudo nixos-rebuild boot --flake .#<host-name>
```

- Reboot

## Cleanup

- Remove the ssh key from github
- run a `nh clean all`
