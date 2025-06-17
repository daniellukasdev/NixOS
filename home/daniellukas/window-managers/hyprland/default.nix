{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./config/binds.nix
    ./config/nwg-dock-hyprland
    ./config/rules.nix
    ./config/settings.nix
    ./programs/anyrun.nix
    ./programs/waybar.nix
    ./services/cliphist.nix
    ./services/dunst.nix
    ./services/hypridle.nix
    ./services/hyprlock.nix
    ./services/hyprpaper.nix
    ./services/polkit-agent.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.borders-plus-plus
      # inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      inputs.hyprspace.packages.${pkgs.system}.Hyprspace
    ];
    # plugins = with pkgs.hyprlandPlugins; [
    #   hyprexpo
    # ];
    systemd = {
      enable = true;
      variables = ["--all"];
    };
  };
}
