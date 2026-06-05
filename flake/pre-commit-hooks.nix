{inputs, ...}: {
  imports = [inputs.pre-commit-hooks.flakeModule];

  perSystem = {pkgs, ...}: {
    pre-commit = {
      check.enable = false; # Keep sandboxed checks off to prevent store lockups

      settings = {
        # FIX: Explicitly exclude massive runtime and development directories
        excludes = [
          "flake\\.lock"
          "\\.git/"
          "\\.direnv/"
          "\\.devenv/"
          "result.*"
        ];

        hooks = {
          alejandra = {
            enable = true;
            package = pkgs.alejandra;
          };
          deadnix = {
            enable = true;
            package = pkgs.deadnix;
          };
          nil = {
            enable = true;
            package = pkgs.nil;
          };
          statix = {
            enable = true;
            package = pkgs.statix;
          };
        };
      };
    };
  };
}
