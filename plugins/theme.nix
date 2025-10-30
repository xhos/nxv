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
  vim.extraPlugins.min-theme = {
    package = min-theme-nvim;
    setup = ''
      require('min-theme').setup(${pkgs.lib.generators.toLua {} {
        transparent = true;
      }})
      vim.cmd.colorscheme('min-theme')
    '';
  };
}
