let
  colors = import ../../../theme/colors.nix;
  inherit (import ../variables/opacity.nix) baseOpacity inherentOpacity inactiveOpacity overlayBorderOpacity overlayOpacity;
in rec {
  baseColor = "${colors.gray0}";
  baseColorHex = "#${baseColor}";
  baseColorHexAlpha = "alpha(${baseColorHex}, ${baseOpacity})";
  inherentColor = "${colors.white}";
  inherentColorHex = "#${inherentColor}";
  inherentColorHexAlpha = "alpha(${inherentColorHex}, ${inherentOpacity})";
  inactiveColorHex = "${inherentColorHex}";
  inactiveColorHexAlpha = "alpha(${inherentColorHex}, ${inactiveOpacity})";

  borderColor = "${colors.black0}";
  borderColorHexDark = "#${borderColor}";
  borderColorHexDarkAlpha = "alpha(${borderColorHexDark}, ${baseOpacity})";
  borderColorHexLight = "${inherentColorHex}";
  borderColorHexLightAlpha = "alpha(${borderColorHexLight}, ${baseOpacity})";

  overlayBaseColor = "${colors.black3}";
  overlayBaseColorHex = "#${overlayBaseColor}";
  overlayBaseColorHexAlpha = "alpha(${overlayBaseColorHex}, ${overlayOpacity})";
  overlayBorderDarkAlpha = "alpha(${borderColorHexDark}, ${overlayBorderOpacity})";
  overlayBorderLightAlpha = "alpha(${borderColorHexLight}, ${overlayBorderOpacity})";
}
