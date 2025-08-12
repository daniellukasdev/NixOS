{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  gtk3,
  hicolor-icon-theme,
  jdupes,
  boldPanelIcons ? false,
  # blackPanelIcons ? false,
  # alternativeIcons ? false,
  themeVariants ? [],
}: let
  pname = "mactahoe-icon-theme";
in
  lib.checkListOfEnum "${pname}: theme variants" [
    "default"
    "purple"
    "pink"
    "red"
    "orange"
    "yellow"
    "green"
    "grey"
    "all"
  ]
  themeVariants
  stdenvNoCC.mkDerivation rec {
    inherit pname;
    version = "master";

    src = fetchFromGitHub {
      owner = "vinceliuice";
      repo = pname;
      rev = version;
      hash = "sha256-rJB71dbrznaG9vtC0AP3+M1vDsOKjYlpdMBbl76uA/8=";
    };

    nativeBuildInputs = [gtk3 jdupes];

    buildInputs = [hicolor-icon-theme];

    # These fixup steps are slow and unnecessary
    dontPatchELF = true;
    dontRewriteSymlinks = true;
    dontDropIconThemeCache = true;

    postPatch = ''
      patchShebangs install.sh
    '';

    # future options?
    # ${lib.optionalString alternativeIcons "--alternative"} \
    # ${lib.optionalString blackPanelIcons "--black"}
    installPhase = ''
      runHook preInstall

      ./install.sh --dest $out/share/icons \
        --name MacTahoe \
        --theme ${builtins.toString themeVariants} \
        ${lib.optionalString boldPanelIcons "--bold"} \

      jdupes --link-soft --recurse $out/share

      runHook postInstall
    '';

    meta = with lib; {
      description = "MacOS Tahoe style icon theme for Linux desktops";
      homepage = "https://github.com/vinceliuice/MacTahoe-icon-theme";
      license = licenses.gpl3Plus;
      platforms = platforms.linux;
      # maintainers = with maintainers; [];
    };
  }
