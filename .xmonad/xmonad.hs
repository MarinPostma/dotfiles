import XMonad
import XMonad.Config.Desktop
import XMonad.Util.EZConfig
import System.Exit
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing

main = xmonad $ desktopConfig
    { terminal    = "kitty"
    , modMask     = mod4Mask
    , startupHook = startup
    , layoutHook  = layout
    }
    `additionalKeysP`
        [ ("M-i", spawn "brave")
        , ("M-<Space>", spawn "rofi -show run")
        , ("M-<Return>", spawn "kitty")
        , ("M-S-q", kill)
        , ("M-S-e", io (exitWith ExitSuccess))
        , ("M-<F1>", spawn "sleep 0.5 && scrot -s /tmp/screenshot-$(date +%F_%T).png -e 'xclip -selection c -t image/png < $f'")
        , ("M-S-<Space>", sendMessage NextLayout)
        ]

startup = do
    spawn "xinput --set-prop 'Logitech G502 HERO Gaming Mouse' 'Device Accel Constant Deceleration' 2.5"
    spawn "xinput set-button-map 'ETPS/2 Elantech Touchpad' 1 1 3"
    spawn "xset r rate 180 60"
    spawn "feh --bg-scale /home/mpostma/Pictures/wallpaper.jpg"
    spawn "picom"
    spawn "conky -d"

layout = layoutNormal ||| layoutFull
    where
        layoutNormal = (spacing 10 $ noBorders  (gaps [(U,20), (R,20), (L, 20), (D, 20)] $ Tall 1 (3/100) (1/2)))
        layoutFull = noBorders Full
