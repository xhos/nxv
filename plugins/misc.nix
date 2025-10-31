{pkgs, ...}: {
  vim = {
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
