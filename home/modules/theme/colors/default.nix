let
  dark = import ./dark.nix;
  icDark = import ./icDark.nix;
  icLight = import ./icLight.nix;
  light = import ./light.nix;
  allColors = {
    inherit dark;
    inherit icDark;
    inherit icLight;
    inherit light;
  };
in
  allColors
