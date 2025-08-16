let
  colors = import ../../../theme/colors;
  inherit (import ../variables/opacity.nix) baseOpacity inherentOpacity inactiveOpacity overlayBorderOpacity overlayOpacity;
in rec {
  baseColor = "${colors.icDark.gray3}";
  baseColorHex = "#${baseColor}";
  baseColorHexAlpha = "alpha(${baseColorHex}, ${baseOpacity})";
  inherentColor = "${colors.icDark.white}";
  inherentColorHex = "#${inherentColor}";
  inherentColorHexAlpha = "alpha(${inherentColorHex}, ${inherentOpacity})";
  inactiveColorHex = "${inherentColorHex}";
  inactiveColorHexAlpha = "alpha(${inherentColorHex}, ${inactiveOpacity})";

  borderColor = "${colors.icDark.black2}";
  borderColorHexDark = "#${borderColor}";
  borderColorHexDarkAlpha = "alpha(${borderColorHexDark}, ${baseOpacity})";
  borderColorHexLight = "${inherentColorHex}";
  borderColorHexLightAlpha = "alpha(${borderColorHexLight}, ${baseOpacity})";

  overlayBaseColor = "${colors.icDark.gray5}";
  overlayBaseColorHex = "#${overlayBaseColor}";
  overlayBaseColorHexAlpha = "alpha(${overlayBaseColorHex}, ${overlayOpacity})";
  overlayBorderDarkAlpha = "alpha(${borderColorHexDark}, ${overlayBorderOpacity})";
  overlayBorderLightAlpha = "alpha(${borderColorHexLight}, ${overlayBorderOpacity})";
}
