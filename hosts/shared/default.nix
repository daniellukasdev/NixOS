{
  lib,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports =
    [
      inputs.home-manager.nixosModules.home-manager
      ./base
      ./environment
      ./networking
      ./pkgs
      ./programs
      ./security
      ./services
    ]
    ++ (builtins.attrValues outputs.nixosModules);

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs outputs;};
  };

  nixpkgs = {
    config.permittedInsecurePackages = [
      "electron-25.9.0"
    ];

    overlays = [
      outputs.overlays.default
    ];

    config = {
      allowUnfree = true;
    };
  };
}
