{pkgs, ...}: {
  vim = {
    assistant.copilot = {
      enable = true;
      cmp.enable = true;

      mappings = {
        suggestion = {
          accept = "<C-f>";
          acceptWord = "<C-j>";
          dismiss = "<C-]>";
        };
      };
    };
    utility.vim-wakatime.enable = true;

    presence.neocord = {
      enable = true;
      setupOpts = {
        logo = "https://pics.xhos.dev/u/ns8jGz.png";
      };
    };
    mini.indentscope = {
      enable = true;
      setupOpts = {
        symbol = "│";
        options.try_as_border = true;
      };
    };
  };
}
