let
  inherit
    (import ./color.nix)
    borderColorHexDark
    borderColorHexDarkAlpha
    borderColorHexLight
    borderColorHexLightAlpha
    # overlayBorderDarkAlpha
    overlayBorderLightAlpha
    ;
  # borderSize = "1px";
in rec {
  borderSize = 1;
  borderSizePx = "${toString borderSize}px";
  borderSolidDark = "${borderSizePx} solid ${borderColorHexDark}";
  borderSolidDarkAlpha = "${borderSizePx} solid ${borderColorHexDarkAlpha}";
  borderSolidLight = "${borderSizePx} solid ${borderColorHexLight}";
  borderSolidLightAlpha = "inset 0 0 0 ${borderSizePx} ${borderColorHexLightAlpha}";
  borderSolidOverlayAlpha = "inset 0 0 0 ${borderSizePx} ${borderColorHexDark}, inset 0 0 0 ${toString (borderSize * 2)} ${overlayBorderLightAlpha}";
  borderSolidOverlayDark = "${borderSizePx} solid ${borderColorHexDark}";
  borderSolidOverlayLightAlpha = "inset 0 0 0 ${borderSizePx} ${overlayBorderLightAlpha}";
}
