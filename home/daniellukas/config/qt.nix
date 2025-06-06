{
  lib,
  pkgs,
  config,
  ...
}: {
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  xdg.configFile = {
    "Kvantum" = {
      source = "${pkgs.whitesur-kde}/share/Kvantum";
      recursive = true;
    };

    "Kvantum/kvantum.kvconfig".text = lib.generators.toINI {} {
      General.theme = "WhiteSurDark";
    };

    "qt5ct/qt5ct.conf".text = lib.generators.toINI {} {
      Appearance = {
        custom_palette = false;
        icon_theme = config.gtk.iconTheme.name;
        standard_dialogs = "xdgdesktopportal";
        style = "kvantum-dark";
      };

      Fonts = {
        fixed = ''"Maple Mono NF,12,-1,5,50,0,0,0,0,0,Regular"'';
        general = ''"Poppins,12,-1,5,50,0,0,0,0,0"'';
      };
    };

    "qt6ct/qt6ct.conf".text = lib.generators.toINI {} {
      Appearance = {
        custom_palette = false;
        icon_theme = config.gtk.iconTheme.name;
        standard_dialogs = "xdgdesktopportal";
        style = "kvantum-dark";
      };

      Fonts = {
        fixed = ''"Maple Mono NF,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"'';
        general = ''"Poppins,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"'';
      };
    };
  };
}
