{
  homeImports,
  inputs,
  self,
  themes,
  ...
}: let
  inherit (inputs.nixpkgs.lib) nixosSystem;

  modules = "${self}/modules/system";
  hardware = modules + "/hardware";
  profiles = "${self}/hosts/profiles";

  specialArgs = {inherit inputs self themes;};
in {
  flake.nixosConfigurations = {
    # Dell XPS 17 9720
    dellxps = nixosSystem {
      inherit specialArgs;

      modules = [
        ./dellxps

        "${modules}/config"
        "${modules}/programs"
        "${modules}/security"
        "${modules}/services"
        "${hardware}/bluetooth.nix"
        "${hardware}/intel.nix"
        # "${hardware}/nvidia.nix"
        "${profiles}/gnome"
        # "${profiles}/hyprland"
        # "${profiles}/kde"

        {
          home-manager = {
            users.daniellukas.imports = homeImports."daniellukas@gnome";
            extraSpecialArgs = specialArgs;
          };
          # home-manager = {
          #   users.daniellukas.imports = homeImports."daniellukas@hyprland";
          #   extraSpecialArgs = specialArgs;
          # };
        }
      ];
    };
  };
}
