{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
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
