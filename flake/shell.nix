{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "dellxps";

      shellHook = ''
        ${config.pre-commit.installationScript}
      '';

      DIRENV_LOG_FORMAT = "";

      packages = with pkgs; [
        alejandra
        deadnix
        git
        nil
        nixd
        nixfmt
        statix
      ];
    };

    formatter = pkgs.alejandra;
  };
}
