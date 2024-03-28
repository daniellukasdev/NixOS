{
  config,
  inputs,
  pkgs,
  ...
}: let
  whitesur-icon-theme = inputs.self.packages.${pkgs.system}.whitesur-icon-theme;
in {
  gtk = {
    enable = true;

    # font = {
    #   name = "Inter";
    #   package = pkgs.google-fonts.override {fonts = ["Inter"];};
    #   size = 11;
    # };

    font = {
      name = "Fira";
      package = pkgs.fira;
      size = 12;
    };

    iconTheme = {
      name = "WhiteSur";
      package = whitesur-icon-theme.override {
        alternativeIcons = true;
        boldPanelIcons = true;
        # themeVariants = ["default"];
      };
      # name = "Colloid-dark";
      # package = pkgs.colloid-icon-theme;
    };

    # theme = {
    #   name = "adw-gtk3-dark";
    #   package = pkgs.adw-gtk3;
    # };

    theme = {
      name = "WhiteSur-Dark";
      package = pkgs.whitesur-gtk-theme.override {
        roundedMaxWindow = true;
      };
      # name = "Colloid-Dark";
      # package = pkgs.colloid-gtk-theme;
    };

    # theme = {
    #   name = "Graphite-Dark-nord";
    #   package = pkgs.graphite-gtk-theme.override {
    #     # themeVariants = ["blue"];
    #     tweaks = ["nord" "colorful"];
    #   };
    # };

    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = ''
        gtk-xft-antialias=1
        gtk-xft-hinting=1
        gtk-xft-hintstyle="hintfull"
        gtk-xft-rgba="rgb"
      '';
    };

    gtk3 = {
      bookmarks = [
        "file://${config.home.homeDirectory}/Documents"
        "file://${config.home.homeDirectory}/Downloads"
        "file://${config.home.homeDirectory}/Music"
        "file://${config.home.homeDirectory}/Pictures"
        "file://${config.home.homeDirectory}/Videos"
      ];

      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
        gtk-decoration-layout = "menu:";

        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintfull";
        gtk-xft-rgba = "rgb";
      };
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-decoration-layout = "menu:";
    };
  };

  home = {
    sessionVariables = {
      GTK_THEME = config.gtk.theme.name;
    };
  };
}
