# Wrapper around cmake to always export compile commands for clangd
{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation {
  pname = "cmakeWrapper";
  version = "0.1.0";
  src = null; # No source since this is just a wrapper.

  buildInputs = [pkgs.makeWrapper pkgs.cmake];

  installPhase = ''
    mkdir -p $out/bin
    makeWrapper ${pkgs.cmake}/bin/cmake $out/bin/cmake \
      --add-flags "-DCMAKE_EXPORT_COMPILE_COMMANDS=1"
  '';

  meta = with pkgs.lib; {
    description = "Wrapped cmake command to build compilation_commands.json for clangd.";
    license = licenses.gpl2Plus;
    maintainers = [maintainers.yourself];
  };
}
