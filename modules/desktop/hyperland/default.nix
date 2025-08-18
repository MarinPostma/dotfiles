{ inputs, lib, pkgs, ... }: {
  imports = [
    ./programs/waybar.nix
  ];

  nix.settings = {
    substituters = ["https://hyprland.cachix.org/"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  home-manager.sharedModules = let
    inherit (lib) getExe getExe';
  in [
    ({...}: {
      imports = [
        inputs.hyprland.homeManagerModules.default
      ];

      home.packages = with pkgs; [
        blueman
        hyprpaper
        cliphist
        grimblast
        libnotify
        light
        networkmanagerapplet
        pamixer
        pavucontrol
        playerctl
        slurp
        rofi
        swappy
        swaynotificationcenter
        waybar
        wtype
        wl-clipboard
        wl-clipboard-x11
        xdotool
        inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
      ];

      xdg.configFile = {
        hypr = {
          source = ./scripts;
          recursive = true;
        };
      };

      #test later systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
      wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        systemd = {
          enable = true;
          variables = ["--all"];
        };
        settings = {
          "$scriptsDir" = "XDG_BIN_HOME";
          "$hyprScriptsDir" = "$HOME/.config/hypr/";
          "$mainMod" = "SUPER";
          "$launcher" = "pkill rofi || rofi -show drun -modi drun,filebrowser,run,window -theme DarkBlue";
          # "$term" = "${getExe pkgs.alacritty} -e tmux";
          "$term" = "${getExe pkgs.ghostty}";
          "$editor" = "code --disable-gpu";
          "$file" = "$term -e lf";
          "$browser" = "firefox";
          env = [
            "XDG_CURRENT_DESKTOP,Hyprland"
            "XDG_SESSION_DESKTOP,Hyprland"
            "XDG_SESSION_TYPE,wayland"
            "GDK_BACKEND,wayland,x11,*"
            "NIXOS_OZONE_WL,1"
            "ELECTRON_OZONE_PLATFORM_HINT,auto"
            "MOZ_ENABLE_WAYLAND,1"
            "OZONE_PLATFORM,wayland"
            "EGL_PLATFORM,wayland"
            "CLUTTER_BACKEND,wayland"
            "SDL_VIDEODRIVER,wayland"
            "QT_QPA_PLATFORM,wayland;xcb"
            "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
            "QT_QPA_PLATFORMTHEME,qt6ct"
            "QT_AUTO_SCREEN_SCALE_FACTOR,1"
            "WLR_RENDERER_ALLOW_SOFTWARE,1"
            "NIXPKGS_ALLOW_UNFREE,1"
            "HYPRCURSOR_THEME,rose-pine-hyprcursor"
          ];
          exec-once = [
            "hyprpaper"
            "1password"   
            "sleep 1 && waybar"
            # "swaync"
            "pamixer --set-volume 50"
            "dunst"
            "blueman-applet"
            "nm-applet --indicator"
            "wl-clipboard-history -t"
            "${getExe' pkgs.wl-clipboard "wl-paste"} --type text --watch cliphist store" # clipboard store text data
            "${getExe' pkgs.wl-clipboard "wl-paste"} --type image --watch cliphist store" # clipboard store image data
            "rm '$XDG_CACHE_HOME/cliphist/db'" # Clear clipboard
            # "$hyprScriptsDir/batterynotify.sh" # battery notification
            "polkit-agent-helper-1"
            "systemctl start --user polkit-kde-authentication-agent-1"
          ];
          input = {
            kb_layout = "us";
            repeat_delay = 200; # or 212
            repeat_rate = 100;

            follow_mouse = 1;

            touchpad = {natural_scroll = false;};

            sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
            force_no_accel = true;
          };
          animations = {
            enabled = false;
          };
          general = {
            gaps_in = 4;
            gaps_out = 9;
            border_size = 2;
            "col.active_border" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
            "col.inactive_border" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
            resize_on_border = true;
            layout = "master"; # dwindle or master
            # allow_tearing = true; # Allow tearing for games (use immediate window rules for specific games or all titles)
          };
          group = {
            "col.border_active" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
            "col.border_inactive" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
            "col.border_locked_active" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
            "col.border_locked_inactive" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
          };
          layerrule = [
            "blur, rofi"
            "ignorezero, rofi"
            "ignorealpha 0.7, rofi"

            "blur, swaync-control-center"
            "blur, swaync-notification-window"
            "ignorezero, swaync-control-center"
            "ignorezero, swaync-notification-window"
            "ignorealpha 0.7, swaync-control-center"
            # "ignorealpha 0.8, swaync-notification-window"
            # "dimaround, swaync-control-center"
          ];
          render = {
            # explicit_sync = 2; # 0 = off, 1 = on, 2 = auto based on gpu driver.
            # explicit_sync_kms = 2; # 0 = off, 1 = on, 2 = auto based on gpu driver.
            direct_scanout = false; # Set to true for less Fullscreen game lag (may cause glitches).
          };
          misc = {
            disable_hyprland_logo = true;
            mouse_move_focuses_monitor = true;
            vfr = true; # always keep on vrr = 1; # enable variable refresh rate (0=off, 1=on, 2=fullscreen only)
          };
          gestures = {
            workspace_swipe = true;
            workspace_swipe_fingers = 3;
          };
          dwindle = {
            pseudotile = true;
            preserve_split = true;
          };
          master = {
            new_status = "master";
            new_on_top = true;
            mfact = 0.5;
          };
          windowrulev2 = [
            #"noanim, class:^(Rofi)$
            "workspace 1, class:^(Alacritty)$"
            "workspace 3, class:^(Spotify)$"
            "workspace 2, class:^(firefox)$"

            "float,class:^(qt5ct)$"
            "float,class:^(nwg-look)$"
            "float,class:^(org.kde.ark)$"
            "float,class:^(Signal)$" #Signal-Gtk
            "float,class:^(com.github.rafostar.Clapper)$" #Clapper-Gtk
            "float,class:^(app.drey.Warp)$" #Warp-Gtk
            "float,class:^(net.davidotek.pupgui2)$" #ProtonUp-Qt
            "float,class:^(yad)$" #Protontricks-Gtk
            "float,class:^(eog)$" #Imageviewer-Gtk
            "float,class:^(io.gitlab.theevilskeleton.Upscaler)$" #Upscaler-Gtk
            "float,class:^(pavucontrol)$"
            "float,class:^(blueman-manager)$"
            "float,class:^(nm-applet)$"
            "float,class:^(nm-connection-editor)$"
            "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"
          ];
          binde = [
            # Resize windows
            "$mainMod SHIFT, right, resizeactive, 30 0"
            "$mainMod SHIFT, left, resizeactive, -30 0"
            "$mainMod SHIFT, up, resizeactive, 0 -30"
            "$mainMod SHIFT, down, resizeactive, 0 30"

            # Resize windows with hjkl keys
            "$mainMod SHIFT, l, resizeactive, 30 0"
            "$mainMod SHIFT, h, resizeactive, -30 0"
            "$mainMod SHIFT, k, resizeactive, 0 -30"
            "$mainMod SHIFT, j, resizeactive, 0 30"

            # Functional keybinds
            ",XF86MonBrightnessDown,exec,light -U 20"
            ",XF86MonBrightnessUp,exec,light -A 20"
            ",XF86AudioLowerVolume,exec,pamixer -d 2"
            ",XF86AudioRaiseVolume,exec,pamixer -i 2"
          ];
          bind =
            [
              # passthrough
              "SUPER_SHIFT, C, pass, brave"
              "SUPER_SHIFT, [, pass, brave"
              "SUPER_SHIFT, ], pass, brave"
              "SUPER_SHIFT, T, pass, brave"

              "SUPER_SHIFT, S, exec, $hyprScriptsDir/screenshot.sh s" # drag to snip an area / click on a window to print it

              # Window/Session actions
              "SUPER_SHIFT, E, exit" # kill hyperland session
              "SUPER_SHIFT, Q, killactive" # kill hyperland session
              "ALT, return, fullscreen" # toggle the window on focus to fullscreen

              "$mainMod, Return, exec, $term -e tmux"
              "SUPER_SHIFT, Return, exec, $term"
              "$CONTROL ALT, DELETE, exec, $term -e '${getExe pkgs.btop}'" # system monitor

              "$mainMod, SPACE, exec, pkill -x rofi || $launcher" # launch desktop applications

              # Screenshot/Screencapture
              # "$mainMod, P, exec, $hyprScriptsDir/screenshot.sh s" # drag to snip an area / click on a window to print it
              # "$mainMod CTRL, P, exec, $hyprScriptsDir/screenshot.sh sf" # frozen screen, drag to snip an area / click on a window to print it
              # "$mainMod, print, exec, $hyprScriptsDir/screenshot.sh m" # print focused monitor
              # "$mainMod ALT, P, exec, $hyprScriptsDir/screenshot.sh p" # print all monitor outputs

              # Functional keybinds
              ",xf86Sleep, exec, systemctl suspend" # Put computer into sleep mode
              ",XF86AudioMicMute,exec,pamixer --default-source -t" # mute mic
              ",XF86AudioMute,exec,pamixer -t" # mute audio
              ",XF86AudioPlay,exec,playerctl play-pause" # Play/Pause media
              ",XF86AudioPause,exec,playerctl play-pause" # Play/Pause media
              ",xf86AudioNext,exec,playerctl next" # go to next media
              ",xf86AudioPrev,exec,playerctl previous" # go to previous media
              # ",xf86AudioNext,exec,$hyprScriptsDir/MediaCtrl.sh --nxt" # go to next media
              # ",xf86AudioPrev,exec,$hyprScriptsDir/MediaCtrl.sh --prv" # go to previous media

              # to switch between windows in a floating workspace
              "SUPER,Tab,cyclenext"
              "SUPER,Tab,bringactivetotop"

              # Switch workspaces relative to the active workspace with mainMod + CTRL + [←→]
              "$mainMod CTRL, right, workspace, r+1"
              "$mainMod CTRL, left, workspace, r-1"

              # Move focus with mainMod + HJKL keys
              "$mainMod, h, movefocus, l"
              "$mainMod, l, movefocus, r"
              "$mainMod, k, movefocus, u"
              "$mainMod, j, movefocus, d"

              # Scroll through existing workspaces with mainMod + scroll
              "$mainMod, mouse_down, workspace, e+1"
              "$mainMod, mouse_up, workspace, e-1"

              # Move active window to a relative workspace with mainMod + CTRL + ALT + [←→]
              "$mainMod CTRL ALT, right, movetoworkspace, r+1"
              "$mainMod CTRL ALT, left, movetoworkspace, r-1"

              # Move active window around current workspace with mainMod + SHIFT + CTRL [←→↑↓]
              "$mainMod SHIFT $CONTROL, left, movewindow, l"
              "$mainMod SHIFT $CONTROL, right, movewindow, r"
              "$mainMod SHIFT $CONTROL, up, movewindow, u"
              "$mainMod SHIFT $CONTROL, down, movewindow, d"

              # Move active window around current workspace with mainMod + SHIFT + CTRL [HLJK]
              "$mainMod SHIFT $CONTROL, H, movewindow, l"
              "$mainMod SHIFT $CONTROL, L, movewindow, r"
              "$mainMod SHIFT $CONTROL, K, movewindow, u"
              "$mainMod SHIFT $CONTROL, J, movewindow, d"

            ]
            ++ (builtins.concatLists (builtins.genList (x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mainMod, ${ws}, focusworkspaceoncurrentmonitor, ${toString (x + 1)}"
              "$mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              "$mainMod CTRL, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
            ])
              10));
          bindm = [
            # Move/Resize windows with mainMod + LMB/RMB and dragging
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:273, resizewindow"
          ];
        };
        extraConfig = ''
          binds {
            workspace_back_and_forth = 1
          }

          # Easily plug in any monitor
          monitor=,preferred,auto,1
        '';
      };
    })
  ];
}
