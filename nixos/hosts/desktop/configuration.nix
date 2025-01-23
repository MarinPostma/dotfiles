# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../common/configuration.nix
      ./nvidia.nix
      ../../hardware/desktop/hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    openFirewall = true;
    ports = [22 4222];
  };

  users.users."adhoc".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH16lfhNcEXpLU59BNX+D0AW3yLTUqrdnSOPXc1383/T adhoc@adhocnixos" #laptop
  ];

}
