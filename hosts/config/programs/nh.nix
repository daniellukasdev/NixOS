{
  programs.nh = {
    enable = true;
    flake = "/home/daniellukas/.dellxps";
    clean = {
      enable = true;
      extraArgs = "--keep-since 1w";
    };
  };
}
