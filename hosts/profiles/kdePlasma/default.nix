{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./sddm.nix
  ];

  environment = {
    variables = {
      OBSIDIAN_USE_WAYLAND = "1";
      CLUTTER_BACKEND = "wayland";
      GDK_BACKEND = "wayland,x11";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      SDL_VIDEODRIVER = "wayland";
      XDG_SESSION_TYPE = "wayland";
    };
    plasma6.excludePackages = with pkgs.kdePackages; [
      kmailtransport
      okular
      oxygen
      plasma-browser-integration
    ];

    # Persists multi-monitor configuration.
    # TODO: Make independent of user.
    # persistence."/state".users.daniellukas.files = [".config/monitors.xml"];

    systemPackages =
      (with pkgs; [
        ark
        dconf2nix
        ffmpegthumbnailer
        libgsf
        plasma-theme-switcher
        # graphics info
        clinfo
        glxinfo
        wayland-utils
      ])
      ++ (with pkgs.kdePackages; [
        # discover
        kate
        kruler
        # use digital clock with PIM plugin
        akonadi-calendar
        kdepim-addons
        merkuro
        # security stuff
        ksshaskpass
        qtstyleplugin-kvantum
        yakuake
      ])
      ++ (with pkgs.gnome; [
        dconf-editor
      ]);
    # ++ (with pkgs.xorg; []);
  };

  home-manager.sharedModules = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  services = {
    xserver = {
      enable = true;
      # TODO: Find excludable packages for plasma6
      # We can exclude these packages without breaking X in gnome-shell, even if
      # I almost never use it.
      # excludePackages =
      #   [pkgs.xterm]
      #   ++ (with pkgs.xorg; [
      #     iceauth
      #     xauth
      #     xf86inputevdev
      #     xinput
      #     xlsclients
      #     xorgserver
      #     # xprop
      #     xrandr
      #     xrdb
      #     xset
      #     xsetroot
      #   ]);

      desktopManager.plasma6.enable = true;

      # Enable touchpad support (enabled default in most desktopManager).
      libinput = {
        enable = true;
      };

      # layout = "us";
      # xkbVariant = "";
    };

    # plasma6 = {
    #   glib-networking.enable = true;
    #   plasma6-keyring.enable = true;
    # };

    # udev.packages = [pkgs.plasma6.plasma6-settings-daemon];
  };
}
