{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./config

    # inputs.self.homeManagerModules.swaync
  ];

}
