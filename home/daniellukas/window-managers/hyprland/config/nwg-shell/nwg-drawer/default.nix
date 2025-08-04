{
  config,
  # pkgs,
  ...
}: let
  inherit
    (config.theme.colorscheme)
    # rgbaColors
    # rgba48Colors
    rgbaAltColors
    xcolors
    ;
  inherit
    (config.theme.style.variables)
    borderColorHexDark
    inherentColorHex
    inherentColorHexAlpha
    overlayBorderLightAlpha
    ;
in {
  home.file.".config/nwg-drawer/drawer.css".text = ''
    * {
      all: unset;
      font-family: "Poppins", sans-serif;
      font-size: 12pt;
      font-weight: 600;
      color: ${inherentColorHex};
      transition: 300ms;
    }

    window {
      background: ${rgbaAltColors.black3};
      border-radius: 0px;
    }

    /* search entry */
    entry {
      margin: 0.5rem;
      padding: 0.5rem;
      font-size: 14pt;
      background: ${xcolors.black2};
      border: 1px solid ${borderColorHexDark};
      box-shadow: inset 0 0 0 1px ${overlayBorderLightAlpha};
      border-radius: 14px;
    }

    flowbox,
    #pinned-box,
    #files-box {
      border-radius: 16px;
    }

    flowbox {
      margin: 0;
      padding: 1rem 0rem 2rem 0rem;
      /* background: ${rgbaAltColors.black1};
      border: 1px solid ${borderColorHexDark};
      box-shadow: inset 0 0 0 1px ${inherentColorHexAlpha}; */
    }

    button, image {
      border-radius: 14px;
    }

    button {
      margin: 0.24rem 2rem;
      padding: 2rem 1rem;
      background: transparent;
      border: 1px solid transparent;
      box-shadow: inset 0 0 0 0px ${borderColorHexDark};
    }

    button:hover {
      background: ${inherentColorHexAlpha};
      border: 1px solid ${borderColorHexDark};
      box-shadow: inset 0 0 0 1px ${inherentColorHexAlpha};
    }

    image {
      margin: 0;
      padding: 0;
      background: none;
    }

    /* in case you wanted to give category buttons a different look */
    #category-button {
      margin: 0 0.48rem;
      padding: 0.48rem 1.72rem;
      background: ${inherentColorHexAlpha};
      border: 1px solid ${overlayBorderLightAlpha};
      box-shadow: inset 0 0 0 1px ${borderColorHexDark};
    }

    #pinned-box {
      padding-bottom: 5px;
      border: 1px dotted ${borderColorHexDark};
      box-shadow: inset 0 0 0 1px ${overlayBorderLightAlpha};
    }

    #files-box {
      padding: 5px;
      border: 1px dotted ${inherentColorHexAlpha};
    }

    /* math operation result label */
    #math-label {
      font-weight: bold;
      font-size: 16pt;
    }
  '';

  home.file.".local/share/applications/nwg-drawer.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=nwg-drawer
    GenericName=Application Launcher
    Comment=Launches nwg-drawer
    Keywords=windows;launchers;
    Icon=view-app-grid
    Exec=nwg-drawer -ovl
    NotShowIn=GNOME;KDE;XFCE;MATE;
    StartupNotify=true
    Categories=Applications;
  '';
}
