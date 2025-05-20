{config, ...}: {
  wayland.windowManager.hyprland.settings = let
    pointer = config.home.pointerCursor;
    inherit (config.theme.colorscheme) colors rgbaColors;
  in {
    cursor = {
      no_hardware_cursors = true;
    };

    env = [
      "CLUTTER_BACKEND,wayland"
      "GDK_BACKEND,wayland,x11,*"
      "GTK_THEME,${config.gtk.theme.name}"
      "OBSIDIAN_USE_WAYLAND,1"
      "SDL_VIDEODRIVER,wayland"
      "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      "QT_QPA_PLATFORM,wayland;xcb"
      "QT_QPA_PLATFORMTHEME,qt5ct"
      "QT_STYLE_OVERRIDE,kvantum"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "XCURSOR_THEME,${pointer.name}"
      "XCURSOR_SIZE,${toString pointer.size}"
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
    ];

    exec-once = [
      "hyprctl setcursor ${pointer.name} ${toString pointer.size}"
      "nice -1 nwg-dock-hyprland -i 60 -x -lp start -mb 12"
    ];

    general = {
      gaps_in = 4;
      gaps_out = 12;

      border_size = 1;
      "col.active_border" = "rgb(${colors.gray0})";
      "col.inactive_border" = "rgb(${colors.black4})";

      resize_on_border = true;

      # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      allow_tearing = false;

      layout = "dwindle";
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master = {
      new_status = "master";
    };

    decoration = {
      rounding = 12;

      active_opacity = 1.0;
      inactive_opacity = 0.96;
      fullscreen_opacity = 1.0;

      dim_inactive = false;

      blur = {
        enabled = true;
        size = 8;
        passes = 3;
        new_optimizations = "on";
        ignore_opacity = true;
        xray = true;
        noise = 0.0;
        contrast = 1.1;
        brightness = 1.2;
      };

      shadow = {
        enabled = true;
        range = 30;
        render_power = 3;
        color = "${rgbaColors.black1}";
      };
    };

    animations = {
      enabled = true;
      first_launch_animation = true;

      bezier = [
        "easeOutQuart, 0.25, 1, 0.5, 1"
      ];

      animation = [
        "windows, 1, 4, easeOutQuart, slide"
        "layers, 1, 4, easeOutQuart, fade"
        "fade, 1, 4, easeOutQuart"
        "border, 1, 6, easeOutQuart"
        "workspaces, 1, 6, easeOutQuart, slide"
        "specialWorkspace, 1, 6, easeOutQuart, slidevert"
      ];
    };

    input = {
      kb_layout = "us";
      follow_mouse = 1;
      accel_profile = "flat";

      touchpad = {
        disable_while_typing = true;
        natural_scroll = true;
        tap-to-click = true;
        tap-and-drag = true;
        scroll_factor = 0.5;
      };
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_forever = true;
    };

    misc = {
      animate_manual_resizes = true;
      animate_mouse_windowdragging = true;
      disable_autoreload = true;
      disable_hyprland_logo = true;
      force_default_wallpaper = 0;
      vfr = true;
      vrr = 1;
    };

    binds = {
      allow_workspace_cycles = true;
    };

    xwayland = {
      enabled = true;
      force_zero_scaling = true;
    };

    plugin = {
      borders-plus-plus = {
        add_borders = 1; # 0 - 9
        # you can add up to 9 borders
        col.border_1 = "rgb(${colors.black0})";
        # -1 means "default" as in the one defined in general:border_size
        border_size_1 = 1;
        natural_rounding = "no";
      };

      hyprbars = {
        bar_blur = false;
        bar_buttons_alignment = "left";
        bar_button_padding = "10";
        bar_color = "rgb(${colors.black2})";
        bar_title_enabled = true;
        bar_height = "36";
        bar_padding = "10";
        bar_part_of_window = true;
        bar_precedence_over_border = true;
        bar_text_size = "12";
        bar_text_font = "GeistMono Nerd Font Bold";
        bar_text_align = "center";
        "col.text" = "rgb(${colors.white})";
        hyprbars-button = [
          "rgb(${colors.red}), 12, , hyprctl dispatch killactive"
          "rgb(${colors.yellow}), 12, , hyprctl dispatch togglefloating"
          "rgb(${colors.green}), 12, , hyprctl dispatch fullscreen"
        ];
      };

      # hyprexpo = {
      #   columns = 3;
      #   gap_size = 4;
      #   bg_col = "rgb(${colors.black0})";
      #   enable_gesture = true;
      #   gesture_fingers = 3;
      #   gesture_distance = 300;
      #   gesture_positive = false;
      # };

      overview = {
        # Colors

        panelColor = "${rgbaColors.black0}";
        # panelBorderColor = "${rgbaColors.black4}";
        # workspaceActiveBackground
        # workspaceInactiveBackground
        workspaceActiveBorder = "${rgbaColors.white}";
        workspaceInactiveBorder = "${rgbaColors.gray0}";
        # disableBlur

        # Layout

        # panelHeight = 128;
        # panelBorderWidth = 1;
        # onBottom
        # workspaceMargin
        # reservedArea
        # workspaceBorderSize
        centerAligned = true;
        # hideBackgroundLayers
        # hideTopLayers
        hideOverlayLayers = true;
        # hideRealLayers
        # drawActiveWorkspace
        overrideGaps = true;
        gapsIn = 10;
        gapsOut = 20;
        #affectStrut

        # Animation

        # overrideAnimSpeed = true;

        # Behaviors

        # autoDrag
        # autoScroll
        # disableGestures
        # exitOnClick
        # exitOnSwitch
        reverseSwipe = true;
        showNewWorkspace = true;
        # showEmptyWorkspace
        # showSpecialWorkspace
        # switchOnDrop
      };
    };
  };
}
