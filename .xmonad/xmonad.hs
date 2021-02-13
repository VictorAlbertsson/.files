module Main
  ( main
  )
where

import XMonad
import XMonad.Layout.Spacing
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)

myModMask         = mod4Mask
mySpacing         = 5
myTerminal        = "kitty"
myEditor          = "vim"
myLauncher        = "rofi -show run"
myCalculator      = "rofi -show calc -modi calc -no-show-match -no-sort"
myPasswordManager = "rofi-pass"

main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar"
  xmonad . ewmh . docks $ def
    { modMask            = myModMask
    , borderWidth        = 2
    , terminal           = myTerminal
    , normalBorderColor  = "#cccccc"
    , focusedBorderColor = "#cd8b00"
    , manageHook         = composeOne
                           [ className =? "steam" -?> doFullFloat -- steam bigpicture mode
                           , transience
                           , isFullscreen -?> doFullFloat
                           ]
    , layoutHook         = avoidStruts 
                           $ spacingRaw True
                                        (Border 0 mySpacing mySpacing mySpacing)
                                        True
                                        (Border mySpacing mySpacing mySpacing mySpacing)
                                        True 
                           $ layoutHook def
    , handleEventHook    = composeAll
                           [ handleEventHook def
                           , fullscreenEventHook
                           ]
    } `additionalKeys`
    [ ((myModMask, xK_p), spawn myLauncher)
    , ((myModMask, xK_f), spawn myPasswordManager)
    -- 'autoclicker' script at ~/.scripts/autoclicker
    , ((myModMask, xK_a), spawn "autoclicker")
    -- Open the system calculator
    , ((myModMask, xK_c), spawn myCalculator)
    -- Open editor in new window
    , ((myModMask, xK_e), spawn $ myTerminal ++ " -e " ++ myEditor)
    ]
