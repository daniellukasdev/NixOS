{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      corefonts
      crimson-pro
      geist-font
      maple-mono.NF # MapleMono-NF
      maple-mono.variable
      nerd-fonts.geist-mono
      noto-fonts
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      poppins
      vistafonts
    ];
  };
}
