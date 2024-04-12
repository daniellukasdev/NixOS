{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
# let
# imports = [
#   inputs.self.homeManagerModules.chromium
# ];
# with lib; let
#   cfg = config.programs.chromium;
#   defaultProfile = filterAttrs (k: v: v != null) {
#     HomepageLocation = cfg.homepageLocation;
#     DefaultSearchProviderEnabled = cfg.defaultSearchProviderEnabled;
#     DefaultSearchProviderSearchURL = cfg.defaultSearchProviderSearchURL;
#     DefaultSearchProviderSuggestURL = cfg.defaultSearchProviderSuggestURL;
#     ExtensionInstallForcelist = cfg.extensions;
#   };
# in
{
  # home.sessionVariables.BROWSER = "chromium";

  # xdg.mimeApps.defaultApplications = builtins.listToAttrs (
  #   map (mimeType: {
  #     name = mimeType;
  #     value = ["chromium-browser.desktop"];
  #   })
  #   # mimeTypes
  # );

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
    extraOpts = {};
    initialPrefs = {};
    homepageLocation = "www.google.com";
    # defaultSearchProviderEnabled = true;
    # defaultSearchProviderSearchURL = null;
    # defaultSearchProviderSuggestURL = null;
  };
}
