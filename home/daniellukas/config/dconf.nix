{lib, ...}: let
  gnomeUrl = "org/gnome/";
  desktopUrl = "${gnomeUrl}desktop/";
  gtkUrl = "org/gtk/";
  gtk4Url = "${gtkUrl}gtk4/";
  nautilusUrl = "${gnomeUrl}nautilus/";
in {
  # To get these settings so that you can add them to your configuration after manually configuring them
  # `dconf dump /${gnomeUrl}`
  # Another way to do this is to do `dconf watch /org/gnome` and then make the changes you want and then migrate them in as you see what they are.

  dconf.settings = with lib.gvariant; {
    "ca/desrt/dconf-editor/show-warning".show-warning = false;

    "${desktopUrl}interface" = {
      document-font-name = "Poppins 12";
      color-scheme = "prefer-dark";
      monospace-font-name = "Maple Mono NF 12";
    };
    "${desktopUrl}wm/preferences" = {
      button-layout = ":appmenu";
    };

    "${gtkUrl}settings/file-chooser" = {
      clock-format = "12h";
      sidebar-width = mkInt32 192;
      sort-directories-first = true;
      show-hidden = true;
    };

    "${gtk4Url}settings/file-chooser" = {
      sort-directories-first = true;
      show-hidden = true;
      view-type = "list";
    };

    "${nautilusUrl}icon-view" = {
      use-tree-view = true;
      default-zoom-level = "medium";
    };
    "${nautilusUrl}list-view" = {
      use-tree-view = true;
      default-zoom-level = "medium";
    };
    "${nautilusUrl}preferences" = {
      default-folder-viewer = "icon-view";
      show-create-link = true;
      show-delete-permanently = true;
    };
    "${nautilusUrl}window-state".initial-size = mkTuple [(mkInt32 890) (mkInt32 550)];
  };
}
