{
  lib,
  config,
  ...
}: {
  options = {
    nvim.plugins.dap.enable = lib.mkEnableOption "dap";
  };

  config = lib.mkIf config.nvim.plugins.dap.enable {
    programs.nixvim = {
      plugins.dap.enable = true;
      plugins.dap-ui.enable = true;

      plugins.dap-python.enable = config.nvim.lang.python.enable;

      plugins.dap.luaConfig.post = ''
        local dap = require("dap")
        local dapui = require("dapui")

        dap.listeners.before.attach.dapui_config = function()
          dapui.open()
        end

        dap.listeners.before.launch.dapui_config = function()
          dapui.open()
        end

        dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
        end

        dap.listeners.before.event_exited.dapui_config = function()
          dapui.close()
        end
      '';

      keymaps = [
        {
          mode = "n";
          key = "<leader>dt";
          options.desc = "Debug Toggle breakpoint";
          action = ":lua require('dap').toggle_breakpoint()<CR>";
        }
        {
          mode = "n";
          key = "<leader>dc";
          options.desc = "Debug Continue";
          action = ":lua require('dap').continue()<CR>";
        }
        {
          mode = "n";
          key = "<leader>dn";
          options.desc = "Debug Next (step over)";
          action = ":lua require('dap').step_over()<CR>";
        }
        {
          mode = "n";
          key = "<leader>ds";
          options.desc = "Debug Step (step into)";
          action = ":lua require('dap').step_into()<CR>";
        }
      ];
    };
  };
}
