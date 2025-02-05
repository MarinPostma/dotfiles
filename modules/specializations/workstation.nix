{ pkgs, ... }:
{

  imports =
    [ # Include the results of the hardware scan.
      ./../desktop/hyperland
    ];

  services.logind.extraConfig = ''
        IdleAction=suspend
        IdleActionSec=1m
  '';

  systemd.sleep.extraConfig = ''
        HibernateDelaySec=1h
        AllowSuspend=yes
  '';

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "adhoc";
      };
    };
  };
}
