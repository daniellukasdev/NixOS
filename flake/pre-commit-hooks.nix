{inputs, ...}: {
  imports = [inputs.pre-commit-hooks.flakeModule];

  perSystem.pre-commit = {
    check.enable = true;

    settings = {
      excludes = ["flake.lock"];
      hooks = {
        alejandra.enable = true;
        deadnix.enable = true;
        nil.enable = true;
        # nixd.enable = true;
        statix.enable = true;
      };
    };
  };
}
