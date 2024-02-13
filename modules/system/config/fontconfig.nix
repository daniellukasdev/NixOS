{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = false;

    fontconfig = {
      enable = true;

      antialias = true;

      defaultFonts = {
        emoji = ["Noto Color Emoji"];
        monospace = [
          "FiraMono Nerd Font"
          "Iosevka Term"
          "Iosevka Term Nerd Font Complete Mono"
          "Iosevka Nerd Font"
          "Noto Color Emoji"
        ];
        serif = ["Noto Serif" "Noto Color Emoji"];
        sansSerif = ["Inter" "Noto Color Emoji"];
      };

      hinting = {
        enable = true;
        autohint = false;
        style = "full";
      };

      subpixel = {
        lcdfilter = "default";
        rgba = "rgb";
      };
    };

    fontDir = {
      enable = true;
      decompressFonts = true;
    };

    packages = with pkgs; [
      iosevka-bin
      fira
      fira-code
      fira-code-symbols
      fira-code-nerdfont
      material-icons
      material-design-icons
      monaspace
      nerdfonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      roboto

      (google-fonts.override {fonts = ["Inter"];})
      (nerdfonts.override {fonts = ["Iosevka"];})
    ];
  };
}
