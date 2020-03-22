module Main
  ( main
  )
where

import           XMonad
import           XMonad.Config.Desktop
import           XMonad.Util.EZConfig

main :: IO ()
main = do
  spawn "xmobar"
  xmonad
    $                desktopConfig { modMask            = mod4Mask
                                   , borderWidth        = 2
                                   , terminal           = "alacritty"
                                   , normalBorderColor  = "#cccccc"
                                   , focusedBorderColor = "#cd8b00"
                                   }
    `additionalKeys` [((mod4Mask, xK_p), spawn "rofi -show run")]
