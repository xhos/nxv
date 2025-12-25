{ lib, ... }: 
let
  # Define the button helper
  mkButton = { command, shortcut, text }: {
    type = "button";
    val = text;
    on_press = { 
      __raw = ''
        function()
          local key = vim.api.nvim_replace_termcodes("${command}", true, false, true)
          vim.api.nvim_feedkeys(key, "normal", false)
        end
      '';
    };
    opts = {
      inherit shortcut;
      keymap = [
        "n"
        shortcut
        command
        { noremap = true; silent = true; nowait = true; }
      ];
      position = "center";
      hl = "DashboardCenter";
      cursor = 3;
      width = 35;
      align_shortcut = "right";
      spacing = 1;
    };
  };
in {
  vim.dashboard.alpha = {
    enable = true;
    theme = null;
    
    layout = [
      {
        type = "text";
        val = [
          "                                              "
          "      ████ ██████           █████      ██"
          "     ███████████             █████ "
          "     █████████ ███████████████████ ███   ███████████"
          "    █████████  ███    █████████████ █████ ██████████████"
          "   █████████ ██████████ █████████ █████ █████ ████ █████"
          " ███████████ ███    ███ █████████ █████ █████ ████ █████"
          "██████  █████████████████████ ████ █████ █████ ████ ██████"
        ];
        opts = {
          position = "center";
          hl = "Type";
        };
      }

      { type = "padding"; val = 2; }

      {
        type = "group";
        opts = { spacing = 1; };
        val = map mkButton [
          {
            text = "new";
            shortcut = "e";
            command = "<CMD>ene <BAR> startinsert<CR>";
          }
          {
            text = "find";
            shortcut = "f";
            command = "<CMD>Telescope find_files<CR>";
          }
          {
            text = "recent";
            shortcut = "r";
            command = "<CMD>Telescope oldfiles<CR>";
          }
          {
            text = "quit";
            shortcut = "q";
            command = "<CMD>qa<CR>";
          }
        ];
      }
    ];
  };
  
  vim.visuals.nvim-web-devicons.enable = true;
}
