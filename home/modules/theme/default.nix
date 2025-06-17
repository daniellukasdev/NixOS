{lib, ...}: let
  inherit (lib) mkOption;
  inherit (lib.types) attrs attrsOf path str;
in {
  options.theme = {
    colorscheme = mkOption {
      type = attrsOf (attrsOf str);
      description = ''
        The colors used in the theming.
      '';
    };

    style = mkOption {
      type = attrsOf attrs;
      description = ''
        CSS style rules to use across configs.
      '';
    };

    wallpaper = mkOption {
      type = path;
      description = ''
        Wallpaper image.
      '';
    };
  };
}
