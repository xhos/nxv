{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    git-hooks.url = "github:cachix/git-hooks.nix";
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    git-hooks,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    checks.${system} = {
      pre-commit = git-hooks.lib.${system}.run {
        src = ./.;
        hooks.alejandra.enable = true;
      };
    };

    devShells.${system}.default = pkgs.mkShell {
      shellHook = self.checks.${system}.pre-commit.shellHook;
    };

    formatter.${system} = pkgs.alejandra;

    packages.${system}.default =
      (nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [
          ./settings
          ./plugins
        ];
      }).neovim;
  };
}
