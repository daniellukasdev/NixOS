{lib, ...}: {
  location.provider = "geoclue2";
  services.geoclue2.enable = true;

  time = {
    timeZone = lib.mkDefault "America/New_York";
    hardwareClockInLocalTime = lib.mkDefault true;
  };
}
