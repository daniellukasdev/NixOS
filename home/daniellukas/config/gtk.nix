{
  config,
  pkgs,
  ...
}: {
  gtk = {
    enable = true;

    font = {
      name = "Poppins Bold";
      package = pkgs.poppins;
      size = 12;
    };

    theme = {
      name = "WhiteSur-Dark";
      package = pkgs.whitesur-gtk-theme;
      # .override {
      #   colorVariants = ["dark"];
      #   nautilusStyle = "normal";
      #   opacityVariants = ["normal"];
      #   schemeVariants = ["standard"];
      # };
    };

    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme.override {
        alternativeIcons = true;
        boldPanelIcons = true;
      };
    };

    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = ''
        gtk-application-prefer-dark-theme = true
        gtk-icon-theme-name="WhiteSur"
        gtk-theme-name="WhiteSur-Dark"
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
        gtk-icon-theme-name = "WhiteSur";
        gtk-theme-name = "WhiteSur-Dark";

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
}
