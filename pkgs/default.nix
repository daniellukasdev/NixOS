{
  systems = ["x86_64-linux"];

  perSystem = {pkgs, ...}: {
    packages = {
      firefox-gnome-theme = pkgs.callPackage ./firefox-gnome-theme {};
      firefox-whitesur-theme = pkgs.callPackage ./firefox-whitesur-theme {};
      whitesur-icon-theme = pkgs.callPackage ./whitesur-icon-theme {};
    };
  };
}
