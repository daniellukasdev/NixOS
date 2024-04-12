{
  imports = [
    ./bash.nix
    ./chromium.nix
    ./home-manager.nix
    ./zsh.nix
  ];

  programs = {
    dconf.enable = true;
    kdeconnect.enable = true;
    xfconf.enable = true;
  };
}
