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

  services.sshd = {
    enable = true;
    startWhenNeeded = true;
    openFirewall = true;
    passwordAuthentication = false;
    X11Forwarding = true;
  };

  users.users."adhoc".openssh.authorizedKeys = [
    # todo
  ];
}
