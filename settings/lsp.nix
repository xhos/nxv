{
  vim = {
    lsp.enable = true;
    treesitter.enable = true;
    languages = {
      # global for all languages
      enableFormat = true;
      enableTreesitter = true;

      # per-language settings
      go.enable = true;
      nix.enable = true;
      ts.enable = true;
      rust.enable = true;
      clojure.enable = true;
    };
  };
}
