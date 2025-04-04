{lib, ...}: {
  time = {
    timeZone = lib.mkDefault "America/New_York";
    hardwareClockInLocalTime = lib.mkDefault true;
  };
}
