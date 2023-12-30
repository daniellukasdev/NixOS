{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      cantarell-fonts
      fira
      fira-code-nerdfont
      lato
      maple-mono
      maple-mono-NF
      maple-mono-SC-NF
      material-symbols
      nerdfonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      roboto-slab
    ];

    fontconfig = {
      enable = true;
      antialias = true;
      hinting = {
        enable = true;
        autohint = true;
        style = "full";
      };

      subpixel.lcdfilter = "default";

      defaultFonts = {
        emoji = ["Noto Color Emoji"];
        monospace = ["FiraMono Nerd Font"];
        sansSerif = ["Lato"];
        serif = ["Roboto Slab"];
      };
    };
  };
}
