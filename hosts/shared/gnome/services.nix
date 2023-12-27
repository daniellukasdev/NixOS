{
  lib,
  pkgs,
  ...
}: {
  imports = [
    # ./pipewire.nix
  ];

  services = {

    xserver = {
    enable = true;

    # We can exclude these packages without breaking X in gnome-shell, even if
    # I almost never use it.
    excludePackages = [ pkgs.xterm ] ++ (with pkgs.xorg; [
      iceauth
      xauth
      xf86inputevdev
      xinput
      xlsclients
      xorgserver
      xprop
      xrandr
      xrdb
      xset
      xsetroot
    ]);

    desktopManager.gnome.enable = true;
    displayManager = {
      # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
      # Suggested workaround (disabling "getty@tty1" and "autovt@tty1"
      # works, but as I do not use autoLogin anyway, this should suffice.
      autoLogin.enable = false;

      gdm = {
        enable = true;
        autoSuspend = false;
      };

    };

    layout = "us";
    xkbVariant = "";

  };

    gnome = {
      glib-networking.enable = true;
      gnome-keyring.enable = true;
    };

    udev.packages = [pkgs.gnome.gnome-settings-daemon];

  };

}