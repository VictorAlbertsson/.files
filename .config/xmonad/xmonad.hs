module Main
  ( main
  )
where

import XMonad
import XMonad.Config.Desktop
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)

superKey  = mod4Mask

main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ ewmh $ docks def
    { modMask            = superKey
    , borderWidth        = 2
    , terminal           = "alacritty"
    , normalBorderColor  = "#cccccc"
    , focusedBorderColor = "#cd8b00"
    , manageHook         = composeOne
                           [ className =? "steam" -?> doFullFloat -- steam bigpicture mode
                           , transience
                           , isFullscreen -?> doFullFloat
                           ]
    , layoutHook         = avoidStruts $ smartBorders $ layoutHook def
    , handleEventHook    = composeAll [ handleEventHook def
                                      , fullscreenEventHook
                                      ]
    } `additionalKeys`
    [ ((superKey, xK_p), spawn "rofi -show run")
    ]
