{
  perSystem = {pkgs, ...}: {
    packages = {
      lightctl = pkgs.callPackage ./lightctl {};
      networkctl = pkgs.callPackage ./networkctl {};
      mactahoe-gtk-theme = pkgs.callPackage ./mactahoe-gtk-theme {};
      mactahoe-icon-theme = pkgs.callPackage ./mactahoe-icon-theme {};
      volumectl = pkgs.callPackage ./volumectl {};
    };
  };
}
