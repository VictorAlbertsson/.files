module Main
  ( main
  )
where

import Data.Tree
import Control.Monad
import System.Environment

import XMonad
import XMonad.StackSet (greedyView, shift)
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Actions.TreeSelect
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
myPasswordManager = "rofi-pass"

myTreeConf =
  TSConfig { ts_hidechildren = True
           , ts_background   = 0xc0c0c0c0
           , ts_font         = "xft:Sans-16"
           , ts_node         = (0xff000000, 0xff50d0db)
           , ts_nodealt      = (0xff000000, 0xff10b8d6)
           , ts_highlight    = (0xffffffff, 0xffff0000)
           , ts_extra        = 0xff000000
           , ts_node_width   = 200
           , ts_node_height  = 30
           , ts_originX      = 0
           , ts_originY      = 0
           , ts_indent       = 80
           , ts_navigate     = defaultNavigation
           }

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
                           $ layoutHook def -- +2 spacing to counteract the borderwidth
    , handleEventHook    = composeAll
                           [ handleEventHook def
                           , fullscreenEventHook
                           ]
    } `additionalKeys`
    [ ((myModMask, xK_p), spawn myLauncher)
    , ((myModMask .|. shiftMask, xK_p), spawn myPasswordManager)
    -- 'autoclicker' script at ~/.scripts/autoclicker
    , ((myModMask, xK_c), spawn "autoclicker")
    -- Move focus to another workspace
    , ((myModMask, xK_f), treeselectWorkspace myTreeConf myWorkspaces greedyView)
    -- Move both window and focus to another workspace
    , ((myModMask .|. shiftMask, xK_f), treeselectWorkspace myTreeConf myWorkspaces $ liftM2 (.) greedyView shift)
    -- Open editor in a new tab (v for $VISUAL)
    , ((myModMask, xK_v), spawn $ myTerminal ++ " -e " ++ myEditor)
    ]
