{config, ...}: {
  programs.hyprlock = {
    enable = true;
    settings = let
      inherit (config.theme.colorscheme) colors rgbaColors rgbaAltColors;
    in {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };

      background = [
        {
          monitor = "";
          path = "${config.theme.wallpaper}";
          blur_passes = 3;
          blur_size = 6;
          new_optimizations = true;
          ignore_opacity = false;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "300, 50";
          outline_thickness = 2;
          outer_color = "rgb(${colors.gray0})";
          inner_color = "rgb(${colors.black0})";
          font_color = "rgb(${colors.white})";
          check_color = "rgb(${colors.blue})";
          fail_color = "rgb(${colors.red})";
          fade_on_empty = false;
          placeholder_text = "<i>Enter Password</i>";
          dots_spacing = 0.2;
          dots_center = true;
          position = "0, 0";
          valign = "center";
          halign = "center";
        }
      ];

      label = [
        {
          monitor = "";
          text = "cmd[update:3600000] date +'%A, %B %d'";
          font_family = "Crimson Pro Font Bold";
          font_size = 36;
          color = "rgb(${colors.white})";
          position = "0, -300";
          valign = "top";
          halign = "center";
        }
        {
          monitor = "";
          text = "$TIME12";
          font_family = "Crimson Pro Font Bold";
          font_size = 132;
          color = "rgb(${colors.white})";
          position = "0, -400";
          valign = "top";
          halign = "center";
        }
        {
          monitor = "";
          text = "   $USER";
          font_family = "Crimson Pro Font Bold";
          font_size = 24;
          color = "rgb(${colors.white})";
          position = "0, 100";
          valign = "center";
          halign = "center";
        }
      ];
      shape = [
        {
          monitor = "";
          size = "1024, 512";
          color = "${rgbaAltColors.black2}";
          rounding = 24; # circle
          border_size = 1;
          border_color = "${rgbaColors.gray0}";

          position = "0, 0";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
