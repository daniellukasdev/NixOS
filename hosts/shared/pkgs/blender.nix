{pkgs, ...}:
with pkgs; [
  cudatoolkit
  gcc
  (blender.override {
    cudaSupport = true;
  })
]