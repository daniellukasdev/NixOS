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
    borderSolidOverlayDark
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
          "group/powermenu"
          "hyprland/window"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "idle_inhibitor"
          "group/cpu-modules"
          "group/memory-modules"
          "group/battery-modules"
          "wireplumber#icon"
          "backlight#icon"
          # "group/wireplumber-modules"
          # "group/backlight-modules"
          "network#icon"
          # "group/network-modules"
          # "bluetooth"
          # "tray"
          "group/control-panel"
          "clock"
          # "group/powermenu"
        ];

        "group/powermenu" = {
          drawer = {
            children-class = "powermenu-child";
            click-to-reveal = true;
            transition-duration = 300;
            transition-left-to-right = true;
          };
          modules = [
            "custom/icon"
            "custom/power"
            "custom/lock"
            "custom/suspend"
            "custom/exit"
            "custom/reboot"
          ];
          orientation = "inherit";
        };
        "custom/icon" = {
          format = "";
          # size = 24;
          tooltip = false;
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

        # 󰀶
        # 󰨞 
        # 󰢁
        # 
        # 󰾡
        # 󰂫
        # 
        # 󰈹 
        #  
        # 󱇣
        # 
        # 
        # 
        #  󰈷
        #  ,  memory
        #  cpu

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
          # format = "";
          # format = "󰟡";
          format = "{icon}";
          format-icons = {
            activated = " ";
            deactivated = " ";
          };
        };

        "group/cpu-modules" = {
          modules = [
            "cpu#icon"
            "cpu#usage"
          ];
          orientation = "inherit";
        };

        "cpu#icon" = {
          format = "";
          tooltip-format = "{iconN}{usageN}";
        };

        "cpu#usage" = {
          format = "{usage}%";
          interval = 5;
          tooltip-format = "{iconN}{usageN}";
          max-length = 10;
        };

        "group/memory-modules" = {
          modules = [
            "memory#icon"
            "memory#percent"
          ];
          orientation = "inherit";
        };

        "memory#icon" = {
          format = "";
          tooltip-format = "{used}GB used of {total}GB";
        };

        "memory#percent" = {
          format = "{percentage}%";
          interval = 10;
          tooltip-format = "{used}GB used of {total}GB";
          max-length = 10;
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

        "group/control-panel" = {
          drawer = {
            children-class = "control-panel-child";
            click-to-reveal = true;
            transition-duration = 300;
            transition-left-to-right = false;
          };
          modules = [
            "group/switch-modules"
            "group/backlight-modules"
            "group/wireplumber-modules"
            "group/network-modules"
            "bluetooth"
          ];
          orientation = "inherit";
        };

        "group/switch-modules" = {
          modules = [
            "custom/switch-off"
            "custom/switch-on"
          ];
          orientation = "vertical";
        };

        "custom/switch-off" = {
          format = "󰨙";
          tooltip = false;
        };

        "custom/switch-on" = {
          format = "󰔡";
          tooltip = false;
        };

        "bluetooth" = {
          # format = " {status}";
          format = "";
          # format-connected = "󰂱 {device_alias}";
          format-connected = "󰂱 {device_alias}";
          format-connected-battery = "󰂱 {device_alias} (󰥉 {device_battery_percent}%)";
          format-disabled = "󰂲";
          #  format-device-preference = [ "device1"; "device2" ];
          "on-click" = "blueman-manager";
          "on-click-right" = "rfkill toggle bluetooth";
          #  preference list deciding the displayed device
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percent}%";
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

        clock = {
          actions = {
            on-scroll-down = "shift_down";
            on-scroll-up = "shift_up";
          };
          calendar = {
            format = {
              days = "<span color='${xcolors.icDark.gray2}'><b>{}</b></span>";
              months = "<span color='${inherentColorHex}'><b>{}</b></span>";
              today = "<span color='${inherentColorHex}'><b><u>{}</u></b></span>";
              weekdays = "<span color='${xcolors.icDark.blue}'><b>{}</b></span>";
            };
            mode = "month";
            on-scroll = 1;
          };
          format = "{:%a %b %d   %I:%M %p}";
          tooltip-format = "{calendar}";
        };
      }
    ];

    style =
      ''
        /*******************  Needs Nix Variables  *******************/

        /*******************  Window  *******************/

        #window {
          color: ${inherentColorHex};
        }

        /*******************  Waybar  *******************/

        window#waybar {
          background: ${baseColorHexAlpha};
          border: ${borderSolidDarkAlpha};
          box-shadow: ${borderSolidLightAlpha};
        }

        /*******************  Menu  *******************/

        menu {
          background: ${baseColorHexAlpha};
        }

        menu separator {
          background: ${baseColorHexAlpha};
        }

        menu menuitem:hover {
          background: lighter(${rgbaColors.icDark.red});
        }

        /*******************  Tooltip  *******************/

        tooltip {
          background: ${overlayBaseColorHexAlpha};
          border: ${borderSolidOverlayDark};
          box-shadow: ${borderSolidOverlayLightAlpha};
        }

        /****************************  Modules  ****************************/

        #custom-switch-off,
        #custom-switch-on,
        #bluetooth,
        #idle_inhibitor,
        #network.icon,
        #wireplumber.icon,
        #backlight.icon,
        #battery.icon,
        #cpu.icon,
        #memory.icon,
        #custom-icon,
        #custom-exit,
        #custom-lock,
        #custom-suspend,
        #custom-reboot,
        #custom-power {
          color: ${inherentColorHex};
        }

        #custom-exit,
        #custom-lock,
        #custom-suspend,
        #custom-reboot,
        #custom-power {
          color: ${inherentColorHexAlpha};
        }

        /*******************  Workspaces  *******************/

        #workspaces {
          background: alpha(${inherentColorHex}, 0);
          border: 1px solid ${inherentColorHexAlpha};
        }

        #workspaces button label {
          color: ${inactiveColorHexAlpha};
        }

        #workspaces button.active label {
          color: ${inherentColorHex};
        }

        #workspaces button.urgent label {
          color: ${inherentColorHex};
        }

        #workspaces button.urgent,
        #workspaces button.urgent:hover {
          color: lighter(${rgbaAltColors.icDark.yellow});
          background: ${rgbaAltColors.icDark.red};
        }

        #workspaces button.active {
          background: ${inherentColorHexAlpha};
        }

        /*******************  Idle Inhibitor   *******************/

        #idle_inhibitor {
          color: ${inherentColorHex};
        }

        #idle_inhibitor.deactivated {
          color: ${inactiveColorHexAlpha};
        }

        /*******************  Bluetooth  *******************/

        #bluetooth.on,
        #bluetooth.connected {
          color: ${inherentColorHex};
        }

        #bluetooth.on,
        #bluetooth.connected {
          color: ${rgbaAltColors.icDark.white};
        }

        /*******************  Systray  *******************/

        #tray > .needs-attention {
          background: ${xcolors.icDark.red};
        }

        /*******************  Hover effects  *******************/

        #workspaces button:hover,
        #powermenu:hover,
        #control-panel:hover {
          background: ${inherentColorHexAlpha};
        }

        #custom-exit:hover,
        #custom-exit:hover label,
        #custom-lock:hover,
        #custom-lock:hover label,
        #custom-suspend:hover,
        #custom-suspend:hover label,
        #custom-reboot:hover,
        #custom-reboot:hover label,
        #custom-power:hover,
        #custom-power:hover label,
        #cpu.icon:hover,
        #cpu.icon:hover label,
        #memory.icon:hover,
        #memory.icon:hover label,
        #network.icon:hover,
        #network.icon:hover label,
        #wireplumber.icon:hover,
        #wireplumber.icon:hover label,
        #workspaces button:hover label,
        #workspaces button.active:hover label,
        #workspaces button.empty:hover label,
        #workspaces button.urgent:hover label {
          color: ${inherentColorHex};

        }

        #powermenu:hover,
        #control-panel:hover {
          background: ${inherentColorHexAlpha};
        }


      ''
      + "${builtins.readFile ./style.css}";
  };
}
