{
  config,
  pkgs,
  ...
}: let
  goPath = ".go";
  goBin = "${goPath}/bin";
in {
  programs.go = rec {
    enable = true;
    env = {
      GOPATH = goPath;
      GOBIN = goBin;
    };
  };

  home = {
    packages = with pkgs; [
      gofumpt
      goimports-reviser
      golangci-lint
      golines
      gomodifytags
      gopls
      gotests
      go-tools # staticcheck
      gotools # goimports
      delve
      impl
      revive
    ];

    sessionPath = ["${config.home.homeDirectory}/${config.programs.go.env.GOBIN}"];
  };
}
