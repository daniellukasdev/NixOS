{
  config,
  lib,
  pkgs,
  ...
}: let
  extensions = with pkgs.gnomeExtensions; [
    advanced-alttab-window-switcher
    appindicator
    blur-my-shell
    clipboard-indicator
    control-blur-effect-on-lock-screen
    dash2dock-lite
    # dash-to-dock
    # dash-to-dock-animator
    # extension-list
    forge
    gtk4-desktop-icons-ng-ding
    just-perfection
    search-light
    tiling-assistant
    unite
    user-themes
    vitals
  ];
in {
  home.packages = with pkgs;
    [
      colloid-gtk-theme
      colloid-icon-theme
      # graphite-gtk-theme
      whitesur-gtk-theme
    ]
    ++ extensions;
}
