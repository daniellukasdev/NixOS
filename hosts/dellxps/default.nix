{pkgs, ...}: {
  imports = [./hardware-configuration.nix];

  boot = {
    blacklistedKernelModules = ["snd_hda_intel" "snd_soc_skl"];

    consoleLogLevel = 3;

    # extraModprobeConfig = "";

    initrd = {
      systemd.enable = true;
      supportedFilesystems = ["ext4"];
    };

    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];

    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 5;
        gfxmodeEfi = "1920x1080";
      };
    };

    plymouth.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      acpi
      alsa-utils
      ffmpeg-full
      fprintd
      fprintd-tod
      libfprint
      libfprint-2-tod1-goodix
      libva
      libva-utils
      mesa
      pciutils
      v4l-utils
      vulkan-tools
      vulkan-loader
      vulkan-validation-layers
      vulkan-extension-layer
    ];

    sessionVariables = {
      __GL_GSYNC_ALLOWED = "1";
      __GL_VRR_ALLOWED = "1";
      WLR_DRM_DEVICES = "/dev/dri/card0:/dev/dri/card1";
    };
  };

  hardware = {
    # Enable all firmware regardless of license.
    enableAllFirmware = true;

    # Enable firmware with a license allowing redistribution.
    enableRedistributableFirmware = true;

    # update the CPU microcode for Intel processors.
    cpu.intel.updateMicrocode = true;

    # configure the bus IDs of the graphics cards.
    nvidia.prime = {
      nvidiaBusId = "PCI:1:0:0";
      intelBusId = "PCI:0:2:0";
    };

    # Enable OpenGL drivers
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  # Set the networking host name.
  networking.hostName = "dellxps";

  services = {
    # Enable the ACPI daemon.
    acpid.enable = true;

    # Enable the auto-cpufreq daemon.
    auto-cpufreq.enable = true;

    # Enable fingerprint reader
    fprintd = {
      enable = true;
      package = pkgs.fprintd-tod;
      tod = {
        enable = true;
        driver = pkgs.libfprint-2-tod1-goodix;
      };
    };

    # Enable periodic SSD TRIM of mounted partitions in background
    fstrim.enable = true;

    # Enable security levels for Thunderbolt 3 on GNU/Linux.
    hardware.bolt.enable = true;

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable the Profile Sync daemon.
    psd = {
      enable = true;
      resyncTimer = "10m";
    };

    # Enable power-profiles-daemon, a DBus daemon that allows changing system behavior based upon user-selected power profiles.
    power-profiles-daemon.enable = true;

    # Enable thermald, the temperature management daemon.
    thermald.enable = true;

    # Enable Upower, a DBus service that provides power management support to applications.
    upower = {
      enable = true;
      percentageLow = 30;
      percentageCritical = 20;
      percentageAction = 10;
      criticalPowerAction = "Hibernate";
    };
  };

  # Enable in-memory compressed devices and swap space provided by the zram kernel module.
  zramSwap.enable = true;
}
