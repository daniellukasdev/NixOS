{
  config,
  lib,
  pkgs,
  ...
}: {
  services = {

    xserver = {
      enable = true;

      displayManager = {
        # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
        # Suggested workaround (disabling "getty@tty1" and "autovt@tty1"
        # works, but as I do not use autoLogin anyway, this should suffice.
        autoLogin.enable = false;

        gdm = {
          enable = true;
          autoSuspend = false;
          wayland = true;
        };

      };

    };
  };
}
