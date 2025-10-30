{
  config.vim = {
    filetree.neo-tree = {
      enable = true;
      setupOpts = {
        hide_root_node = true;
        window.width = 25;
      };
    };

    keymaps = [
      {
        key = "<leader>e";
        mode = ["n"];
        action = "<cmd>Neotree toggle<CR>";
        desc = "Toggle [E]xplorer";
      }
      {
        key = "<leader>E";
        mode = ["n"];
        action = "<cmd>Neotree reveal<CR>";
        desc = "Reveal current file in [E]xplorer";
      }
    ];
  };
}
