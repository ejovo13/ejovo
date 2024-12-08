{
  description = "Flake wrapper for ejovo repository";

  outputs = {self}: {
    defaultPackage.x86_64-linux = import ./default.nix;
    packages.x86_64-linux.fehWrapper = import ./default.nix;
  };
}
