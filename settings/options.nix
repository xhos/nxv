{
  config.vim = {
    options = {
      number = false; # hide line numbers
      relativenumber = false; # hide line numbers
      mouse = "a"; # enable mouse mode
      showmode = false; # don't show the mode, since it's already in the status line
      breakindent = true; # indent wrapped lines

      # set tab width to 2 spaces
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;

      # case-insensitive searching UNLESS \C or one or more capital letters in the search term
      ignorecase = true;
      smartcase = true;

      updatetime = 250; # decrease update time
      timeoutlen = 300; # decrease mapped sequence wait time

      # sets how neovim will display certain whitespace characters in the editor
      list = true;
      listchars = "tab:  ,trail:·,nbsp:␣";

      inccommand = "split"; # preview substitutions live, as you type
      fillchars = "eob: "; # hide ~ at end of buffer
      scrolloff = 10; # keep lines visible when scrolling

      # if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
      # instead raise a dialog asking if you wish to save the current file(s)
      confirm = true;
    };
    undoFile.enable = true; # persist history
    clipboard = {
      enable = true; # allow this module to manage clipboard
      registers = "unnamedplus"; # sync with system clipboard
    };
  };
}
