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
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        darkreader
        # octotree
        refined-github
        ublock-origin
      ];

      settings = {
        "browser.engagement.home-button.has-used" = true;
        "browser.tabs.loadInBackground" = true;
        "browser.toolbars.bookmarks.visibility" = "always";
        "browser.startup.homepage" = "www.google.com";
        "devtools.chrome.enabled" = true;
        "devtools.debugger.remote-enabled" = true;
        "devtools.toolbox.host" = "right";
        "gfx.canvas.accelerated" = true;
        "gfx.webrender.enabled" = true;
        "gfx.x11-egl.force-enabled" = true;
        "layers.acceleration.force-enabled" = true;
        "media.av1.enabled" = false;
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
