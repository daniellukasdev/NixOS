{
  lib,
  pkgs,
  config,
  inputs,
  outputs,
  ...
}: rec {
  environment = {
    systemPackages = with pkgs.gnomeExtensions; [
      advanced-alttab-window-switcher
      blur-my-shell
      control-blur-effect-on-lock-screen
      dash2dock-lite
      # dash-to-dock
      # dash-to-dock-animator
      gtk4-desktop-icons-ng-ding
      extension-list
      forge
      just-perfection
      search-light
      unite
      user-themes
    ];
  };

  programs.dconf.profiles = {
    # TODO: Investigate customizing gdm greeter.
    user.databases = [
      {
        settings = with lib.gvariant; {
          # First we enable every extension that we install above
          "org/gnome/shell".enabled-extensions = map (extension: extension.extensionUuid) environment.systemPackages;

          "org/gnome/shell/extensions/advanced-alt-tab-window-switcher" = {
            hot-edge-fullscreen = false;
            hot-edge-position = "0";
            switcher-popup-hover-select = true;
            switcher-popup-monitor = "2";
            switcher-popup-position = "2";
            switcher-popup-start-search = true;
            switcher-popup-sync-filter = true;
            switcher-popup-wrap = false;
          };

          "org/gnome/shell/extensions/dash2dock-lite" = {
            animation-magnify = "0.48";
            animation-rise = "0.48";
            animation-spread = "0.36";
            autohide-dash = true;
            border-radius = "3.0";
            edge-distance = "-0.1";
            favorites-only = false;
            icon-resolution = "4";
            icon-size = "0";
            mounted-icon = true;
            open-app-animation = true;
            running-indicator-style = "3";
            scroll-sensitivity = "0.4";
            shrink-icons = true;
            trash-icon = true;
          };

          # "org/gnome/shell/extensions/blur-my-shell".color-and-noise = true;
          # "org/gnome/shell/extensions/blur-my-shell/applications".blur = false;
        };
      }
    ];
  };
}
