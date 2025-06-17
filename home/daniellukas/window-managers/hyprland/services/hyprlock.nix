{config, ...}: {
  programs.hyprlock = {
    enable = true;
    settings = let
      inherit (config.theme.colorscheme) colors rgbaColors rgbaAltColors;
      inherit (config.theme.style.variables) baseColor blurPasses blurSize borderSize;
      # inherit (config.theme) wallpaper;
    in {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };

      background = [
        {
          monitor = "";
          path = "screenshot";
          blur_passes = blurPasses;
          blur_size = blurSize;
          new_optimizations = true;
          ignore_opacity = false;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "300, 50";
          outline_thickness = 2;
          outer_color = "rgb(${baseColor})";
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
          size = "1027, 515";
          color = "${rgbaAltColors.black3}";
          rounding = 24; # circle
          border_size = borderSize;
          border_color = "${rgbaColors.black0}";

          position = "0, 0";
          halign = "center";
          valign = "center";
          zindex = 0;

          shadow_passes = 2;
          shadow_size = 4;
          shadow_color = "${rgbaColors.black1}";
          shadow_boost = 0.48;
        }
        {
          monitor = "";
          size = "1024, 512";
          # color = "${rgbaAltColors.black3}";
          color = "none";
          rounding = 24; # circle
          border_size = borderSize;
          border_color = "${rgbaColors.gray1}";

          position = "0, 0";
          halign = "center";
          valign = "center";
          zindex = 1;
        }
      ];
    };
  };
}
