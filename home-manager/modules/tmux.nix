{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    tmux.enable = lib.mkEnableOption "tmux";
  };

  config = lib.mkIf config.tmux.enable {
    home.packages = with pkgs; [
      tmux
    ];

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
  };
}
