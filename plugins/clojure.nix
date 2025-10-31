{pkgs, ...}: {
  vim = {
    repl.conjure.enable = true;
    luaConfigRC.conjure-auto-repl = let
      bb-nrepl-wrapper = pkgs.writeShellScript "bb-nrepl-wrapper" ''
        PORT=$(${pkgs.coreutils}/bin/shuf -i 1024-65535 -n 1)
        echo $PORT > .nrepl-port
        trap "rm -f .nrepl-port" EXIT
        ${pkgs.babashka}/bin/bb --nrepl-server $PORT
      '';
    in ''
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = true
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] = "${bb-nrepl-wrapper}"
    '';
  };
}
