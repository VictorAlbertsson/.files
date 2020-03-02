module Main
  ( main
  )
where

import           XMonad
import           XMonad.Config.Desktop

main :: IO ()
main = do
  spawn "xmobar"

  xmonad $ desktopConfig { modMask            = mod4Mask
                         , borderWidth        = 2
                         , terminal           = "alacritty"
                         , normalBorderColor  = "#cccccc"
                         , focusedBorderColor = "#cd8b00"
                         }
