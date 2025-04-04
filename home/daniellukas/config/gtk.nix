{
  config,
  pkgs,
  ...
}: {
  gtk = {
    enable = true;

    font = {
      name = "Geist";
      package = pkgs.geist-font;
      # name = "Inter";
      # package = pkgs.google-fonts.override {fonts = ["Inter"];};
      size = 12;
    };

    theme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme;
    };

    iconTheme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-icon-theme;
    };

    # iconTheme = {
    #   name = "Papirus-Dark";
    #   package = pkgs.papirus-icon-theme;
    # };

    # iconTheme = {
    #   name = "WhiteSur-Dark";
    #   package = pkgs.whitesur-icon-theme;
    # };

    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = ''
        gtk-application-prefer-dark-theme = true
        gtk-icon-theme-name="Colloid-Dark"
        gtk-theme-name="Colloid-Dark"
        gtk-xft-antialias=1
        gtk-xft-hinting=1
        gtk-xft-hintstyle="hintfull"
        gtk-xft-rgba="rgb"
      '';
    };

    gtk3 = {
      # bookmarks = [
      #   "file://${config.home.homeDirectory}/Documents"
      #   "file://${config.home.homeDirectory}/Downloads"
      #   "file://${config.home.homeDirectory}/Music"
      #   "file://${config.home.homeDirectory}/Pictures"
      #   "file://${config.home.homeDirectory}/Videos"
      # ];

      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
        gtk-decoration-layout = "menu:";
        gtk-icon-theme-name = "Colloid-Dark";
        gtk-theme-name = "Colloid-Dark";

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

  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
}
