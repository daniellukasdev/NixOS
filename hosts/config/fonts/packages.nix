{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      corefonts
      crimson-pro
      geist-font
      maple-mono.NF # Maple Mono NF
      # maple-mono.variable
      nerd-fonts.geist-mono
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      poppins
      vistafonts
    ];
  };
}
