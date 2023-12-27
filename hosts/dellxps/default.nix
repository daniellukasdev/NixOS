# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # Shared configuration across all machines
    ../shared

    # Gnome configuration
    ../shared/gnome

    # Select the user configuration
    ../shared/users/danlukasdev.nix

    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot = {
    initrd = {
      # supportedFilesystems = ["btrfs"];
      systemd.enable = true;
    };

    loader = {
      efi = {
        canTouchEfiVariables = true;
        # efiSysMountPoint = "/boot";
      };

      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        enableCryptodisk = true;
        configurationLimit = 3;
        gfxmodeEfi = "1920x1080";
        theme = pkgs.fetchzip {
          # https://github.com/AdisonCavani/distro-grub-themes
          url = "https://raw.githubusercontent.com/AdisonCavani/distro-grub-themes/master/themes/dell.tar";
          hash = "sha256-7ueP29xXYAhlD6nZQLJl3QSkEO1UUE5h+XfNya8Dx30=";
          stripRoot = false;
        };
      };
    };
  };

  environment = {
    # variables = {
    #   GDK_SCALE = "2";
    #   GDK_DPI_SCALE = "0.5";
    #   QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    # };

    systemPackages = with pkgs; [
      cryptsetup
      fprintd
      fprintd-tod
      # gnome.dconf-editor
      # gnome.gnome-tweaks
      libfprint
      libfprint-2-tod1-goodix
      libva
      libva-utils
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
    ];
    # ++ (with pkgs.gnomeExtensions; [
    #   advanced-alttab-window-switcher
    #   blur-my-shell
    #   control-blur-effect-on-lock-screen
    #   dash2dock-lite
    #   # dash-to-dock
    #   # dash-to-dock-animator
    #   gtk4-desktop-icons-ng-ding
    #   extension-list
    #   forge
    #   just-perfection
    #   search-light
    #   user-themes
    # ]);
  };

  hardware = {
    enableRedistributableFirmware = true;
    bluetooth = {
      enable = true;
      package = pkgs.bluez;
    };

    nvidia = {
      modesetting.enable = true;

      powerManagement = {
        enable = false;
        # finegrained = true;
      };

      open = false;

      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;

      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";

        offload = {
          enable = true;
          enableOffloadCmd = true;
        };

        reverseSync.enable = true;
      };
    };

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        # libvdpau-va-gl
        # vaapiIntel
        # vaapiVdpau
        # nvidia-vaapi-driver
      ];
    };
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking = {
    hostName = "dellxps";
    networkmanager.enable = true;
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # useDHCP = false;
  };

  # Enable services for host dellxps
  services = {
    # btrfs.autoScrub.enable = true;
    logind.lidSwitch = "suspend";
    thermald.enable = true;
    tlp = {
      enable = true;
      settings = {
        START_CHARGE_THRESH_BAT0 = 0; # dummy value
        STOP_CHARGE_THRESH_BAT0 = 1; # battery conservation mode
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      };
    };

    upower.enable = true;
    power-profiles-daemon.enable = false;

    xserver = {
      dpi = 144;
      libinput = {
        enable = true;
        touchpad = {naturalScrolling = true;};
      };

      xkbOptions = "caps:escape";
      videoDrivers = ["nvidia"];
    };

    # Enable the X11 windowing system.
    # xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    # xserver.displayManager.gdm.enable = true;
    # xserver.desktopManager.gnome.enable = true;

    # Configure keymap in X11
    # xserver = {
    #   layout = "us";
    #   xkbVariant = "";
    # };

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable fingerprint reader
    fprintd = {
      enable = true;
      package = pkgs.fprintd-tod;
      tod = {
        enable = true;
        driver = pkgs.libfprint-2-tod1-goodix;
      };
    };

    # Enable the OpenSSH daemon.
    # openssh.enable = true;
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
