{lib, ...}: {
  boot = {
    initrd = {
      availableKernelModules = ["nvme" "sd_mod" "thunderbolt" "usb_storage" "xhci_pci"];
      kernelModules = [];
    };
    kernelModules = ["kvm-intel"];
    kernelParams = ["nowatchdog"];
  };

  hardware.enableRedistributableFirmware = lib.mkDefault true;

  # √(3840² + 1920²) px / 17 in ≃ 252 dpi
  services.xserver.dpi = 252;
}
