{lib, ...}: let
  gnomeUrl = "org/gnome/";
  gnomeShellUrl = "${gnomeUrl}shell";
  extensionsUrl = "${gnomeShellUrl}/extensions/";
  blurMyShellUrl = "${extensionsUrl}blur-my-shell";
  desktopUrl = "${gnomeUrl}desktop/";
  mutterUrl = "${gnomeUrl}mutter";
  nautilusUrl = "${gnomeUrl}nautilus/";
  settingsDaemonUrl = "${gnomeUrl}settings-daemon/";
  pluginsUrl = "${settingsDaemonUrl}plugins/";
  mediaKeysUrl = "${settingsDaemonUrl}media-keys";
in {
  # To get these settings so that you can add them to your configuration after manually configuring them
  # `dconf dump /${gnomeUrl}`
  # Another way to do this is to do `dconf watch /org/gnome` and then make the changes you want and then migrate them in as you see what they are.

  dconf = {
    enable = true;
    settings = with lib.gvariant; {
      "${gnomeShellUrl}" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "advanced-alt-tab@G-dH.github.com"
          "appindicatorsupport@rgcjonas.gmail.com"
          "blur-my-shell@aunetx"
          "clipboard-indicator@tudmotu.com"
          "ControlBlurEffectOnLockScreen@pratap.fastmail.fm"
          # "dash2dock-lite@icedman.github.com"
          "dash-to-dock@micxgx.gmail.com"
          "drive-menu@gnome-shell-extensions.gcampax.github.com"
          # "gtk4-ding@smedius.gitlab.com"
          "search-light@icedman.github.com"
          "tiling-assistant@leleat-on-github"
          "unite@hardpixel.eu"
          "user-theme@gnome-shell-extensions.gcampax.github.com"
          "Vitals@CoreCoding.com"
        ];
        favorite-apps = [
          "chromium-browser.desktop"
          "org.gnome.Nautilus.desktop"
          "org.gnome.Epiphany.desktop"
          "code.desktop"
          "discord.desktop"
          "obsidian.desktop"
          # "org.gnome.Music.desktop"
          "firefox.desktop"
          "org.gnome.Calendar.desktop"
          "org.gnome.Builder.desktop"
          "spotify.desktop"
          "org.gnome.Settings.desktop"
          "org.gnome.Terminal.desktop"
        ];
      };

      "${extensionsUrl}appindicator" = {
        legacy-tray-enabled = true;
      };

      "${extensionsUrl}advanced-alt-tab-window-switcher" = {
        hot-edge-fullscreen = false;
        hot-edge-position = mkInt32 0;
        switcher-popup-hover-select = true;
        switcher-popup-monitor = mkInt32 2;
        switcher-popup-position = mkInt32 2;
        switcher-popup-start-search = true;
        switcher-popup-sync-filter = true;
        switcher-popup-wrap = false;
      };

      "${blurMyShellUrl}" = {
        brightness = 0.60;
        color-and-noise = true;
        hacks-level = mkInt32 3;
        sigma = mkInt32 24;
      };
      "${blurMyShellUrl}/applications" = {
        blur = false;
        blur-on-overview = true;
        enable-all = true;
        opacity = 240;
      };
      "${blurMyShellUrl}/dash-to-dock" = {
        blur = false;
      };

      "${extensionsUrl}clipboard-indicator" = {
        disable-down-arrow = true;
      };

      "${extensionsUrl}dash2dock-lite" = {
        animation-magnify = 0.36;
        animation-rise = 0.12;
        animation-spread = 0.36;
        autohide-dash = true;
        background-color = mkTuple [0.14509804546833038 0.14509804546833038 0.14509804546833038 0.8066666722297668];
        border-color = mkTuple [0.3033333420753479 0.3033333420753479 0.3033333420753479 1.0];
        border-radius = 3.0;
        border-thickness = mkInt32 1;
        calendar-icon = true;
        edge-distance = -0.1;
        favorites-only = false;
        icon-resolution = mkInt32 4;
        icon-size = mkInt32 0;
        mounted-icon = false;
        notification-badge-style = mkInt32 1;
        notification-badge-color = mkTuple [0.87843137979507446 0.42352941632270813 0.45882353186607361 1.0];
        open-app-animation = true;
        running-indicator-style = mkInt32 3;
        scroll-sensitivity = 0.4;
        shrink-icons = false;
        trash-icon = true;
      };

      "${extensionsUrl}dash-to-dock" = {
        apply-custom-theme = false;
        custom-background-color = true;
        custom-theme-shrink = true;
        customize = true;
        customize-alphas = true;
        dash-max-icon-size = mkInt32 60;
        background-color = "rgb(44,44,44)";
        brightness = 1.0;
        disable-overview-on-startup = true;
        min-alpha = 0.36;
        max-alpha = 0.84;
        override-background = false;
        running-indicator-dominant-color = true;
        running-indicator-style = "METRO";
        show-apps-at-top = true;
        show-mounts = false;
        signa = mkInt32 24;
        transparency-mode = "DYNAMIC";
      };

      "${extensionsUrl}gtk4-ding" = {
        icon-size = "standard";
        start-corner = "top-right";
      };

      "${extensionsUrl}just-perfection" = {
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

      "${extensionsUrl}search-light" = {
        shortcut-search = ["<Super>space"];
      };

      "${extensionsUrl}tiling-assistant" = {
        maximize-with-gap = true;
        single-screen-gap = mkInt32 8;
        window-gap = mkInt32 8;
      };

      "${extensionsUrl}unite" = {
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

      "${extensionsUrl}user-theme" = {
        name = "";
        # name = "WhiteSur-Dark";
        # name = "Colloid-Dark";
      };

      "${desktopUrl}calendar".show-weekdate = false;
      "${desktopUrl}background" = {
        picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/fold-l.jpg";
        picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/fold-d.jpg";
      };
      "${desktopUrl}input-sources".sources = [
        (mkTuple ["xkb" "us"])
      ];
      "${desktopUrl}interface" = {
        clock-format = "12h";
        clock-show-seconds = false;
        clock-show-weekday = true;
        color-scheme = "prefer-dark";
        cursor-theme = "macOS-Monterey-White";
        # gtk-theme = "Colloid-Dark";
        # gtk-theme = "WhiteSur-Dark";
        # gtk-theme = "Space";
        # icon-theme = "Colloid-dark";
        # icon-theme = "WhiteSur-dark";
        monospace-font-name = "FiraCode NF";
        show-battery-percentage = true;
      };
      "${desktopUrl}media-handling".automount = true;
      "${desktopUrl}peripherals/mouse".accel-profile = "default";
      "${desktopUrl}privacy" = {
        remember-app-usage = true;
        remember-recent-files = true;
      };
      "${desktopUrl}screensaver".lock-enabled = true;
      "${desktopUrl}session".idle-delay = mkUint32 0;
      "${desktopUrl}wm/keybindings" = {
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
      "${desktopUrl}wm/preferences" = {
        button-layout = "close,minimize,maximize:appmenu";
        resize-with-right-button = false;
      };
      # "${mutterUrl}" = {
      #   edge-tiling = true;
      #   attach-modal-dialogs = true;
      #   experimental-features = [ "scale-monitor-framebuffer" ];
      # };

      "${mutterUrl}" = {
        dynamic-workspaces = true;
      };
      "${nautilusUrl}preferences".default-folder-viewer = "icon-view";
      "${nautilusUrl}list-view" = {
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

      "${pluginsUrl}power" = {
        # Suspend only on battery power, not while charging.
        sleep-inactive-ac-type = "nothing";
        power-button-action = "interactive";
      };

      "${mediaKeysUrl}" = {
        calculator = ["<Super>c"];
        custom-keybindings = [
          "/${mediaKeysUrl}custom-keybindings/custom0/"
          "/${mediaKeysUrl}custom-keybindings/custom1/"
          "/${mediaKeysUrl}custom-keybindings/custom2/"
        ];
        magnifier = mkEmptyArray type.string;
        screenreader = mkEmptyArray type.string;
      };

      # "${mediaKeysUrl}custom-keybindings/custom0" = {
      #   binding = "<Super>Return";
      #   command = "/usr/bin/env blackbox";
      #   name = "Terminal";
      # };

      # "${mediaKeysUrl}custom-keybindings/custom1" = {
      #   binding = "<Super>e";
      #   command = "/usr/bin/env nautilus";
      #   name = "File Manager";
      # };

      # "${mediaKeysUrl}custom-keybindings/custom2" = {
      #   binding = "<Super>k";
      #   command = "/usr/bin/env keepassxc";
      #   name = "Password Manager";
      # };

      "${gnomeShellUrl}/keybindings" = {
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

      # "${gnomeShellUrl}" = {
      #   disable-user-extensions = false;
      #   favorite-apps = [
      #     "org.gnome.Nautilus.desktop"
      #     # "org.gnome.Epiphany.desktop"
      #     "code.desktop"
      #     "obsidian.desktop"
      #     "org.gnome.Calendar.desktop"
      #     "firefox.desktop"
      #     "org.gnome.Music.desktop"
      #     "org.gnome.Settings.desktop"
      #     "org.gnome.Terminal.desktop"
      #   ];
      # };

      "${gnomeUrl}TextEditor" = {
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

      "${gnomeUrl}terminal/legacy" = {
        mnemonics-enabled = true;
      };

      "${gnomeUrl}terminal/legacy/profiles:" = {
        list = [
          "b1dcc9dd-5262-4d8d-a863-c897e6d979b9"
        ];
      };

      "${gnomeUrl}terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
        audible-bell = true;
        background-color = "rgb(40,44,52)";
        background-transparency-percent = mkUint32 0;
        bold-is-bright = false;
        cursor-background-color = "rgb(152,195,121)";
        cursor-blink-mode = "system";
        cursor-colors-set = true;
        cursor-foreground-color = "rgb(40,44,52)";
        cursor-shape = "block";
        default-size-columns = mkUint32 100;
        default-size-rows = mkUint32 28;
        font = "FiraMono Nerd Font 11";
        foreground-color = "rgb(202,213,237)";
        login-shell = false;
        palette = [
          "rgb(40,44,52)" # "#282c34"
          "rgb(224,108,117)" # "#e06c75"
          "rgb(152,195,121)" # "#98c379"
          "rgb(229,192,123)" # "#e6c07b"
          "rgb(97,175,239)" # "#61aeee"
          "rgb(198,120,221)" # "#c678dd"
          "rgb(86,182,194)" # "#56b6c2"
          "rgb(171,178,191)" # "#abb2bf"
          "rgb(92,99,112)" # "#5c6370"
          "rgb(228,86,73)" # "#E45649" # "#be5046"
          "rgb(80,161,79)" # "#50A14F"
          "rgb(193,132,1)" # "##C18401" # "#d19a66"
          "rgb(64,120,242)" # "#4078F2"
          "rgb(166,38,164)" # "#A626A4"
          "rgb(1,132,188)" # "#0184BC"
          "rgb(202,213,237)" # "#CAD5ED"
        ];
        use-custom-command = false;
        use-system-font = false;
        use-theme-colors = false;
        use-transparent-background = false;
        visible-name = "danlukasdev";
      };
    };
  };
}
