{pkgs, ...}: {
  home.packages = with pkgs; [
    cudatoolkit
    # gcc
    (blender.override {
      cudaSupport = true;
    })
  ];
}
