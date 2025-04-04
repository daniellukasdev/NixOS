{lib, ...}: let
  colorsDef = import ../modules/theme/colors.nix;
  colorlib = import ../modules/theme/colorsLib.nix lib;
in {
  imports = [
    ./config
    ./editors/vscode
    ./packages
    ./programs
    ./services
    ./shell/zsh
    ./window-managers/hyprland

    ./home.nix
  ];

  theme = {
    colorscheme = rec {
      colors = colorsDef;
      # #RRGGBB
      xcolors = lib.mapAttrsRecursive (_: colorlib.x) colors;
      # rgba(,,,) colors (css)
      rgbaColors = lib.mapAttrsRecursive (_: colorlib.rgba) colors;
      rgba48Colors = lib.mapAttrsRecursive (_: colorlib.rgba48) colors;
      rgbaAltColors = lib.mapAttrsRecursive (_: colorlib.rgba48) colors;
    };

    wallpaper = ./wallpapers/big-sur-light.jpg;
  };

  wayland.windowManager.hyprland.settings =
    # let
    #   # Generated using https://gist.github.com/fufexan/e6bcccb7787116b8f9c31160fc8bc543
    #   accelpoints = "0.000 0.053 0.115 0.189 0.280 0.391 0.525 0.687 0.880 1.108 1.375 1.684 2.040 2.446 2.905 3.422 4.000 4.643 5.355 6.139";
    # in
    {
      monitor = [
        # name, resolution, position, scale
        "eDP-1, preferred, auto, 1.600000"
      ];

      device = {
        # accel_profile = "custom ${accelpoints}";
        enabled = true;
        # $ hyprctl devices
        name = "ven_04f3:00-04f3:311c-touchpad";
        natural_scroll = true;
        # scroll_points = accelpoints;
      };
    };
}
