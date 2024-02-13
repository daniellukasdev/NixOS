{inputs, ...}: {
  imports = [
    inputs.nh.nixosModules.default
  ];

  environment.variables.FLAKE = "/home/daniellukas/Documents/code/dellxps";

  nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 30d";
    };
  };
}
