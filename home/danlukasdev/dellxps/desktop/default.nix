{
  inputs,
  pkgs,
  ...
}: {

  imports = [
    ./gtk.nix
  ];
  # home.pointerCursor = {
  #   name = "macOS-Monterey";
  #   package = pkgs.macos-cursors;
  #   size = 32;
  #   gtk.enable = true;
  #   x11.enable = true;
  # };

  fonts.fontconfig.enable = true;

  
}