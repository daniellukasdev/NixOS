{
  config,
  pkgs,
}: let
  sharedExtensions = import ./extensions.nix {inherit pkgs;};
  sharedKeyBindings = import ./keybindings.nix;
  sharedUserSettings = import ./usersettings.nix {
    inherit config;
    inherit pkgs;
  };
in {
  extensions = sharedExtensions;
  keybindings = sharedKeyBindings;
  userSettings = sharedUserSettings;
}
