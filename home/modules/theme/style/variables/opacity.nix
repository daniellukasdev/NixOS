let
  baseOpacity = 0.16;
  baseOpacityRule = 0.16 - 0.01;
  inherentOpacity = baseOpacity * 1.5;
  inactiveOpacity = inherentOpacity * 2;
  dockOpacity = (inherentOpacity * 2) - 0.1;
  overlayBorderOpacity = baseOpacity;
  overlayOpacity = inherentOpacity * 2;
  windowOpacity = 1.0 - baseOpacity;
  opacities = {
    baseOpacity = "${toString baseOpacity}";
    baseOpacityRule = "${toString baseOpacityRule}";
    dockOpacity = "${toString dockOpacity}";
    inherentOpacity = "${toString inherentOpacity}";
    inactiveOpacity = "${toString inactiveOpacity}";
    overlayOpacity = "${toString overlayOpacity}";
    overlayBorderOpacity = "${toString overlayBorderOpacity}";
    windowOpacity = windowOpacity;
    windowOpacityInt = builtins.floor (baseOpacity * 100);
  };
in
  opacities
