{config, ...}: let
  inherit (config.theme.colorscheme) xcolors;
  theme = {
    # "workbench.colorTheme" = "Catppuccin Mocha";
    # "workbench.iconTheme" = "catppuccin-mocha";
    "indentRainbow.colors" = [
      "#ea8dff0f"
      "#fedf430f"
      "#5cb8ff0f"
      "#54dfcb0f"
      "#4ad9680f"
      "#ffa0560f"
    ];
    "workbench.colorCustomizations" = {
      "terminal.ansiBlack" = "${xcolors.black2}";
      "terminal.ansiBrightBlack" = "${xcolors.black2}";
      "terminal.ansiRed" = "${xcolors.red}";
      "terminal.ansiBrightRed" = "${xcolors.red}";
      "terminal.ansiGreen" = "${xcolors.green}";
      "terminal.ansiBrightGreen" = "${xcolors.green}";
      "terminal.ansiYellow" = "${xcolors.yellow}";
      "terminal.ansiBrightYellow" = "${xcolors.yellow}";
      "terminal.ansiBlue" = "${xcolors.blue}";
      "terminal.ansiBrightBlue" = "${xcolors.blue}";
      "terminal.ansiMagenta" = "${xcolors.pink}";
      "terminal.ansiBrightMagenta" = "${xcolors.pink}";
      "terminal.ansiCyan" = "${xcolors.sky}";
      "terminal.ansiBrightCyan" = "${xcolors.sky}";
      "terminal.ansiWhite" = "${xcolors.white}";
      "terminal.ansiBrightWhite" = "${xcolors.white}";
      "terminal.foreground" = "${xcolors.white}";
      "terminal.selectionBackground" = "${xcolors.gray1}";
    };
  };
in
  theme
