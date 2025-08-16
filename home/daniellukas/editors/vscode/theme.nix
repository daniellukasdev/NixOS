{config, ...}: let
  inherit (config.theme.colorscheme.xcolors) icDark;
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
      "terminal.ansiBlack" = "${icDark.gray6}";
      "terminal.ansiBrightBlack" = "${icDark.gray6}";
      "terminal.ansiRed" = "${icDark.red}";
      "terminal.ansiBrightRed" = "${icDark.red}";
      "terminal.ansiGreen" = "${icDark.green}";
      "terminal.ansiBrightGreen" = "${icDark.green}";
      "terminal.ansiYellow" = "${icDark.yellow}";
      "terminal.ansiBrightYellow" = "${icDark.yellow}";
      "terminal.ansiBlue" = "${icDark.blue}";
      "terminal.ansiBrightBlue" = "${icDark.blue}";
      "terminal.ansiMagenta" = "${icDark.pink}";
      "terminal.ansiBrightMagenta" = "${icDark.pink}";
      "terminal.ansiCyan" = "${icDark.cyan}";
      "terminal.ansiBrightCyan" = "${icDark.cyan}";
      "terminal.ansiWhite" = "${icDark.white}";
      "terminal.ansiBrightWhite" = "${icDark.white}";
      "terminal.foreground" = "${icDark.white}";
      "terminal.selectionBackground" = "${icDark.gray}";
    };
  };
in
  theme
