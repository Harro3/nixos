{ config, pkgs, ... }:

{
  imports = [
    ./modules/firefox.nix

    ./modules/zsh.nix
    ./modules/tmux.nix

    ./modules/mako.nix

     ./modules/hyprland/hyprland.nix
     ./modules/hyprland/hypridle.nix
     ./modules/hyprland/hyprpaper.nix
     ./modules/hyprland/hyprlock.nix
  ];

  home.username = "harro";
  home.homeDirectory = "/home/harro";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "24.05";

  wallpaper = ./wallpapers/mountains.jpg;

  
  home.packages = with pkgs;[
    slack
    discord
    spotify
    tmux
    nh
    nerdfonts
    sesh
    neovim

    waybar
    wofi
    wl-clipboard
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/hypr/hyprland.conf".source = dotfiles/hypr/hyprland.conf;
    ".config/kitty".source = dotfiles/kitty;
    ".config/waybar".source = dotfiles/waybar;
    ".config/wofi".source = dotfiles/wofi;
  };

  home.sessionVariables = {
    EDITOR = "neovim";
  };



  home.file.".config/hypr/scripts/volume.sh".text = ''
#!/bin/sh

volume_step=1
max_volume=100

get_volume() {
	pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]{1,3}(?=%)' | head -1
}

get_mute() {
	pactl get-sink-mute @DEFAULT_SINK@ | grep -Po '(?<=Mute: )(yes|no)'
}

display_volume() {
	volume=$(get_volume)
	mute=$(get_mute)

	if [ "$volume" -eq 0 ] || [ "$mute" = "yes" ] ; then
		volume_icon=""
	elif [ "$volume" -lt 50 ]; then
		volume_icon=""
	else
		volume_icon=""
	fi

	notify-send -h string:x-canonical-private-synchronous:sys-notify -t 1000 -u normal "$volume_icon $volume%" -h int:value:$volume
}

case $1 in
    up)
    pactl set-sink-mute @DEFAULT_SINK@ 0
    volume=$(get_volume)
    if [ $(( "$volume" + "$volume_step" )) -gt $max_volume ]; then
        pactl set-sink-volume @DEFAULT_SINK@ $max_volume%
    else
        pactl set-sink-volume @DEFAULT_SINK@ +$volume_step%
    fi
    display_volume
    ;;

     down)
    # Raises volume and displays the notification
    pactl set-sink-volume @DEFAULT_SINK@ -$volume_step%
    display_volume
    ;;

    mute)
    # Toggles mute and displays the notification
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    display_volume
    ;;
esac

  '';

  home.file.".config/hypr/scripts/brightness.sh".text = ''
#!/bin/sh

get_brightness() {
	brightnessctl i | grep -o '[0-9]*%' | sed 's/.$//'
}


show_brightness() {
	brightness=$(get_brightness)
	notify-send -h string:x-canonical-private-synchronous:sys-notify -t 1000 -u normal " $brightness%" -h int:value:$brightness
}

brightness_down() {
	brightnessctl s 5%-
	show_brightness
}

brightness_up() {
	brightnessctl s 5%+
	show_brightness
}

case "$1" in
	up)
		brightness_up
		;;
	down)
		brightness_down
		;;
esac

'';


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
