{pkgs, ...}: {
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
              name = "Hyprland";
              url = "https://hyprland.org/";
              tags = ["Hyprland" "reference"];
            }
            {
              name = "NixOS-Hyprland Config Repo";
              url = "https://github.com/maotseantonio/NixOS-Hyprland";
              tags = ["NixOS" "reference"];
            }
            {
              name = "Raexera/Yuki NixOS Config Repo";
              url = "https://github.com/raexera/yuki";
              tags = ["NixOS" "reference"];
            }
          ];
        }
      ];

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
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
        "browser.tabs.inTitlebar" = 0;
        "browser.uiCustomization.state" = {
          "placements" = {
            "widget-overflow-fixed-list" = [];
            "unified-extensions-area" = [
              "_a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad_-browser-action"
              "_d634138d-c276-4fc8-924b-40a0ea21d284_-browser-action"
              "_react-devtools-browser-action"
              "addon_darkreader_org-browser-action"
              "simple-tab-groups_drive4ik-browser-action"
            ];
            "nav-bar" = [
              "back-button"
              "forward-button"
              "stop-reload-button"
              "home-button"
              "customizableui-special-spring1"
              "urlbar-container"
              "customizableui-special-spring2"
              "save-to-pocket-button"
              "downloads-button"
              "fxa-toolbar-menu-button"
              "unified-extensions-button"
              "ublock0_raymondhill_net-browser-action"
            ];
            "toolbar-menubar" = ["menubar-items"];
            "TabsToolbar" = [
              "firefox-view-button"
              "tabbrowser-tabs"
              "new-tab-button"
              "alltabs-button"
            ];
            "PersonalToolbar" = ["personal-bookmarks"];
          };
          "seen" = [
            "save-to-pocket-button"
            "developer-button"
            "_a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad_-browser-action"
            "_d634138d-c276-4fc8-924b-40a0ea21d284_-browser-action"
            "_react-devtools-browser-action"
            "addon_darkreader_org-browser-action"
            "simple-tab-groups_drive4ik-browser-action"
            "ublock0_raymondhill_net-browser-action"
          ];
          "dirtyAreaCache" = [
            "nav-bar"
            "unified-extensions-area"
          ];
          "currentVersion" = 20;
          "newElementCount" = 6;
        };

        "browser.urlbar.trimHttps" = true;
        "browser.urlbar.trimURLs" = true;
        "devtools.chrome.enabled" = true;
        "devtools.debugger.remote-enabled" = true;
        "devtools.toolbox.host" = "right";
        "gfx.canvas.accelerated" = true;
        # "gfx.webrender.all" = true;
        "gfx.webrender.enabled" = true;
        "gfx.x11-egl.force-enabled" = true;
        "gnomeTheme.hideSingleTab" = true;
        # "gnomeTheme.bookmarksToolbarUnderTabs" = true;
        # "gnomeTheme.normalWidthTabs" = false;
        # "gnomeTheme.tabsAsHeaderbar" = false;
        "layers.acceleration.force-enabled" = true;
        "media.av1.enabled" = false;
        "media.eme.enabled" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "media.hardware-video-decoding.force-enabled" = true;
        "media.rdd-ffmpeg.enabled" = true;
        "sidebar.revamp" = true;
        "sidebar.verticalTabs" = true;
        "svg.context-properties.content.enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "widget.dmabuf.force-enabled" = true;
        "widget.gtk.rounded-bottom-corners.enabled" = true;

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
    };
  };
}
