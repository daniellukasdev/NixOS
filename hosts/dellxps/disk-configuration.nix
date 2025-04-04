{
  # fileSystems."/" = {
  #   device = "/dev/disk/by-label/NixOS-ROOT";
  #   fsType = "ext4";
  # };

  # fileSystems."/boot" = {
  #   device = "/dev/disk/by-label/NixOS-BOOT";
  #   fsType = "vfat";
  # };

  # swapDevices = [{device = "/dev/disk/by-label/NixOS-SWAP";}];
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = ["-f"];
                subvolumes = {
                  "/root" = {
                    mountpoint = "/";
                    mountOptions = ["compress=zstd" "noatime"];
                  };
                  "/home" = {
                    mountpoint = "/home";
                    mountOptions = ["compress=zstd" "noatime"];
                  };
                  "/nix" = {
                    mountpoint = "/nix";
                    mountOptions = ["compress=zstd" "noatime"];
                  };
                };
              };
            };
            swap = {
              size = "34G";
              content = {
                type = "swap";
                discardPolicy = "both";
                resumeDevice = true;
              };
            };
          };
        };
      };
    };
  };
  # disko.devices = {
  #   disk = {
  #     main = {
  #       type = "disk";
  #       device = "/dev/nvme0n1";
  #       content = {
  #         type = "gpt";
  #         partitions = {
  #           ESP = {
  #             size = "1G";
  #             type = "EF00";
  #             content = {
  #               type = "filesystem";
  #               format = "vfat";
  #               mountpoint = "/boot";
  #               mountOptions = ["umask=0077"];
  #             };
  #           };
  #           root = {
  #             size = "100%";
  #             content = {
  #               type = "btrfs";
  #               extraArgs = ["-f"];
  #               subvolumes = {
  #                 "/root" = {
  #                   mountpoint = "/";
  #                   mountOptions = ["compress=zstd" "noatime"];
  #                 };
  #                 "/home" = {
  #                   mountpoint = "/home";
  #                   mountOptions = ["compress=zstd" "noatime"];
  #                 };
  #                 "/nix" = {
  #                   mountpoint = "/nix";
  #                   mountOptions = ["compress=zstd" "noatime"];
  #                 };
  #               };
  #             };
  #           };
  #         };
  #       };
  #     };
  #   };
  # };
}
