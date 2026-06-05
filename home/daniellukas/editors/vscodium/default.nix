{
  config,
  pkgs,
  ...
}: let
  defaultProfile = import ../vscodeShared {
    inherit config;
    inherit pkgs;
  };

  # 1. Override the base vscodium package with your command line arguments first
  vscodiumWithArgs = pkgs.vscodium.override {
    commandLineArgs = "--password-store=kwallet6";
  };
in {
  programs.vscodium = {
    enable = true;

    # 2. Feed the already-overridden package into the extension wrapper
    package = pkgs.vscode-with-extensions.override {
      vscode = vscodiumWithArgs;
      vscodeExtensions = defaultProfile.extensions;
    };
    mutableExtensionsDir = true;

    # 3. Keep the shared user settings and keybindings mapped to the profile
    profiles.default = {
      inherit (defaultProfile) keybindings userSettings;
    };
  };
}
