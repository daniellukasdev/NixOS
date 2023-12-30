{
  description = "NixOS Configuration of danlukasdev";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    # ags = {
    #   url = "github:Aylur/ags";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # anyrun = {
    #   url = "github:Kirottu/anyrun";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # hyprland.url = "github:hyprwm/Hyprland/";
    # hyprland-contrib = {
    #   url = "github:hyprwm/contrib";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # hyprpaper.url = "github:hyprwm/hyprpaper";
    # xdg-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";

    # spicetify-nix = {
    #   url = "github:MichaelPachec0/spicetify-nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    forEachSystem = nixpkgs.lib.genAttrs ["x86_64-linux"];
    forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});
  in {
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;
    overlays = import ./overlays {inherit inputs outputs;};
    packages = forEachPkgs (pkgs: import ./pkgs {inherit pkgs;});
    # devShells = forEachPkgs (pkgs: import ./shell.nix {inherit pkgs;});

    # NixOS Configuration
    nixosConfigurations = {
      # Laptop
      dellxps = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./hosts/dellxps];
      };
    };

    # Home Manager
    homeConfigurations = {
      # Laptop
      "danlukasdev@dellxps" = home-manager.lib.homeManagerConfiguration {
        # pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/danlukasdev/dellxps];
      };
    };
  };
}
