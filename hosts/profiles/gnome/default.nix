{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./gdm.nix
    ./overlays
  ];

  environment = {
    variables = {
      # CLUTTER_BACKEND = "wayland";
      # GDK_BACKEND = "wayland,x11";
      MOZ_ENABLE_WAYLAND = "1";
      # NIXOS_OZONE_WL = "1";
      # OBSIDIAN_USE_WAYLAND = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      # QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      SDL_VIDEODRIVER = "wayland";
      WARP_ENABLE_WAYLAND = "1";
      XDG_SESSION_TYPE = "wayland";
    };
    gnome.excludePackages = with pkgs.gnome; [
      geary
      # gnome-bluetooth
      # gnome-terminal
      pkgs.gnome-tour
      pkgs.orca
    ];

    # Persists multi-monitor configuration.
    # TODO: Make independent of user.
    # persistence."/state".users.daniellukas.files = [".config/monitors.xml"];

    systemPackages =
      (with pkgs; [
        blackbox-terminal
        dconf2nix
        eyedropper
        gradience
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
      ])
      ++ (with pkgs.xorg; [
        xprop
      ]);
  };

  # home-manager.sharedModules = [
  # TODO: move gnomeExtensions and dconf here??
  # ];

  services = {
    gnome = {
      core-developer-tools.enable = true;
      glib-networking.enable = true;
      gnome-keyring.enable = true;
    };

    xserver = {
      enable = true;

      excludePackages =
        [pkgs.xterm]
        ++ (with pkgs.xorg; [
          iceauth
          xauth
          xf86inputevdev
          xinput
          xlsclients
          xorgserver
          # xprop
          xrandr
          xrdb
          xset
          xsetroot
        ]);

      desktopManager.gnome = {
        enable = true;
      };
    };

    udev.packages = [pkgs.gnome.gnome-settings-daemon];
  };
}
