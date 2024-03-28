{
  lib,
  stdenv,
  fetchgit,
}:
stdenv.mkDerivation rec {
  name = "firefox-whitesur-theme";
  # version = "master";

  src = fetchgit {
    url = "https://github.com/vinceliuice/WhiteSur-gtk-theme.git";
    sparseCheckout = [
      "src/other/firefox"
    ];
    sha256 = "sha256-b5lbRckSQlo2sLfYZtXKrhFoFA8kmfLpyBXkUS2Tx14=";
  };

  dontConfigure = true;
  dontBuild = true;
  doCheck = false;

  installPhase = ''
    mkdir -p $out/share/firefox-whitesur-theme
    cp -r $src/* $out/share/firefox-whitesur-theme
  '';

  meta = with lib; {
    description = "This is a bunch of CSS code to make Firefox look closer to MacOSX Safari theme. Based on https://github.com/rafaelmardojai/firefox-gnome-theme";
    homepage = "https://github.com/vinceliuice/WhiteSur-gtk-theme/tree/master/src/other/firefox";
    license = licenses.gpl3Only;
  };
}
