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
        sddm = {
          enable = true;
          enableHidpi = true;
          autoNumlock = true;
          # the line starts with "Current="
          # https://github.com/NixOS/nixpkgs/blob/nixos-23.05/nixos/modules/services/x11/display-managers/sddm.nix#L39
          # theme = ''
          #   breeze
          #   CursorTheme=LyraG-cursors
          #   Font=Inter,12,-1,50,0,0,0,0,0
          # '';
          wayland = {
            enable = true;
          };
        };
        defaultSession = "plasma";
      };
    };
  };
}
