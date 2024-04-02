{
  inputs,
  pkgs,
  ...
}: let
  firefox-gnome-theme = inputs.self.packages.${pkgs.system}.firefox-gnome-theme;
  firefox-whitesur-theme = inputs.self.packages.${pkgs.system}.firefox-whitesur-theme;
  # firefox-whitesur-theme = inputs.self.packages.${pkgs.system}.firefox-whitesur-theme.override {
  #   firefoxStyle = "alt";
  # };

  mimeTypes = [
    "application/json"
    "application/pdf"
    "application/x-extension-htm"
    "application/x-extension-html"
    "application/x-extension-shtml"
    "application/x-extension-xhtml"
    "application/x-extension-xht"
    "application/xhtml+xml"
    "text/html"
    "text/xml"
    "x-scheme-handler/about"
    "x-scheme-handler/ftp"
    "x-scheme-handler/http"
    "x-scheme-handler/unknown"
    "x-scheme-handler/https"
  ];
in {
  home.sessionVariables.BROWSER = "firefox";

  xdg.mimeApps.defaultApplications = builtins.listToAttrs (
    map (mimeType: {
      name = mimeType;
      value = ["firefox.desktop"];
    })
    mimeTypes
  );

  programs.firefox = {
    enable = true;
    profiles.daniellukas = {
      bookmarks = [
        {
          name = "NixOS Config";
          toolbar = true;
          bookmarks = [
            {
              name = "NixOS Manual";
              url = "https://nixos.org/manual/nix/stable/language";
              tags = ["NixOS" "reference"];
            }
            {
              name = "NixOS Package Search";
              url = "https://search.nixos.org/packages";
              tags = ["NixOS" "reference" "packages" "search"];
            }
            {
              name = "Nixpkags Fetchers";
              url = "https://ryantm.github.io/nixpkgs/builders/fetchers/";
              tags = ["NixOS" "reference" "nixpkgs" "fetchers"];
            }
            {
              name = "Firefox Extensions";
              url = "https://github.com/nix-community/nur-combined/blob/master/repos/rycee/pkgs/firefox-addons/generated-firefox-addons.nix";
              tags = ["NixOS" "reference" "packages" "search" "firefox" "extensions"];
            }
            {
              name = "Nixpkgs Pull Request Tracker (GNOME 46)";
              url = "https://nixpk.gs/pr-tracker.html?pr=291339";
              tags = ["NixOS" "reference" "tracker" "gnome-46"];
            }
          ];
        }
      ];
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        darkreader
        onepassword-password-manager
        react-devtools
        refined-github
        simple-tab-groups
        ublock-origin
      ];

      settings = {
        "browser.aboutConfig.showWarning" = false;
        "browser.engagement.home-button.has-used" = true;
        "browser.tabs.loadInBackground" = true;
        "browser.toolbars.bookmarks.visibility" = "always";
        "browser.startup.homepage" = "www.google.com";
        "browser.startup.page" = 3;
        "devtools.chrome.enabled" = true;
        "devtools.debugger.remote-enabled" = true;
        "devtools.toolbox.host" = "right";
        "gfx.canvas.accelerated" = true;
        "gfx.webrender.enabled" = true;
        "gfx.x11-egl.force-enabled" = true;
        "layers.acceleration.force-enabled" = true;
        "media.av1.enabled" = false;
        "media.eme.enabled" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "media.hardware-video-decoding.force-enabled" = true;
        "media.rdd-ffmpeg.enabled" = true;
        "widget.dmabuf.force-enabled" = true;
        "widget.gtk.rounded-bottom-corners.enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "gnomeTheme.hideSingleTab" = true;
        "gnomeTheme.bookmarksToolbarUnderTabs" = true;
        "gnomeTheme.normalWidthTabs" = false;
        "gnomeTheme.tabsAsHeaderbar" = false;

        # Telemetry
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.ping-centre.telemetry" = false;
        "datareporting.healthreport.service.enabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.sessions.current.clean" = true;
        "devtools.onboarding.telemetry.logged" = false;
        "privacy.donottrackheader.enabled" = true;
        "privacy.globalprivacycontrol.enabled" = true;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.hybridContent.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.prompted" = 2;
        "toolkit.telemetry.rejected" = true;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "toolkit.telemetry.server" = "";
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.unifiedIsOptIn" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
      };

      # userChrome = ''
      #   @import "${firefox-whitesur-theme}/share/firefox-whitesur-theme/src/other/firefox/userChrome-Monterey-alt.css";
      # '';

      # userContent = ''
      #   @import "${firefox-whitesur-theme}/share/firefox-whitesur-theme/src/other/firefox/userContent-Monterey.css";
      # '';

      # This does not exist. Use the one from firefox-gnome-theme.
      # extraConfig = builtins.readFile "${firefox-whitesur-theme}/share/firefox-whitesur-theme/src/other/firefox/configuration/user.js";

      userChrome = ''
        @import "${firefox-gnome-theme}/share/firefox-gnome-theme/userChrome.css";
      '';

      userContent = ''
        @import "${firefox-gnome-theme}/share/firefox-gnome-theme/userContent.css";
      '';

      extraConfig = builtins.readFile "${firefox-gnome-theme}/share/firefox-gnome-theme/configuration/user.js";
    };
  };
}
