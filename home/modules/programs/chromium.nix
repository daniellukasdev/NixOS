{
  inputs,
  pkgs,
  ...
}: let
  # firefox-whitesur-theme = inputs.self.packages.${pkgs.system}.firefox-whitesur-theme.override {
  #   firefoxStyle = "alt";
  # };
  # mimeTypes = [
  #   "application/json"
  #   "application/pdf"
  #   "application/x-extension-htm"
  #   "application/x-extension-html"
  #   "application/x-extension-shtml"
  #   "application/x-extension-xhtml"
  #   "application/x-extension-xht"
  #   "application/xhtml+xml"
  #   "text/html"
  #   "text/xml"
  #   "x-scheme-handler/about"
  #   "x-scheme-handler/ftp"
  #   "x-scheme-handler/http"
  #   "x-scheme-handler/unknown"
  #   "x-scheme-handler/https"
  # ];
in {
  # home.sessionVariables.BROWSER = "chromium";

  xdg.mimeApps.defaultApplications = builtins.listToAttrs (
    map (mimeType: {
      name = mimeType;
      value = ["chromium-browser.desktop"];
    })
    # mimeTypes
  );

  programs.chromium = {
    enable = true;
    extensions = [
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # darkreader
      "bcjindcccaagfpapjjmafapmmgkkhgoa" # JSON Formatter
      "bggfcpfjbdkhfhfmkjpbhnkhnpjjeomc" # Material Icons for Github
      "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # onepassword-password-manager
      "fmkadmapgofadopljbjfkapdkoienihi" # React Developer Tools
      "hlepfoohegkhhmjieoechaddaejaokhf" # refined-github
      "nplimhmoanghlebhdiboeellhgmgommi" # Tab Groups Extension
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock-origin
    ];
    # extraOpts = {};
    # initialPrefs = {};
    # homepageLocation = "www.google.com";
  };
}
