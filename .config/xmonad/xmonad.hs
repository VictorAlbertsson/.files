module Main
  ( main
  )
where

import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)

modkey = mod4Mask

main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ docks def
    { modMask            = modkey
    , borderWidth        = 2
    , terminal           = "alacritty"
    , normalBorderColor  = "#cccccc"
    , focusedBorderColor = "#cd8b00"
    , layoutHook         = avoidStruts $ layoutHook def
    } `additionalKeys`
    [ ((modkey, xK_p), spawn "rofi -show run")
    ]
