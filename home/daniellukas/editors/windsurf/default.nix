{
  config,
  pkgs,
  lib,
  ...
}: let
  defaultProfile = import ../vscodeShared {
    inherit config;
    inherit pkgs;
  };

  # 1. Add the custom commandLineArgs to Windsurf
  windsurfWithArgs = pkgs.windsurf.override {
    commandLineArgs = "--password-store=kwallet6";
  };

  # 2. Patch the missing meta.mainProgram metadata attribute properly
  patchedWindsurf =
    lib.extendDerivation true {
      meta = (windsurfWithArgs.meta or {}) // {mainProgram = "windsurf";};
    }
    windsurfWithArgs;
in {
  programs.windsurf = {
    enable = true;

    # 3. Feed the fully patched package into the extension wrapper
    package = pkgs.vscode-with-extensions.override {
      vscode = patchedWindsurf;
      vscodeExtensions = defaultProfile.extensions;
    };

    mutableExtensionsDir = true;

    profiles.default = {
      inherit (defaultProfile) keybindings userSettings;
    };
  };
}
