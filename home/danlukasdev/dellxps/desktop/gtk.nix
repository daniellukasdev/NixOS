{
  pkgs,
  config,
  inputs,
  ...
}: {
  gtk = {
    enable = true;
    font = {
      name = "Fira";
      package = pkgs.fira;
      size = 12;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-decoration-layout = "menu:";
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-decoration-layout = "menu:";
    };

    # iconTheme = {
    # name = "WhiteSur";
    # package = pkgs.whitesur-icon-theme;
    # };

    # theme = {
    # name = "WhiteSur-Dark";
    # package = pkgs.whitesur-gtk-theme;
    # };

    iconTheme = {
      name = "Colloid-dark";
      package = pkgs.colloid-icon-theme;
    };

    theme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme;
    };

    # theme = {
    #   name = "Graphite-Dark-nord";
    #   package = pkgs.graphite-gtk-theme.override {
    #     # themeVariants = ["blue"];
    #     tweaks = ["nord" "colorful"];
    #   };
    # };
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    # platformTheme = "qtct";
    style = {
      name = "adwaita-dark";
      # name = "kvantum";
      package = pkgs.adwaita-qt;
    };
  };
}
