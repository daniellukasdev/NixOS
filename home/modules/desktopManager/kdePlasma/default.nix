{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  plasmaPackages = with pkgs.libsForQt5;
  with pkgs; [
    discover
    kate
    kruler
    # use digital clock with PIM plugin
    akonadi-calendar
    kdepim-addons
    merkuro
    # security stuff
    ksshaskpass
    # graphics info
    clinfo
    glxinfo
    wayland-utils
  ];
in {
  # imports = [

  # ];

  home.packages = with pkgs;
    [
      colloid-gtk-theme
      colloid-icon-theme
      graphite-gtk-theme
      whitesur-gtk-theme
      whitesur-icon-theme
    ]
    ++ plasmaPackages;
}
