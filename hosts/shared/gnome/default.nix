{
  lib,
  pkgs,
  config,
  inputs,
  outputs,
  ...
}: let
  # extensions = import ./extensions.nix {pkgs = pkgs;};
in {
  imports = [
    ./extensions.nix
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
    # persistence."/state".users.danlukasdev.files = [".config/monitors.xml"];

    systemPackages =
      (with pkgs; [
        blackbox-terminal
        eyedropper
        warp
      ])
      ++ (with pkgs.gnome; [
        dconf-editor
        gnome-calculator
        gnome-calendar
        gnome-system-monitor
        gnome-terminal
        gnome-tweaks
        gnome-weather
        nautilus
        sushi
      ]);
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
          "org/gnome/desktop/interface".clock-format = "12h";
          "org/gnome/desktop/interface".clock-show-seconds = false;
          "org/gnome/desktop/interface".clock-show-weekday = true;
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

          # "org/gnome/desktop/wm/preferences" = {
          #   button-layout="close,minimize,maximize:appmenu";
          # };

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

          "org/gnome/TextEditor" = {
            custom-font = "FiraCode NF 11";
            highlight-current-line = true;
            show-grid = false;
            show-line-numbers = true;
            show-map = true;
            show-right-margin = false;
            style-scheme = "Adwaita-dark";
            style-variant = "follow";
            use-system-font = false;
          };

          "org/gnome/terminal/legacy" = {
            mnemonics-enabled = true;
          };

          "org/gnome/terminal/legacy/profiles:" = {
            list = [
              "b1dcc9dd-5262-4d8d-a863-c897e6d979b9"
            ];
          };

          "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
            audible-bell = true;
            background-color = "rgb(40,44,52)";
            background-transparency-percent = "12";
            bold-is-bright = false;
            cursor-background-color = "rgb(152,195,121)";
            cursor-blink-mode = "system";
            cursor-colors-set = true;
            cursor-foreground-color = "rgb(40,44,52)";
            cursor-shape = "block";
            default-size-columns = "100";
            default-size-rows = "25";
            font = "FiraMono Nerd Font 11";
            foreground-color = "rgb(202,213,237)";
            login-shell = false;
            palette = [
              "rgb(40,44,52)"
              "rgb(224,108,117)"
              "rgb(152,195,121)"
              "rgb(229,192,123)"
              "rgb(97,175,239)"
              "rgb(198,120,221)"
              "rgb(86,182,194)"
              "rgb(171,178,191)"
              "rgb(92,99,112)"
              "rgb(228,86,73)"
              "rgb(80,161,79)"
              "rgb(193,132,1)"
              "rgb(64,120,242)"
              "rgb(166,38,164)"
              "rgb(1,132,188)"
              "rgb(202,213,237)"
            ];
            use-custom-command = false;
            use-system-font = false;
            use-theme-colors = false;
            use-transparent-background = true;
            visible-name = "danlukasdev";
          };
        };
      }
    ];
  };
}
