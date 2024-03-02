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
      MOZ_ENABLE_WAYLAND = "1";
      # NIXOS_OZONE_WL = "1";
      # OBSIDIAN_USE_WAYLAND = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      # QT_QPA_PLATFORM = "wayland;xcb";
      # QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      SDL_VIDEODRIVER = "wayland";
      XDG_SESSION_TYPE = "wayland";
    };
    plasma5.excludePackages = with pkgs.libsForQt5; [
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
        apple-cursor
      ])
      ++ (with pkgs.plasma5; [
        dconf-editor
      ])
      ++ (with pkgs.xorg; [
        #
      ]);
  };

  home-manager.sharedModules = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  services = {
    xserver = {
      enable = true;
      # TODO: Find excludable packages for plasma5
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

      desktopManager.plasma5.enable = true;

      # Enable touchpad support (enabled default in most desktopManager).
      libinput.enable = true;

      # layout = "us";
      # xkbVariant = "";
    };

    # plasma5 = {
    #   glib-networking.enable = true;
    #   plasma5-keyring.enable = true;
    # };

    # udev.packages = [pkgs.plasma5.plasma5-settings-daemon];
  };
}
