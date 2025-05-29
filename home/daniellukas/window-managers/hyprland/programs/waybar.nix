{
  config,
  pkgs,
  ...
}: let
  inherit (config.theme.colorscheme) rgbaColors rgba48Colors rgbaAltColors xcolors;
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
        margin-top = 0;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
        modules-left = [
          "image"
          # "hyprland/workspaces"
          # "idle_inhibitor"
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

        "hyprland/window" = {
          format = "{class}";
          icon = false;
          icon-size = 24;
          separate-outputs = true;
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
              months = "<span color='${xcolors.white}'><b>{}</b></span>";
              today = "<span color='${xcolors.white}'><b><u>{}</u></b></span>";
              weekdays = "<span color='${xcolors.blue}'><b>{}</b></span>";
            };
            mode = "month";
            on-scroll = 1;
          };
          format = "{:%a %b %d %I:%M %p}";
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
        font-family: "MapleMono-NF", sans-serif;
        font-size: 13pt;
        font-weight: 600;
      }

      /* Menu */

      menu {
        background: ${rgbaColors.black0};
        border-radius: 12px;
      }

      menu separator {
        background: ${rgbaColors.black0};
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
        background: ${xcolors.black3};
        border: 0.08rem solid ${xcolors.gray0};
        border-radius: 12px;
      }

      tooltip label {
        margin: 0.5rem;
      }

      /* Waybar */

      window#waybar {
        background: ${rgba48Colors.black0};
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
        transition: 300ms linear;
      }

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

      #workspaces {
        background: lighter(${rgbaAltColors.gray1});
        border-radius: 1rem;
      }

      #image,
      #window,
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
        color: ${xcolors.white};
        border-radius: 8px;
        transition: 300ms linear;
      }

      #custom-exit,
      #custom-lock,
      #custom-suspend,
      #custom-reboot {
        color: ${rgbaAltColors.white};
        background: transparent;
      }

      /* Workspaces */

      #workspaces button {
        margin: 0;
        padding: 0.12rem 0.24rem;
        min-width: 1.5rem;
        background: transparent;
      }

      .modules-center #workspaces button {
        border-radius: 0;
      }

      .modules-center #workspaces button:first-child {
        border-top-left-radius: 1rem;
        border-bottom-left-radius: 1rem;
      }

      .modules-center #workspaces button:last-child {
        border-top-right-radius: 1rem;
        border-bottom-right-radius: 1rem;
      }

      #workspaces button label {
        font-weight: 800;
        color: ${rgbaAltColors.white};
        transition: 300ms linear;
      }

      #workspaces button.active label {
        color: ${xcolors.white};
      }

      #workspaces button.empty label {
        color: ${rgbaAltColors.white};
      }

      #workspaces button.urgent label {
        color: ${rgbaColors.white};
      }

      #workspaces button.urgent,
      #workspaces button.urgent:hover {
        background: ${rgbaAltColors.red};
      }

      #workspaces button.active {
        background: lighter(${rgbaAltColors.gray1});
      }

      /* Idle Inhibitor */

      #idle_inhibitor {
        color: ${xcolors.white};
      }

      #idle_inhibitor.deactivated {
        color: ${rgbaAltColors.white};
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
        color: ${xcolors.white};
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
        background: lighter(${rgbaAltColors.gray1});
      }

      #network.icon:hover,
      #wireplumber.icon:hover,
      #custom-exit:hover,
      #custom-lock:hover,
      #custom-suspend:hover,
      #custom-reboot:hover,
      #custom-power:hover {
        color: ${xcolors.white};

      }

      #network.icon:hover label,
      #wireplumber.icon:hover label,
      #custom-exit:hover label,
      #custom-lock:hover label,
      #custom-suspend:hover label,
      #custom-reboot:hover label,
      #custom-power:hover label {
        color: ${xcolors.white};
      }

      #workspaces button:hover label,
      #workspaces button.active:hover label,
      #workspaces button.empty:hover label,
      #workspaces button.urgent:hover label {
        color: ${xcolors.white};
      }

      #idle_inhibitor:hover,
      #idle_inhibitor.deactivated:hover {
        color: ${xcolors.white};
      }

      #powermenu:hover {
        background: lighter(${rgbaAltColors.gray1});
      }
    '';
  };
}
