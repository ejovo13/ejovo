{
  description = "Flake wrapper for ejovo repository";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: {
    packages.x86_64-linux.default = import ./default.nix {
      pkgs = import nixpkgs {system = "x86_64-linux";};
    };
  };
}
