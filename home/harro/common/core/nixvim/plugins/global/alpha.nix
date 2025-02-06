{
  lib,
  config,
  ...
}: {
  options = {
    nvim.plugins.alpha.enable = lib.mkEnableOption "alpha";
  };

  config = lib.mkIf config.nvim.plugins.alpha.enable {
    programs.nixvim = {
      plugins.alpha = {
        enable = true;

        theme = null;

        layout = [
          {
            type = "padding";
            val = 2;
          }
          {
            opts = {
              hl = "Type";
              position = "center";
            };
            type = "text";
            val = [
              "          ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖             "
              "          ▜███▙       ▜███▙  ▟███▛             "
              "           ▜███▙       ▜███▙▟███▛              "
              "            ▜███▙       ▜██████▛               "
              "     ▟█████████████████▙ ▜████▛     ▟▙         "
              "    ▟███████████████████▙ ▜███▙    ▟██▙        "
              "           ▄▄▄▄▖           ▜███▙  ▟███▛        "
              "          ▟███▛             ▜██▛ ▟███▛         "
              "         ▟███▛               ▜▛ ▟███▛          "
              "▟███████████▛                  ▟██████████▙    "
              "▜██████████▛                  ▟███████████▛    "
              "      ▟███▛ ▟▙               ▟███▛             "
              "     ▟███▛ ▟██▙             ▟███▛              "
              "    ▟███▛  ▜███▙           ▝▀▀▀▀               "
              "    ▜██▛    ▜███▙ ▜██████████████████▛         "
              "     ▜▛     ▟████▙ ▜████████████████▛          "
              "           ▟██████▙       ▜███▙                "
              "          ▟███▛▜███▙       ▜███▙               "
              "         ▟███▛  ▜███▙       ▜███▙              "
              "         ▝▀▀▀    ▀▀▀▀▘       ▀▀▀▘              "
            ];
          }
          {
            type = "padding";
            val = 2;
          }
          {
            opts = {
              hl = "Type";
              position = "center";
            };
            type = "text";
            val = [
              "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
              "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
              "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
              "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
              "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
              "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
            ];
          }
          {
            type = "padding";
            val = 2;
          }
          {
            opts = {
              hl = "Keyword";
              position = "center";
            };
            type = "text";
            val = "Inspiring quote here.";
          }
        ];
      };
    };
  };
}
