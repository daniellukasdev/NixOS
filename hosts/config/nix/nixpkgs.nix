{inputs, ...}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "beekeeper-studio-5.1.5"
      ];
    };

    overlays = [
      inputs.nix-vscode-extensions.overlays.default
      # inputs.nixpkgs-wayland.overlay
      inputs.nur.overlays.default
      inputs.rust-overlay.overlays.default
    ];
  };
}
