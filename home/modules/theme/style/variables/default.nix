let
  blur = import ./blur.nix;
  borders = import ./borders.nix;
  color = import ./color.nix;
  opacity = import ./opacity.nix;
  allVariables =
    blur
    // borders
    // color
    // opacity;
in
  allVariables
