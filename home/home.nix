{ config, pkgs, ... }:

{
  imports = [
    ./modules/firefox.nix

    ./modules/zsh.nix
    ./modules/tmux.nix

    ./modules/mako.nix

     ./modules/hyprland/hyprland.nix
     ./modules/hyprland/hypridle.nix
  ];
  home.username = "harro";
  home.homeDirectory = "/home/harro";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "24.05";

  
  programs.btop.catppuccin.enable = true;


  # The home.packages option allows you to install Nix packages into your
  # environment.
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
    hyprpaper
    wl-clipboard
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    "Pictures/wallpapers".source = dotfiles/wallpapers;

    ".config/hypr/hyprland.conf".source = dotfiles/hypr/hyprland.conf;
    ".config/hypr/hyprpaper.conf".source = dotfiles/hypr/hyprpaper.conf;
    ".config/kitty".source = dotfiles/kitty;
    ".config/waybar".source = dotfiles/waybar;
    ".config/wofi".source = dotfiles/wofi;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/harro/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "neovim";
  };

  

  programs.hyprlock = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      general = {
        hide_cursor = true;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 2;
          blur_size = 6;
          color = "$base";
        }
      ];

      label = [
      {
        text = "Layout: $LAYOUT";
        color = "$text";
        font_size = 25;
        font_family = "$font";
        position = "30, -30";
        halign = "left";
        valign = "top";
      }
      {
        text = "$TIME";
        color = "$text";
        font_size = 90;
        font_family = "$font";
        position = "-30, 0";
        halign = "right";
        valign = "top";
      }
      {
        text = ''cmd[update:43200000] date +"%A, %d %B %Y"'';
        color = "$text";
        font_size = 25;
        font_family = "$font";
        position = "-30, -150";
        halign = "right";
        valign = "top";
      }
      ];
      input-field = {
        size = "300, 60";
        outline_thickness = 4;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "$lavender";
        inner_color = "$surface0";
        font_color = "$text";
        fade_on_empty = false;
        placeholder_text = ''<span foreground="##$textAlpha"><i>󰌾 Logged in as </i><span foreground="##$accentAlpha">$USER</span></span>'';
        hide_input = false;
        check_color = "$accent";
        fail_color = "$red";
        fail_text = ''<i>$FAIL <b>($ATTEMPTS)</b></i>'';
        capslock_color = "$yellow";
        position = "0, -47";
        halign = "center";
        valign = "center";
      };
    };
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
