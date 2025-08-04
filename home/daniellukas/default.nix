{lib, ...}: let
  colorsDef = import ../modules/theme/colors.nix;
  colorlib = import ../modules/theme/colorsLib.nix lib;
  variableDefs = import ../modules/theme/style/variables;
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

    style = {
      variables = variableDefs;
    };

    wallpaper = ./wallpapers/SequoiaDark.png;
  };
  # wayland.windowManager.hyprland.importantPrefixes = ["output"];

  wayland.windowManager.hyprland.settings =
    # let
    #   # Generated using https://gist.github.com/fufexan/e6bcccb7787116b8f9c31160fc8bc543
    #   accelpoints = "0.000 0.053 0.115 0.189 0.280 0.391 0.525 0.687 0.880 1.108 1.375 1.684 2.040 2.446 2.905 3.422 4.000 4.643 5.355 6.139";
    # in
    {
      monitor = [
        # name, resolution, position, scale
        "eDP-1, 3840x2400@59.994, 1280x1440, 1.600000"
        "DP-3, 3840x2160@60, 0x0, 1.500000"
        "DP-12, 3840x2160@60, 2560x0, 1.500000"
      ];

      # monitorv2 = [
      #   {
      #     output = "eDP-1";
      #     mode = "3840x2400@59.994";
      #     position = "1280x1440";
      #     scale = "1.600000";
      #   }
      #   {
      #     output = "DP-3";
      #     mode = "3840x2160@60";
      #     position = "0x0";
      #     scale = "1.500000";
      #   }
      #   {
      #     output = "DP-12";
      #     mode = "3840x2160@60";
      #     position = "2560x0";
      #     scale = "1.500000";
      #   }
      # ];

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
