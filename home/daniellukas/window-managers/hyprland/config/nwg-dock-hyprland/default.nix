{
  config,
  # pkgs,
  ...
}: let
  inherit
    (config.theme.colorscheme)
    # rgbaColors
    rgba48Colors
    rgbaAltColors
    xcolors
    ;
in {
  # window {
  #     background: ${rgba48Colors.black0};
  #     border: 0.08rem solid ${rgbaColors.gray2};
  #     border-style: solid;
  #     border-radius: 16px;
  #     border-color: ${rgbaColors.gray2};
  #     box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
  #   }
  home.file.".config/nwg-dock-hyprland/style.css".text = ''
    * {
      transition: all 300ms cubic-bezier(0.4, 0, 0.2, 1);
    }

    window {
      background: ${rgba48Colors.black1};
      border: 0.08rem solid ${rgba48Colors.gray1};
      border-radius: 16px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
    }

    #box {
      padding: 4px;
      border-radius: 12px;
    }

    #active {
      background-color: ${rgba48Colors.gray0};
      border-radius: 12px;
      transition: all 300ms cubic-bezier(0.4, 0, 0.2, 1);
    }

    button, image {
      background: none;
      border-style: none;
      box-shadow: none;
      color: ${rgba48Colors.white};
      transition: all 300ms cubic-bezier(0.4, 0, 0.2, 1);
    }

    button {
      padding: 4px;
      margin: 2px;
      color: ${rgba48Colors.white};
      font-size: 12px;
      border-radius: 10px;
      outline: none;
      transition: all 300ms cubic-bezier(0.4, 0, 0.2, 1);
    }

    button:hover {
      background-color: ${rgba48Colors.gray0};
    }

    button:focus {
      box-shadow: none;
      outline: none;
    }

    .workspace-dot {
      background-color: ${rgbaAltColors.gray1};
      border-radius: 50%;
      transition: all 300ms cubic-bezier(0.4, 0, 0.2, 1);
    }

    .workspace-dot.active {
      background-color: ${xcolors.blue};
    }

    .workspace-dot.inactive {
      background-color: ${rgbaAltColors.gray0};
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
    thunar
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
  '';
}
