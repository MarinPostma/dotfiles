
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      inputs.home-manager.nixosModules.default
      ./../../modules/desktop/hyperland
      ./../common/configuration.nix
      ../../hardware/laptop/hardware-configuration.nix
    ];

  # Remap CAPS lock to ESC
  services.udev.extraHwdb = ''
  evdev:atkbd:*
    KEYBOARD_KEY_3a=esc
  '';

  services.tlp.enable = true;
  services.thermald.enable = true;

  environment.systemPackages = with pkgs; [
    acpi
  ];
}
