{
  fonts.fontconfig = {
    enable = true;

    antialias = true;

    hinting = {
      enable = true;
      autohint = false;
      style = "full";
    };

    subpixel = {
      lcdfilter = "default";
      rgba = "rgb";
    };

    defaultFonts = {
      monospace = ["Maple Mono NF"];
      sansSerif = ["Poppins" "Noto Color Emoji"];
      serif = ["Crimson Pro Font" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
