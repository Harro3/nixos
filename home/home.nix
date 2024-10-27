{ config, pkgs, ... }:

{
  imports = [
    ./modules/zsh.nix
  ];
  home.username = "harro";
  home.homeDirectory = "/home/harro";

  wayland.windowManager.hyprland.xwayland.enable = true;
  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "24.05";

  programs.bat.catppuccin.enable = true;
  programs.fzf.catppuccin.enable = true;
  programs.yazi.catppuccin.enable = true;
  wayland.windowManager.hyprland.catppuccin.enable = true;
  
  services.mako.enable = true;
  services.mako.catppuccin.enable = true;
  services.hypridle.enable = true;

  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      yank
    ];
    extraConfig = ''
unbind r
set-option -sa terminal-overrides ",xterm*:Tc"
set-option -g default-shell ${pkgs.zsh}/bin/zsh
set -g default-terminal "screen-256color"

set -g prefix C-a
set -g mouse on
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R

bind C-l send-keys 'C-l'

set -g base-index 1
set -g pane-base-index 1
set-window-option -g pane-base-index 1
set-option -g renumber-windows on

set-option -g status-position top

setw -g mode-keys vi
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
set -g set-clipboard on

bind '"' split-window -v -c "$\{pane_current-path}"
bind % split-window -h -c "$\{pane_current_path}"


set -g @catppuccin_directory_text "#{pane_current_path}" 

set -gq allow-passthrough on
'';
  catppuccin = {
    enable = true;
    extraConfig = ''
set -g @catppuccin_window_left_separator ""
set -g @catppuccin_window_right_separator " "
set -g @catppuccin_window_middle_separator " █"
set -g @catppuccin_window_number_position "right"

set -g @catppuccin_window_default_fill "number"
set -g @catppuccin_window_default_text "#W"

set -g @catppuccin_window_current_fill "number"
set -g @catppuccin_window_current_text "#W"

set -g @catppuccin_status_modules_right "directory user host session"
set -g @catppuccin_status_left_separator  " "
set -g @catppuccin_status_right_separator ""
set -g @catppuccin_status_fill "icon"
set -g @catppuccin_status_connect_separator "no"
'';
    };
  };

  programs.btop.catppuccin.enable = true;

    programs.firefox = {
      enable = true;
      languagePacks = [ "de" "en-US" ];

      /* ---- POLICIES ---- */
      # Check about:policies#documentation for options.
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value= true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
        DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
        SearchBar = "unified"; # alternative: "separate"

        /* ---- EXTENSIONS ---- */
        # Check about:support for extension/add-on ID strings.
        # Valid strings for installation_mode are "allowed", "blocked",
        # "force_installed" and "normal_installed".
        ExtensionSettings = {
          # "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
          # Bitwarden
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
            installation_mode = "force_installed";
          };
          # Catppuccin
          "{8446b178-c865-4f5c-8ccc-1d7887811ae3}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-mocha-lavender-git/latest.xpi";
            installation_mode = "force_installed";
          };
        };
      };
    };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs;[
    btop
    slack
    discord
    spotify
    tmux
    nh
    fastfetch
    libnotify
    yazi
    nerdfonts
    sesh
    zoxide
    bat
    eza
    fzf
    tmux
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

    ".config/dunst".source = dotfiles/dunst;
    # ".config/hypr/hyprlock.conf".source = dotfiles/hypr/hyprlock.conf;
    ".config/hypr/hyprland.conf".source = dotfiles/hypr/hyprland.conf;
    ".config/hypr/hyprpaper.conf".source = dotfiles/hypr/hyprpaper.conf;
    # ".config/hypr/mocha.conf".source = dotfiles/hypr/mocha.conf;
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

  services.hypridle.settings = {
    general = {
      lock_cmd = "pidof hyprlock || hyprlock";
      before_sleep_cmd = "loginctl lock-session";
      after_sleep_cmd = "hyprctl dispatch dpms on";
    };

    listener = [
      {
        timeout = 150;
        on-timeout = "brightnessctl -s set 10%";
        on-resume = "brightnessctl -r";
      }
      {
        timeout = 180;
        on-timeout = "loginctl lock-session";
      }
      {
        timeout = 300;
        on-timeout = "hyprctl dispatch dpms off";
        on-resume = "hyprctl dispatch dpms on";
      }
      {
        timeout = 1800;
        on-timeout = "systemctl suspend";
      }
    ];
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
