{
  inputs,
  lib,
  ...
}: let

  homeProfile = "gnome";

  sharedModules = [
    ./modules/programs/git.nix
    ./modules/programs/gpg.nix
    ./modules/programs/ssh.nix
    ./modules/programs/starship.nix
    ./modules/programs/utils.nix
    ./modules/programs/zsh.nix
    # ./modules/services/gnome-keyring.nix
  ];

  gnomeModules = [
    ./modules/services/gnome-keyring.nix
  ];

  # sharedPackages = [
  #   ./shared
  # ];

  homeImports = {
    "daniellukas@${homeProfile}" =
      [
        ./home.nix
        ./profiles/${homeProfile}.nix
      ]
    # ++ lib.concatLists [sharedPackages]
    ++ lib.concatLists [sharedModules]
    ++ lib.concatLists [gnomeModules];
    # "daniellukas@gnome" =
    #   [
    #     ./home.nix
    #     ./profiles/gnome.nix
    #   ]
    # ++ lib.concatLists [sharedPackages]
    # ++ lib.concatLists [sharedModules]
    # ++ lib.concatLists [gnomeModules];
    # "daniellukas@hyprland" =
    #   [
    #     ./home.nix
    #     ./profiles/hyprland.nix
    #   ]
      # ++ lib.concatLists [sharedPackages]
      # ++ lib.concatLists [sharedModules]
      # ++ lib.concatLists [gnomeModules];
    # "daniellukas@kdePlasma" =
    #   [
    #     ./home.nix
    #     ./profiles/kdePlasma.nix
    #   ]
    # ++ lib.concatLists [sharedPackages]
    # ++ lib.concatLists [sharedModules];
  };

  inherit (inputs.home-manager.lib) homeManagerConfiguration;
  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  _module.args = {inherit homeImports;};

  flake = {
    homeConfigurations = {
      "daniellukas@${homeProfile}" = homeManagerConfiguration {
        inherit pkgs;
        modules = homeImports."daniellukas@${homeProfile}";
      };
      # "daniellukas@gnome" = homeManagerConfiguration {
      #   inherit pkgs;
      #   modules = homeImports."daniellukas@gnome";
      # };
      # "daniellukas@hyprland" = homeManagerConfiguration {
      #   inherit pkgs;
      #   modules = homeImports."daniellukas@hyprland";
      # };
      # "daniellukas@kdePlasma" = homeManagerConfiguration {
      #   inherit pkgs;
      #   modules = homeImports."daniellukas@kdePlasma";
      # };
    };
  };
}
