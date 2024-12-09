# https://gvolpe.com/blog/xmonad-polybar-nixos/
{ pkgs, lib, config, ... }:

let
    cfg = config.programs.xmonad;
in {
    _file = ./default.nix;

    options = {
        programs.xmonad.enable = lib.mkEnableOption "xmonad";
    };

    config = lib.mkIf (cfg.enable) {
        services = {
            gnome3.gnome-keyring.enable = true;
            upower.enable = true;

            dbus = {
                enable = true;
                socketActivated = true;
                packages = [ pkgs.gnome3.dconf ];
            };

            xserver = {
                enable = true;
                startDbusSession = true;
                layout = "us";

                lininput = {
                    enable = true;
                    disableWhileTyping = true;
                };

                services.xserver.windowManager.xmonad = {
                    enable = true;
                    enableContribAndExtra = true;
                    config = builtins.readFile ../../../xmonad/xmonad.hs;
                };
            };

            hardware.bluetooth.enable = true;
            services.blueman.enable = true;
            systemd.services.upower.enable =true;
        };
    };
}
