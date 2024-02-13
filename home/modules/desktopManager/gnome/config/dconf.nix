{lib, ...}: {
  # To get these settings so that you can add them to your configuration after manually configuring them
  # `dconf dump /org/gnome/`
  # Another way to do this is to do `dconf watch /org/gnome` and then make the changes you want and then migrate them in as you see what they are.

  dconf = {
    enable = true;
    settings = with lib.gvariant; {
      "org/gnome/shell".enabled-extensions = [
        "advanced-alt-tab@G-dH.github.com"
        "appindicatorsupport@rgcjonas.gmail.com"
        "blur-my-shell@aunetx"
        "clipboard-indicator@tudmotu.com"
        "ControlBlurEffectOnLockScreen@pratap.fastmail.fm"
        "dash2dock-lite@icedman.github.com"
        # "dash-to-dock@micxgx.gmail.com"
        "drive-menu@gnome-shell-extensions.gcampax.github.com"
        "gtk4-ding@smedius.gitlab.com"
        "search-light@icedman.github.com"
        "tiling-assistant@leleat-on-github"
        "unite@hardpixel.eu"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "Vitals@CoreCoding.com"
      ];

      "org/gnome/shell/extensions/appindicator" = {
        legacy-tray-enabled = true;
      };

      "org/gnome/shell/extensions/advanced-alt-tab-window-switcher" = {
        hot-edge-fullscreen = false;
        hot-edge-position = mkInt32 0;
        switcher-popup-hover-select = true;
        switcher-popup-monitor = mkInt32 2;
        switcher-popup-position = mkInt32 2;
        switcher-popup-start-search = true;
        switcher-popup-sync-filter = true;
        switcher-popup-wrap = false;
      };

      "org/gnome/shell/extensions/clipboard-indicator" = {
        disable-down-arrow = true;
      };

      "org/gnome/shell/extensions/dash2dock-lite" = {
        animation-magnify = 0.36;
        animation-rise = 0.12;
        animation-spread = 0.36;
        autohide-dash = true;
        border-radius = 3.0;
        calendar-icon = true;
        edge-distance = -0.1;
        favorites-only = false;
        icon-resolution = mkInt32 4;
        icon-size = mkInt32 0;
        mounted-icon = false;
        notification-badge-style = mkInt32 1;
        notification-badge-color = [
          0.87843137979507446
          0.42352941632270813
          0.45882353186607361
          1.0
        ];
        open-app-animation = true;
        running-indicator-style = mkInt32 3;
        scroll-sensitivity = 0.4;
        shrink-icons = false;
        trash-icon = true;
      };

      "org/gnome/shell/extensions/blur-my-shell/applications".blur = true;
      "org/gnome/shell/extensions/blur-my-shell/dash-to-dock".blur = false;

      "org/gnome/shell/extensions/dash-to-dock" = {
        apply-custom-theme = false;
        custom-background-color = true;
        custom-theme-shrink = true;
        background-color = "rgb(44,44,44)";
        disable-overview-on-startup = true;
        running-indicator-dominant-color = true;
        running-indicator-style = "METRO";
        show-apps-at-top = true;
        transparency-mode = "DYNAMIC";
      };
      # "org/gnome/shell/extensions/blur-my-shell".color-and-noise = true;

      "org/gnome/shell/extensions/just-perfection" = {
        accessibility-menu = true;
        activities-button-icon-monochrome = true;
        activities-button-label = true;
        app-menu = true;
        app-menu-icon = true;
        clock-menu-position = mkInt32 1;
        controls-manager-spacing-size = mkInt32 0;
        dash = true;
        dash-icon-size = mkInt32 0;
        dash-separator = true;
        notification-banner-position = mkInt32 2;
        panel = true;
        panel-notification-icon = true;
        power-icon = true;
        quick-settings = true;
        show-apps-button = true;
        theme = true;
        workspace = true;
        workspace-switcher-should-show = false;
        workspace-wrap-around = true;
      };

      "org/gnome/shell/extensions/search-light" = {
        shortcut-search = ["<Super>space"];
      };

      "org/gnome/shell/extensions/tiling-assistant" = {
        maximize-with-gap = true;
        single-screen-gap = mkInt32 8;
        window-gap = mkInt32 8;
      };

      "org/gnome/shell/extensions/unite" = {
        desktop-name-text = "";
        greyscale-tray-icons = false;
        hide-activities-button = "never";
        hide-dropdown-arrows = false;
        hide-window-titlebars = "maximized";
        reduce-panel-spacing = true;
        show-appmenu-button = false;
        use-activities-text = false;
        window-buttons-placement = "left";
        window-buttons-theme = "whitesur";
      };

      "org/gnome/shell/extensions/user-theme" = {
        name = "Colloid-Dark";
      };

      "org/gnome/desktop/calendar".show-weekdate = false;
      "org/gnome/desktop/background" = {
        picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/fold-l.jpg";
        picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/fold-d.jpg";
      };
      "org/gnome/desktop/input-sources".sources = [
        (mkTuple ["xkb" "us"])
      ];
      "org/gnome/desktop/interface" = {
        clock-format = "12h";
        clock-show-seconds = false;
        clock-show-weekday = true;
        color-scheme = "prefer-dark";
        cursor-theme = "macOS-Monterey-White";
        gtk-theme = "Colloid-Dark";
        icon-theme = "Colloid-dark";
        monospace-font-name = "FiraCode NF";
        show-battery-percentage = true;
      };
      "org/gnome/desktop/media-handling".automount = true;
      "org/gnome/desktop/peripherals/mouse".accel-profile = "default";
      "org/gnome/desktop/privacy" = {
        remember-app-usage = true;
        remember-recent-files = true;
      };
      "org/gnome/desktop/screensaver".lock-enabled = true;
      "org/gnome/desktop/session".idle-delay = mkUint32 0;
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
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "close,minimize,maximize:appmenu";
        resize-with-right-button = false;
      };
      # "org/gnome/mutter" = {
      #   edge-tiling = true;
      #   attach-modal-dialogs = true;
      #   experimental-features = [ "scale-monitor-framebuffer" ];
      # };

      "org/gnome/mutter" = {
        dynamic-workspaces = true;
      };
      "org/gnome/nautilus/preferences".default-folder-viewer = "icon-view";
      "org/gnome/nautilus/list-view" = {
        use-tree-view = true;
        default-zoom-level = "small";
      };

      "org/gnome/settings-daemon/plugins/power" = {
        # Suspend only on battery power, not while charging.
        sleep-inactive-ac-type = "nothing";
        power-button-action = "interactive";
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

      "org/gnome/shell" = {
        disable-user-extensions = false;
        favorite-apps = [
          "org.gnome.Nautilus.desktop"
          "org.gnome.Epiphany.desktop"
          "code.desktop"
          "obsidian.desktop"
          "org.gnome.Calendar.desktop"
          "firefox.desktop"
          "org.gnome.Music.desktop"
          "org.gnome.Settings.desktop"
          "org.gnome.Terminal.desktop"
        ];
      };

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
        background-transparency-percent = mkUint32 12;
        bold-is-bright = false;
        cursor-background-color = "rgb(152,195,121)";
        cursor-blink-mode = "system";
        cursor-colors-set = true;
        cursor-foreground-color = "rgb(40,44,52)";
        cursor-shape = "block";
        default-size-columns = "100";
        default-size-rows = mkUint32 25;
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
  };
}
