{
  lib,
  pkgs,
  ...
}: let
  extensions = import ./extensions.nix {pkgs = pkgs;};
in {
  imports = [
    ./services.nix
  ];

  environment = {
    gnome.excludePackages = with pkgs.gnome; [
      geary
      # gnome-bluetooth
      # gnome-terminal
      pkgs.gnome-tour
      pkgs.orca
    ];

    # Persists multi-monitor configuration.
    # TODO: Make independent of user.
    persistence."/state".users.danlukasdev.files = [".config/monitors.xml"];

    systemPackages = with pkgs;
      [
        blackbox-terminal
        eyedropper
        gnome.dconf-editor
        gnome.gnome-calculator
        gnome.gnome-calendar
        gnome.gnome-system-monitor
        gnome.gnome-tweaks
        gnome.gnome-weather
        gnome.nautilus
        gnome.sushi
        warp
      ]
      ++ extensions;
  };

  # To get these settings so that you can add them to your configuration after manually configuring them
  # `dconf dump /org/gnome/`
  # Another way to do this is to do `dconf watch /org/gnome` and then make the changes you want and then migrate them in as you see what they are.

  programs.dconf.profiles = {
    # TODO: Investigate customizing gdm greeter.
    user.databases = [
      {
        settings = with lib.gvariant; {
          "org/gnome/desktop/calendar".show-weekdate = false;
          "org/gnome/desktop/input-sources".sources = [
            (mkTuple ["xkb" "us"])
          ];
          "org/gnome/desktop/interface".color-scheme = "prefer-dark";
          "org/gnome/desktop/interface".show-battery-percentage = true;
          "org/gnome/desktop/media-handling".automount = true;
          "org/gnome/desktop/peripherals/mouse".accel-profile = "default";
          "org/gnome/desktop/privacy".remember-app-usage = true;
          "org/gnome/desktop/privacy".remember-recent-files = true;
          "org/gnome/desktop/screensaver".lock-enabled = true;
          "org/gnome/desktop/session".idle-delay = mkUint32 0;
          "org/gnome/desktop/wm/preferences".resize-with-right-button = false;
          # "org/gnome/mutter" = {
          #   edge-tiling = true;
          #   attach-modal-dialogs = true;
          #   experimental-features = [ "scale-monitor-framebuffer" ];
          # };
          "org/gnome/settings-daemon/plugins/power" = {
            # Suspend only on battery power, not while charging.
            sleep-inactive-ac-type = "nothing";
            power-button-action = "interactive";
          };

          "org/gnome/nautilus/preferences".default-folder-viewer = "icon-view";
          "org/gnome/nautilus/list-view" = {
            use-tree-view = true;
            default-zoom-level = "small";
          };

          "org/gtk/gtk4/settings/file-chooser" = {
            sort-directories-first = true;
            show-hidden = true;
            view-type = "list";
          };

          # "com/raggesilver/BlackBox" = {
          #   font = "Recursive Mono Casual Static 11";
          #   terminal-bell = false;
          # };

          "org/gnome/settings-daemon/plugins/media-keys" = {
            screenreader = mkEmptyArray type.string;
            magnifier = mkEmptyArray type.string;
            calculator = ["<Super>c"];
          };

          "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
            binding = "<Super>Return";
            command = "/usr/bin/env blackbox";
            name = "Terminal";
          };

          # "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
          #   binding = "<Super>e";
          #   command = "/usr/bin/env nautilus";
          #   name = "File Manager";
          # };

          # "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
          #   binding = "<Super>k";
          #   command = "/usr/bin/env keepassxc";
          #   name = "Password Manager";
          # };

          "org/gnome/settings-daemon/plugins/media-keys".custom-keybindings = [
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
          ];

          "org/gnome/desktop/wm/preferences" = {
            button-layout='close,minimize,maximize:appmenu';
          };

          "org/gnome/desktop/wm/keybindings" = {
            switch-to-workspace-left = ["<Super>a"];
            switch-to-workspace-right = ["<Super>d"];
            move-to-workspace-left = ["<Shift><Super>a"];
            move-to-workspace-right = ["<Shift><Super>d"];
            switch-to-workspace-1 = ["<Super>1"];
            switch-to-workspace-2 = ["<Super>2"];
            switch-to-workspace-3 = ["<Super>3"];
            switch-to-workspace-4 = ["<Super>4"];
            switch-input-source = ["<Shift><Alt>"];
            switch-input-source-backward = mkEmptyArray type.string;
            activate-window-menu = ["Menu"];
            close = ["<Shift><Super>w"];
            maximize = ["<Super>f"];
            toggle-fullscreen = ["<Shift><Super>f"];
          };

          "org/gnome/shell/keybindings" = {
            # Following binds are replaced by the ones above.
            toggle-application-view = mkEmptyArray type.string;
            switch-to-application-1 = mkEmptyArray type.string;
            switch-to-application-2 = mkEmptyArray type.string;
            switch-to-application-3 = mkEmptyArray type.string;
            switch-to-application-4 = mkEmptyArray type.string;

            show-screen-recording-ui = mkEmptyArray type.string;
            screenshot = mkEmptyArray type.string;
            show-screenshot-ui = ["<Shift><Super>s"];
            screenshot-window = mkEmptyArray type.string;
          };

          # "org/gnome/shell".enabled-extensions = [
          #   "blur-my-shell@aunetx"
          #   "dash-to-panel@jderose9.github.com"
          #   "desktop-cube@schneegans.github.com"
          # ];

          # First we enable every extension that we install above
          "org/gnome/shell".enabled-extensions = map (extension: extension.extensionUuid) extensions;

          "org/gnome/shell/extensions/advanced-alt-tab-window-switcher" = {
            switcher-popup-position = 2;
          };

          "org/gnome/shell/extensions/dash2dock-lite" = {
            animation-magnify = 0.48;
            animation-rise = 0.48;
            animation-spread = 0.36;
            autohide-dash = true;
            border-radius = 3.0;
            edge-distance = -0.1;
            favorites-only = false;
            icon-resolution = 4;
            icon-size = 0;
            mounted-icon = true;
            open-app-animation = true;
            running-indicator-style = 3;
            scroll-sensitivity = 0.4;
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
