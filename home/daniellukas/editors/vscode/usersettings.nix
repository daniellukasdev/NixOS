{
  config,
  pkgs,
  ...
}: {
  programs.vscode.profiles.default.userSettings = let
    breadcrumbs = {
      "breadcrumbs.enabled" = true;
      "breadcrumbs.symbolPath" = "on";
      "breadcrumbs.filePath" = "on";
    };

    editor = {
      "editor.bracketPairColorization.enabled" = true;
      "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;
      "editor.cursorBlinking" = "smooth";
      "editor.cursorSmoothCaretAnimation" = "on";
      "editor.codeActionsOnSave"."source.fixAll" = "always";
      "editor.fontFamily" = "'Maple Mono NF', 'monospace', monospace";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 14;
      "editor.fontWeight" = "500";
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "editor.formatOnType" = true;
      "editor.guides.bracketPairs" = "active";
      "editor.guides.bracketPairsHorizontal" = "active";
      "editor.guides.indentation" = true;
      "editor.inlayHints.enabled" = "on";
      "editor.inlayHints.padding" = true;
      "editor.inlineSuggest.enabled" = true;
      "editor.linkedEditing" = true;
      "editor.lineNumbers" = "on";
      "editor.minimap.enabled" = true;
      "editor.parameterHints.enabled" = true;
      "editor.scrollbar.horizontal" = "hidden";
      "editor.semanticHighlighting.enabled" = true;
      "editor.showUnused" = true;
      "editor.snippetSuggestions" = "top";
      "editor.stickyScroll.enabled" = true;
      "editor.tabCompletion" = "on";
      "editor.tabSize" = 2;
      "editor.trimAutoWhitespace" = true;
      "editor.wordWrap" = "on";
      "editor.wrappingIndent" = "indent";
    };

    explorer = {
      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;
    };

    files = {
      "files.autoSave" = "onWindowChange";
      "files.insertFinalNewline" = true;
      "files.trimTrailingWhitespace" = true;
    };

    # Formatter settings
    formatter = {
      "[astro]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[css]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[html]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[javascript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[json]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[jsonc]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[markdown]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
      "[scss]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[svelte]"."editor.defaultFormatter" = "svelte.svelte-vscode";
      "[typescript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[typescriptreact]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
    };

    general = {
      "extensions.autoCheckUpdates" = false;
      "extensions.autoUpdate" = false;
      "update.mode" = "none";
      "update.showReleaseNotes" = false;
      "redhat.telemetry.enabled" = false;
      "telemetry.telemetryLevel" = "off";
    };

    # Language specific settings
    language = {
      # go
      "go.alternateTools" = {
        "delve" = "${pkgs.delve}/bin/dlv";
        "gofumpt" = "${pkgs.gofumpt}/bin/gofumpt";
        "golangci-lint" = "${pkgs.golangci-lint}/bin/golangci-lint";
        "gomodifytags" = "${pkgs.gomodifytags}/bin/gomodifytags";
        "gopls" = "${pkgs.gopls}/bin/gopls";
        "impl" = "${pkgs.impl}/bin/impl";
        "staticcheck" = "${pkgs.go-tools}/bin/staticcheck";
      };
      "go.inlayHints.assignVariableTypes" = true;
      "go.inlayHints.compositeLiteralFields" = true;
      "go.inlayHints.compositeLiteralTypes" = true;
      "go.inlayHints.constantValues" = true;
      "go.inlayHints.functionTypeParameters" = true;
      "go.inlayHints.parameterNames" = true;
      "go.inlayHints.rangeVariableTypes" = true;
      "go.lintTool" = "golangci-lint";
      "go.useLanguageServer" = true;
      "gopls" = {
        "formatting.gofumpt" = true;
        "ui.semanticTokens" = true;
      };
      "emeraldwalk.runonsave" = {
        "commands" = [
          {
            "cmd" = "${pkgs.goimports-reviser}/bin/goimports-reviser -rm-unused -set-alias -format -use-cache -output write \${file}";
            "match" = "\\.go$";
          }
          {
            "cmd" = "${pkgs.golines}/bin/golines \${file} -w";
            "match" = "\\.go$";
          }
        ];
      };

      # javascript
      "javascript.inlayHints.functionLikeReturnTypes.enabled" = true;
      "javascript.inlayHints.parameterNames.enabled" = "all";
      "javascript.inlayHints.parameterTypes.enabled" = true;
      "javascript.inlayHints.propertyDeclarationTypes.enabled" = true;
      "javascript.preferGoToSourceDefinition" = true;
      "javascript.suggest.completeFunctionCalls" = true;

      # nix
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "${pkgs.nil}/bin/nil";
      "nix.serverSettings"."nil"."formatting"."command" = ["${pkgs.alejandra}/bin/alejandra"];

      # typescript
      "typescript.inlayHints.functionLikeReturnTypes.enabled" = true;
      "typescript.inlayHints.parameterNames.enabled" = "all";
      "typescript.inlayHints.parameterTypes.enabled" = true;
      "typescript.inlayHints.propertyDeclarationTypes.enabled" = true;
      "typescript.preferGoToSourceDefinition" = true;
      "typescript.suggest.completeFunctionCalls" = true;
    };

    terminal = {
      "terminal.integrated.fontFamily" = "'Maple Mono NF', 'monospace', monospace";
      "terminal.integrated.fontSize" = 14;
      "terminal.integrated.gpuAcceleration" = "on";
      "terminal.integrated.minimumContrastRatio" = 1;
    };

    theme = let
      inherit (config.theme.colorscheme) xcolors;
    in {
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
      "catppuccin.accentColor" = "blue";
      "catppuccin.bracketMode" = "rainbow";
      "catppuccin.workbenchMode" = "default";
      "catppuccin.boldKeywords" = true;
      "catppuccin.italicKeywords" = true;
      "catppuccin.italicComments" = true;
      "catppuccin.syncWithIconPack" = true;
      "catppuccin.extraBordersEnabled" = false;
      "catppuccin.colorOverrides" = {
        "mocha" = {
          "rosewater" = "${xcolors.rosewater}";
          "flamingo" = "${xcolors.flamingo}";
          "pink" = "${xcolors.pink}";
          "mauve" = "${xcolors.mauve}";
          "red" = "${xcolors.red}";
          "maroon" = "${xcolors.maroon}";
          "peach" = "${xcolors.peach}";
          "yellow" = "${xcolors.yellow}";
          "green" = "${xcolors.green}";
          "teal" = "${xcolors.teal}";
          "blue" = "${xcolors.blue}";
          "sky" = "${xcolors.sky}";
          "lavender" = "${xcolors.lavender}";
          "crust" = "${xcolors.black0}";
          "mantle" = "${xcolors.black1}";
          "base" = "${xcolors.black2}";
          "surface0" = "${xcolors.black3}";
          "surface1" = "${xcolors.black4}";
          "surface2" = "${xcolors.gray0}";
          "overlay0" = "${xcolors.gray1}";
          "overlay1" = "${xcolors.gray2}";
          "text" = "${xcolors.white}";
        };
      };
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

    # Extension settings
    extension = {
      # git
      "git.autofetch" = true;
      "git.enableCommitSigning" = true;
      "git.enableSmartCommit" = true;
      "git.openRepositoryInParentFolders" = "always";

      # errorLens
      "errorLens.gutterIconsEnabled" = true;
      "errorLens.gutterIconSet" = "defaultOutline";

      # eslint
      "eslint.format.enable" = true;
      "eslint.problems.shortenToSingleLine" = true;
      "eslint.validate" = [
        "javascript"
        "typescript"
        "javascriptreact"
        "typescriptreact"
        "astro"
        "svelte"
      ];

      # prettier
      "prettier.jsxSingleQuote" = true;

      # svelte
      "svelte.enable-ts-plugin" = true;
    };

    window = {
      "window.dialogStyle" = "custom";
      "window.menuBarVisibility" = "toggle";
      "window.restoreWindows" = "all";
      "window.titleBarStyle" = "custom";
      "window.zoomLevel" = 1;
    };

    workbench = {
      "workbench.activityBar.location" = "top";
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.editor.empty.hint" = "hidden";
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.layoutControl.enabled" = false;
      "workbench.panel.defaultLocation" = "bottom";
      "workbench.sideBar.location" = "left";
      "workbench.startupEditor" = "none";
      "workbench.tree.indent" = 16;
    };
  in
    general
    // breadcrumbs
    // editor
    // explorer
    // extension
    // files
    // formatter
    // language
    // terminal
    // theme
    // window
    // workbench;
}
