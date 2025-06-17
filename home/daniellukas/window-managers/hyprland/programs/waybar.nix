{
  config,
  pkgs,
  ...
}: let
  inherit (config.theme.colorscheme) rgbaColors rgbaAltColors xcolors;
  inherit
    (config.theme.style.variables)
    baseColorHexAlpha
    borderSolidDarkAlpha
    borderSolidLightAlpha
    inherentColorHex
    inherentColorHexAlpha
    inactiveColorHexAlpha
    overlayBaseColorHexAlpha
    BorderSolidOverlayDark
    borderSolidOverlayLightAlpha
    ;
in {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "graphical-session.target";
    };
    settings = [
      {
        layer = "top";
        position = "top";
        exclusive = true;
        fixed-center = true;
        gtk-layer-shell = true;
        spacing = 0;
        margin-top = 6;
        margin-bottom = 0;
        margin-left = 6;
        margin-right = 6;
        modules-left = [
          "image"
          "hyprland/window"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "idle_inhibitor"
          "group/battery-modules"
          "group/wireplumber-modules"
          "group/backlight-modules"
          "group/network-modules"
          "bluetooth"
          # "tray"
          "clock"
          "group/powermenu"
        ];

        "image" = {
          path = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake-white.svg";
          size = 24;
          tooltip = false;
        };

        "hyprland/window" = {
          format = "{class}";
          icon = false;
          icon-size = 24;
          separate-outputs = true;
        };

        "hyprland/workspaces" = {
          format = "{id}";
        };

        idle_inhibitor = {
          # format = "󰮭";
          # format = "";
          # format = "󰟡";
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        "bluetooth" = {
          # format = " {status}";
          format = "";
          format-connected = "󰂱 {device_alias}";
          format-connected-battery = "󰂱 {device_alias} (󰥉 {device_battery_percentage}%)";
          format-disabled = "󰂲";
          #  format-device-preference = [ "device1"; "device2" ];
          #  preference list deciding the displayed device
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
        };

        "group/network-modules" = {
          modules = [
            "network#icon"
            "network#address"
          ];
          orientation = "inherit";
        };
        "network#icon" = {
          format-disconnected = "󰤮";
          format-ethernet = "󰈀";
          format-wifi = "{icon}";
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
          tooltip-format-wifi = "WiFi: {essid} ({signalStrength}%)\n󰅃 {bandwidthUpBytes} 󰅀 {bandwidthDownBytes}";
          tooltip-format-ethernet = "Ethernet: {ifname}\n󰅃 {bandwidthUpBytes} 󰅀 {bandwidthDownBytes}";
          tooltip-format-disconnected = "Disconnected";
          on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
        };
        "network#address" = {
          format-disconnected = "Disconnected";
          format-ethernet = "{ipaddr}/{cidr}";
          format-wifi = "{essid}";
          tooltip-format-wifi = "WiFi: {essid} ({signalStrength}%)\n󰅃 {bandwidthUpBytes} 󰅀 {bandwidthDownBytes}";
          tooltip-format-ethernet = "Ethernet: {ifname}\n󰅃 {bandwidthUpBytes} 󰅀 {bandwidthDownBytes}";
          tooltip-format-disconnected = "Disconnected";
        };

        "group/wireplumber-modules" = {
          modules = [
            "wireplumber#icon"
            "wireplumber#volume"
          ];
          orientation = "inherit";
        };
        "wireplumber#icon" = {
          format = "{icon}";
          format-muted = "󰖁";
          format-icons = [
            "󰕿"
            "󰖀"
            "󰕾"
          ];
          on-click = "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle &> /dev/null";
          on-scroll-up = "${pkgs.wireplumber}/bin/wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 1%+ &> /dev/null";
          on-scroll-down = "${pkgs.wireplumber}/bin/wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 1%- &> /dev/null";
          tooltip-format = "Volume: {volume}%";
        };
        "wireplumber#volume" = {
          format = "{volume}%";
          tooltip-format = "Volume: {volume}%";
        };

        "group/backlight-modules" = {
          modules = [
            "backlight#icon"
            "backlight#percent"
          ];
          orientation = "inherit";
        };
        "backlight#icon" = {
          format = "{icon}";
          format-icons = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
          on-scroll-up = "${pkgs.brightnessctl}/bin/brightnessctl set 1%+ &> /dev/null";
          on-scroll-down = "${pkgs.brightnessctl}/bin/brightnessctl set 1%- &> /dev/null";
          tooltip-format = "Backlight: {percent}%";
        };
        "backlight#percent" = {
          format = "{percent}%";
          tooltip-format = "Backlight: {percent}%";
        };

        "group/battery-modules" = {
          modules = [
            "battery#icon"
            "battery#capacity"
          ];
          orientation = "inherit";
        };
        "battery#icon" = {
          format = "{icon}";
          format-charging = "󱐋";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          format-plugged = "󰚥";
          states = {
            warning = 30;
            critical = 15;
          };
          tooltip-format = "{timeTo}, {capacity}%";
        };
        "battery#capacity" = {
          format = "{capacity}%";
          tooltip-format = "{timeTo}, {capacity}%";
        };

        # tray = {
        #   icon-size = 24;
        #   spacing = 10;
        #   show-passive-items = false;
        # };

        clock = {
          actions = {
            on-scroll-down = "shift_down";
            on-scroll-up = "shift_up";
          };
          calendar = {
            format = {
              days = "<span color='${xcolors.gray1}'><b>{}</b></span>";
              months = "<span color='${inherentColorHex}'><b>{}</b></span>";
              today = "<span color='${inherentColorHex}'><b><u>{}</u></b></span>";
              weekdays = "<span color='${xcolors.blue}'><b>{}</b></span>";
            };
            mode = "month";
            on-scroll = 1;
          };
          format = "{:%a %b %d   %I:%M %p}";
          tooltip-format = "{calendar}";
        };

        "group/powermenu" = {
          drawer = {
            children-class = "powermenu-child";
            transition-duration = 300;
            transition-left-to-right = false;
          };
          modules = [
            "custom/power"
            "custom/lock"
            "custom/suspend"
            "custom/exit"
            "custom/reboot"
          ];
          orientation = "inherit";
        };
        "custom/power" = {
          format = "󰐥";
          on-click = "${pkgs.systemd}/bin/systemctl poweroff";
          tooltip = false;
        };
        "custom/lock" = {
          format = "󰌾";
          on-click = "${pkgs.systemd}/bin/loginctl lock-session";
          tooltip = false;
        };
        "custom/suspend" = {
          format = "󰤄";
          on-click = "${pkgs.systemd}/bin/systemctl suspend";
          tooltip = false;
        };
        "custom/exit" = {
          format = "󰍃";
          on-click = "${pkgs.systemd}/bin/loginctl terminate-user $USER";
          tooltip = false;
        };
        "custom/reboot" = {
          format = "󰜉";
          on-click = "${pkgs.systemd}/bin/systemctl reboot";
          tooltip = false;
        };
      }
    ];

    style = ''
      /* Global */
      * {
        all: unset;
        font-family: "Poppins", sans-serif;
        font-size: 13pt;
        font-weight: 600;
      }

      /* Waybar */

      window#waybar {
        background: ${baseColorHexAlpha};
        border: ${borderSolidDarkAlpha};
        border-radius: 10px;
        box-shadow: ${borderSolidLightAlpha};
      }

      /* window#waybar {
      } */

      /* Menu */

      menu {
        background: ${baseColorHexAlpha};
        border-radius: 12px;
      }

      menu separator {
        background: ${baseColorHexAlpha};
      }

      menu menuitem {
        background: transparent;
        padding: 0.5rem;
        transition: 300ms linear;
      }

      menu menuitem:hover {
        background: lighter(${rgbaColors.red});
      }

      menu menuitem:first-child {
        border-radius: 12px 12px 0 0;
      }

      menu menuitem:last-child {
        border-radius: 0 0 12px 12px;
      }

      menu menuitem:only-child {
        border-radius: 12px;
      }

      /* Tooltip */

      tooltip {
        background: ${overlayBaseColorHexAlpha};
        border: ${BorderSolidOverlayDark};
        border-radius: 12px;
        box-shadow: ${borderSolidOverlayLightAlpha};
      }

      tooltip label {
        margin: 0.5rem;
      }

      .modules-left {
        padding-left: 0.25rem;
        padding-right: 0.5rem;
      }

      .modules-center {
        padding-left: 1rem;
        padding-right: 1rem;
        border-radius: 2.48rem;
      }

      .modules-right {
        padding-left: 0.5rem;
        padding-right: 0.25rem;
      }

      /* Modules */

      #workspaces,
      #workspaces button,
      #bluetooth,
      #idle_inhibitor,
      #network-modules,
      #wireplumber-modules,
      #backlight-modules,
      #battery-modules,
      #tray,
      #clock,
      #powermenu,
      #custom-exit,
      #custom-lock,
      #custom-suspend,
      #custom-reboot,
      #custom-power {
        border-radius: 8px;
        transition: all 300ms;
      }

      #window,
      #workspaces,
      #workspaces button,
      #bluetooth,
      #idle_inhibitor,
      #network-modules,
      #wireplumber-modules,
      #backlight-modules,
      #battery-modules,
      #tray,
      #clock,
      #powermenu {
        margin: 0.36rem 0.24rem;
      }

      #image,
      #network.address,
      #wireplumber.volume,
      #backlight.percent,
      #battery.capacity,
      #tray,
      #clock {
        padding: 0.24rem 0.72rem;
      }

      #bluetooth,
      #idle_inhibitor,
      #network.icon,
      #wireplumber.icon,
      #backlight.icon,
      #battery.icon,
      #custom-exit,
      #custom-lock,
      #custom-suspend,
      #custom-reboot,
      #custom-power {
        padding: 0.12rem 0.24rem;
        min-width: 1.5rem;
        font-size: 16pt;
        color: ${inherentColorHex};
        border-radius: 8px;
        transition: all 300ms;
      }

      #custom-exit,
      #custom-lock,
      #custom-suspend,
      #custom-reboot {
        color: ${inherentColorHexAlpha};
        background: transparent;
      }

      /* Window */

      #window {
        padding: 0.24rem 0.84rem;
        color: ${inherentColorHex};
        border-radius: 0.24rem;
      }

      /* make window module transparent when no windows present */
      window#waybar.empty #window {
          background-color: transparent;
      }

      /* Workspaces */

      #workspaces {
        background: alpha(${inherentColorHex}, 0);
        border: 1px solid ${inherentColorHexAlpha};
        border-radius: 1rem;
        transition: background 300ms;
      }

      #workspaces button {
        margin: 0;
        padding: 0.12rem 0.24rem;
        min-width: 1.5rem;
        background: transparent;
        transition: border-radius 0ms, background 300ms;
      }

      .modules-center #workspaces button {
        border-radius: 0;
      }

      .modules-center #workspaces button:first-child {
        padding-left: 0.48rem;
        border-top-left-radius: 1rem;
        border-bottom-left-radius: 1rem;
      }

      .modules-center #workspaces button:last-child {
        padding-right: 0.48rem;
        border-top-right-radius: 1rem;
        border-bottom-right-radius: 1rem;
      }

      #workspaces button label {
        font-weight: 800;
        color: ${inactiveColorHexAlpha};
        transition: color 300ms;
      }

      #workspaces button.active label {
        color: ${inherentColorHex};
      }

      /* #workspaces button.empty label {
        color: ${rgbaAltColors.white};
      } */

      #workspaces button.urgent label {
        color: ${inherentColorHex};
      }

      #workspaces button.urgent,
      #workspaces button.urgent:hover {
        color: lighter(${rgbaAltColors.yellow});
        background: ${rgbaAltColors.red};
      }

      #workspaces button.active {
        /* background: lighter(${rgbaAltColors.gray1}); */
        background: ${inherentColorHexAlpha};
      }

      /* Idle Inhibitor */

      #idle_inhibitor {
        color: ${inherentColorHex};
      }

      #idle_inhibitor.deactivated {
        color: ${inactiveColorHexAlpha};
      }

      /* Bluetooth */

      /*
      #bluetooth
      #bluetooth.disabled
      #bluetooth.off
      #bluetooth.on
      #bluetooth.connected
      #bluetooth.discoverable
      #bluetooth.discovering
      #bluetooth.pairable
      #bluetooth.no-controller
      */

      #bluetooth.on,
      #bluetooth.connected {
        color: ${inherentColorHex};
      }

      #bluetooth.on,
      #bluetooth.connected {
        color: ${rgbaAltColors.white};
      }

      /* Systray */

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background: ${xcolors.red};
      }

      #powermenu {
        background: transparent;
      }

      /* Hover effects */

      #workspaces button:hover {
        background: ${inherentColorHexAlpha};
      }

      #network.icon:hover,
      #wireplumber.icon:hover,
      #custom-exit:hover,
      #custom-lock:hover,
      #custom-suspend:hover,
      #custom-reboot:hover,
      #custom-power:hover {
        color: ${inherentColorHex};

      }

      #network.icon:hover label,
      #wireplumber.icon:hover label,
      #custom-exit:hover label,
      #custom-lock:hover label,
      #custom-suspend:hover label,
      #custom-reboot:hover label,
      #custom-power:hover label {
        color: ${inherentColorHex};
      }

      #workspaces button:hover label,
      #workspaces button.active:hover label,
      #workspaces button.empty:hover label,
      #workspaces button.urgent:hover label {
        color: ${inherentColorHex};
      }

      #idle_inhibitor:hover,
      #idle_inhibitor.deactivated:hover {
        color: ${inherentColorHex};
      }

      #powermenu:hover {
        background: ${inherentColorHexAlpha};
      }
    '';
  };
}
