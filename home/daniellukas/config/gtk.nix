{
  config,
  inputs,
  pkgs,
  ...
}: let
  inherit (inputs.self.packages.${pkgs.system}) mactahoe-gtk-theme;
  inherit (inputs.self.packages.${pkgs.system}) mactahoe-icon-theme;

  gtkThemeName = "MacTahoe-Dark";
  # gtkThemeName = "WhiteSur-Dark";

  # iconThemeName = "Colloid";
  iconThemeName = "MacTahoe-dark";
  # iconThemeName = "Qogir-dark";
  # iconThemeName = "WhiteSur-dark";
in {
  gtk = {
    enable = true;

    font = {
      name = "Poppins Bold";
      package = pkgs.poppins;
      size = 12;
    };

    theme = {
      name = "${gtkThemeName}";
      package = mactahoe-gtk-theme.override {
        # blurVariant = true;
        colorVariants = ["dark"];
        # nautilusStyle = "normal";
        opacityVariants = ["normal"];
        schemeVariants = ["standard"];
      };
      # package = pkgs.whitesur-gtk-theme;
      # .override {
      #   colorVariants = ["dark"];
      #   nautilusStyle = "normal";
      #   opacityVariants = ["normal"];
      #   schemeVariants = ["standard"];
      # };
    };

    iconTheme = {
      name = "${iconThemeName}";
      package = mactahoe-icon-theme.override {
        # alternativeIcons = true;
        boldPanelIcons = true;
      };
      # package = pkgs.colloid-icon-theme.override {
      #   colorVariants = ["default"];
      #   schemeVariants = ["default"];
      # };
      # package = pkgs.qogir-icon-theme.override {
      #   colorVariants = ["dark"];
      #   themeVariants = ["default"];
      # };
      # package = pkgs.whitesur-icon-theme.override {
      #   # alternativeIcons = true;
      #   boldPanelIcons = true;
      # };
    };

    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = ''
        gtk-application-prefer-dark-theme = true
        gtk-icon-theme-name=""${iconThemeName}"
        gtk-theme-name="${gtkThemeName}"
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
        gtk-icon-theme-name = "${iconThemeName}";
        gtk-theme-name = "${gtkThemeName}";

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
