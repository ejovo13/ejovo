# Provide a wrapper around feh.
{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation {
  pname = "feh-with-action1";
  version = "1.0";
  src = ./.; # No source since this is just a wrapper.

  buildInputs = [pkgs.makeWrapper pkgs.feh pkgs.xclip];

  installPhase = ''
    mkdir -p $out/bin
    makeWrapper ${pkgs.feh}/bin/feh $out/bin/feh \
      --add-flags "--action1 'xclip -selection clipboard -t image/png -i %F'"
  '';

  meta = with pkgs.lib; {
    description = "Wrapped feh with predefined action1 for clipboard copying";
    license = licenses.gpl2Plus;
    maintainers = [maintainers.yourself];
  };
}
