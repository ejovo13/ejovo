{
  description = "Flake wrapper for ejovo repository";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: {
    defaultPackage.x86_64-linux = import ./default.nix {pkgs = nixpkgs;};
    packages.x86_64-linux.fehWrapper = import ./default.nix {pkgs = nixpkgs;};
  };
}
