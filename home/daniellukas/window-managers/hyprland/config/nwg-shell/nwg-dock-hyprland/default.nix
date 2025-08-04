{config, ...}: let
  inherit
    (config.theme.colorscheme)
    # rgbaColors
    rgba48Colors
    rgbaAltColors
    xcolors
    ;
  inherit (config.theme.style.variables) borderSolidOverlayDark overlayBaseColorHexAlpha borderSolidOverlayLightAlpha;
in {
  home.file.".config/nwg-dock-hyprland/style.css".text = ''
    * {
      transition: all 300ms cubic-bezier(0.4, 0, 0.2, 1);
    }

    window {
      background: ${overlayBaseColorHexAlpha};
      border: ${borderSolidOverlayDark};
      border-radius: 14px;
      box-shadow: ${borderSolidOverlayLightAlpha};
    }

    #box {
      padding: 4px;
      border-radius: 10px;
    }

    #active {
      background-color: ${rgbaAltColors.gray1};
      border-radius: 10px;
    }

    button, image {
      background: none;
      border-style: none;
      box-shadow: none;
      color: ${rgba48Colors.white};
    }

    button {
      padding: 4px;
      margin: 2px;
      color: ${rgba48Colors.white};
      font-size: 12px;
      border-radius: 8px;
      outline: none;
    }

    button:hover {
      background-color: ${rgbaAltColors.gray2};
    }

    button:focus {
      box-shadow: none;
      outline: none;
    }

    .workspace-dot {
      background-color: ${xcolors.gray1};
      border-radius: 50%;
    }

    .workspace-dot.active {
      background-color: ${xcolors.blue};
    }

    .workspace-dot.inactive {
      background-color: ${xcolors.gray0};
    }

    tooltip, .tooltip, #tooltip, popover, .popover {
      opacity: 0;
      background: transparent;
      transition: none;
      border: none;
      box-shadow: none;
    }
  '';

  home.file.".cache/nwg-dock-pinned".text = ''
    org.gnome.Nautilus
    codium
    1Password
    obsidian
    discord
    firefox
    blender
    Postman
    beekeeper-studio
    kitty
    Gimp-2.10
    org.inkscape.Inkscape
    spotify
    nwg-drawer
  '';
}
