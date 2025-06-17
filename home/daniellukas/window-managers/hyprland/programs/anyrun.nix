{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];

  programs.anyrun = {
    enable = true;
    config = {
      x.fraction = 0.5;
      y.fraction = 0.3;
      width.fraction = 0.5;
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = true;
      closeOnClick = true;
      showResultsImmediately = false;
      maxEntries = 10;
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        dictionary
        rink
        shell
        symbols
      ];
    };

    extraConfigFiles = {
      "applications.ron".text = ''
        Config(
          desktop_actions: true,
          max_entries: 10,
          terminal: Some("kitty"),
        )
      '';
      "dictionary.ron".text = ''
        Config(
          prefix: ":def",
          max_entries: 5,
        )
      '';
    };

    extraCss = let
      inherit (config.theme.colorscheme) xcolors;
      inherit
        (config.theme.style.variables)
        borderColorHexDark
        borderSize
        inherentColorHexAlpha
        overlayBaseColorHexAlpha
        overlayBorderLightAlpha
        ;
    in ''
      /* Global */
      * {
        all: unset;
        font-family: "Poppins", sans-serif;
        font-size: 12pt;
        font-weight: 500;
        transition: 300ms;
      }

      /* Modules */
      #window,
      #match,
      #entry,
      #plugin,
      #main {
        background: transparent;
      }

      /* Entry */
      #entry {
        margin: 0.5rem;
        padding: 0.5rem;
        font-size: 14pt;
        background: ${xcolors.black2};
        border: 1px solid ${overlayBorderLightAlpha};
        box-shadow: inset 0 0 0 1px ${borderColorHexDark};
        border-radius: 14px;
      }

      /* Match  */

      #match.activatable {
        background: ${overlayBaseColorHexAlpha};
        padding: 0.5rem 1rem;
      }

      #match.activatable:first-child {
        border-radius: 12px 12px 0 0;
      }

      #match.activatable:last-child {
        border-radius: 0 0 12px 12px;
      }

      #match.activatable:only-child {
        border-radius: 12px;
      }

      /* Hover and selected states */
      #match:selected,
      #match:hover,
      #plugin:hover {
        background: ${inherentColorHexAlpha};
      }

      /* Main container */
      box#main {
        padding: 1rem 1rem 2rem 1rem;
        background: ${overlayBaseColorHexAlpha};
        border: 1px solid ${borderColorHexDark};
        box-shadow: inset 0 0 0 1px ${overlayBorderLightAlpha};
        border-radius: 16px;
      }

      /* Plugin within list */
      list > #plugin {
        margin: 0.5rem;
        padding: ${toString (borderSize * 2)}px;
        background: ${xcolors.black2};
        border: 1px solid ${overlayBorderLightAlpha};
        box-shadow: inset 0 0 0 1px ${borderColorHexDark};
        border-radius: 14px;
      }
    '';
  };
}
