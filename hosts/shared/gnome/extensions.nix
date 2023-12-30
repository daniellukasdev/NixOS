{
  lib,
  pkgs,
  config,
  inputs,
  outputs,
  ...
}: let
  myExtensions = with pkgs.gnomeExtensions; [
    advanced-alttab-window-switcher
    blur-my-shell
    clipboard-indicator
    control-blur-effect-on-lock-screen
    dash2dock-lite
    # dash-to-dock
    # dash-to-dock-animator
    gtk4-desktop-icons-ng-ding
    # extension-list
    forge
    just-perfection
    search-light
    unite
    user-themes
  ];
in {
  environment = {
    systemPackages = myExtensions;
  };

  programs.dconf.profiles = {
    # TODO: Investigate customizing gdm greeter.
    user.databases = [
      {
        settings = with lib.gvariant; {
          # First we enable every extension that we install above
          # "org/gnome/shell".enabled-extensions = map (extension: extension.extensionUuid) myExtensions;
          "org/gnome/shell".enabled-extensions = [
            "advanced-alt-tab@G-dH.github.com"
            "blur-my-shell@aunetx"
            "clipboard-indicator@tudmotu.com"
            "ControlBlurEffectOnLockScreen@pratap.fastmail.fm"
            "dash2dock-lite@icedman.github.com"
            "drive-menu@gnome-shell-extensions.gcampax.github.com"
            # "gtk4-ding@smedius.gitlab.com"
            "search-light@icedman.github.com"
            "unite@hardpixel.eu"
            "user-theme@gnome-shell-extensions.gcampax.github.com"
          ];

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

          "org/gnome/shell/extensions/clipboard-indicator" = {
            disable-down-arrow = true;
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

          # "org/gnome/shell/extensions/just-perfection" = {
          #   accessibility-menu = true;
          #   activities-button-icon-monochrome = true;
          #   activities-button-label = true;
          #   app-menu = true;
          #   app-menu-icon = true;
          #   clock-menu-position = 1;
          #   controls-manager-spacing-size = 0;
          #   dash = true;
          #   dash-icon-size = 0;
          #   dash-separator = true;
          #   notification-banner-position = 2;
          #   panel = true;
          #   panel-notification-icon = true;
          #   power-icon = true;
          #   quick-settings = true;
          #   show-apps-button = true;
          #   theme = true;
          #   workspace = true;
          #   workspace-switcher-should-show = false;
          #   workspace-wrap-around = true;
          # };

          "org/gnome/shell/extensions/unite" = {
            desktop-name-text = "";
            greyscale-tray-icons = false;
            hide-activities-button = "never";
            hide-dropdown-arrows = false;
            hide-window-titlebars = "maximized";
            reduce-panel-spacing = true;
            window-buttons-placement = "left";
            window-buttons-theme = "mcmojave";
          };
        };
      }
    ];
  };
}
