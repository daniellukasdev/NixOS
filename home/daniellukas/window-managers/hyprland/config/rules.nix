{config, ...}: {
  wayland.windowManager.hyprland.settings = let
    inherit (config.theme.style.variables) baseOpacityRule dockOpacity;
  in {
    layerrule = [
      "blur, (waybar)"
      "ignorezero, (waybar)"
      "ignorealpha ${baseOpacityRule}, (waybar)"
      "blur, (nwg-dock)"
      "ignorezero, (nwg-dock)"
      "ignorealpha ${dockOpacity}, (nwg-dock)"
      # "blur, (gtk-layer-shell)"
      # "ignorezero, (gtk-layer-shell)"
      # "ignorealpha[1], (gtk-layer-shell)"
      "blur, (anyrun)"
      "ignorezero, (anyrun)"
      "blurpopups, (waybar)"
    ];
    windowrulev2 = [
      "dimaround, class:^(gcr-prompter)$"
      "dimaround, class:^(polkit-gnome-authentication-agent-1)$"
      "dimaround, class:^(xdg-desktop-portal-gtk)$"

      "float, class:^(blueman-manager)$"
      "float, class:^(com.saivert.pwvucontrol)$"
      "float, class:^(io.bassi.Amberol)$"
      "float, class:^(io.github.celluloid_player.Celluloid)$"
      "float, class:^(mpv)$"
      "float, class:^(nm-applet)$"
      "float, class:^(nm-connection-editor)$"
      "float, class:^(org.gnome.Calculator)$"
      "float, class:^(org.gnome.Loupe)$"
      "float, class:^(xdg-desktop-portal-gtk)$"

      "float, title:^(File Upload)(.*)$"
      "float, title:^(Library)(.*)$"
      "float, title:^(Open File)(.*)$"
      "float, title:^(Open Folder)(.*)$"
      "float, title:^(Save As)(.*)$"
      "float, title:^(Select a File)(.*)$"

      "float, title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"
      "pin, title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"

      "idleinhibit fullscreen, class:^(.*)$"
      "idleinhibit fullscreen, title:^(.*)$"
      "idleinhibit fullscreen, fullscreen:1"

      # "opacity 0.96 0.92, class:(codium)$"
      # "opacity 0.96 0.92, class:^(thunar)$"

      "suppressevent maximize, class:.*"

      # "bordersize 0, floating:0, onworkspace:w[tv1]"
      # "rounding 0, floating:0, onworkspace:w[tv1]"
      # "bordersize 0, floating:0, onworkspace:f[1]"
      # "rounding 0, floating:0, onworkspace:f[1]"
    ];

    workspace = [
      # "w[tv1], gapsout:0, gapsin:0"
      # "f[1], gapsout:0, gapsin:0"
    ];
  };
}
