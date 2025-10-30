{pkgs, ...}: let
  min-theme-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "min-theme.nvim";
    version = "2024-12-16";
    src = pkgs.fetchFromGitHub {
      owner = "datsfilipe";
      repo = "min-theme.nvim";
      rev = "29fe6f031202619e6285789f47ce37ead5165b8d";
      hash = "sha256-qkXSNFjvUZxUswfPQx0Tlp9USLySjH9rxDyRz6pYiRM=";
    };
    doCheck = false;
  };
in {
  vim = {
    repl.conjure.enable = true;

    extraPlugins.min-theme = {
      package = min-theme-nvim;
      setup = ''
        require('min-theme').setup(${pkgs.lib.generators.toLua {} {
          transparent = true;
        }})
        vim.cmd.colorscheme('min-theme')
      '';
    };

    telescope = {
      enable = true;
      extensions = [
        {
          name = "fzf";
          packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
          setup = {};
        }
        {
          name = "ui-select";
          packages = [pkgs.vimPlugins.telescope-ui-select-nvim];
          setup = {
            ui-select = {
              __raw = "require('telescope.themes').get_dropdown()";
            };
          };
        }
      ];
      setupOpts = {
        defaults = {
          prompt_prefix = "> ";
          layout_config = {
            horizontal = {
              prompt_position = "bottom";
            };
          };
        };
      };
      mappings = {
        helpTags = "<leader>sh";
        findFiles = "<leader>sf";
        liveGrep = "<leader>sg";
        diagnostics = "<leader>sd";
        resume = "<leader>sr";
        buffers = "<leader><leader>";
      };
    };
    filetree.neo-tree = {
      enable = true;
      setupOpts = {
        hide_root_node = true;
        window.width = 25;
      };
    };

    keymaps = [
      # Telescope custom keymaps
      {
        key = "<leader>sk";
        mode = ["n"];
        action = "<cmd>Telescope keymaps<CR>";
        desc = "[S]earch [K]eymaps";
      }
      {
        key = "<leader>ss";
        mode = ["n"];
        action = "<cmd>Telescope builtin<CR>";
        desc = "[S]earch [S]elect Telescope";
      }
      {
        key = "<leader>sw";
        mode = ["n"];
        action = "<cmd>Telescope grep_string<CR>";
        desc = "[S]earch current [W]ord";
      }
      {
        key = "<leader>s.";
        mode = ["n"];
        action = "<cmd>Telescope oldfiles<CR>";
        desc = "[S]earch Recent Files (\".\" for repeat)";
      }
      {
        key = "<leader>/";
        mode = ["n"];
        action = "function() require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ winblend = 10, previewer = false })) end";
        lua = true;
        desc = "[/] Fuzzily search in current buffer";
      }
      {
        key = "<leader>s/";
        mode = ["n"];
        action = "function() require('telescope.builtin').live_grep({ grep_open_files = true, prompt_title = 'Live Grep in Open Files' }) end";
        lua = true;
        desc = "[S]earch [/] in Open Files";
      }
      {
        key = "<leader>sn";
        mode = ["n"];
        action = "function() require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') }) end";
        lua = true;
        desc = "[S]earch [N]eovim files";
      }
    ];
  };
}
