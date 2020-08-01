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
import XMonad.Actions.TreeSelect
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)

superMask  = mod4Mask

main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar"
  xmonad . ewmh . docks $ def
    { modMask            = superMask
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
    , handleEventHook    = composeAll
                           [ handleEventHook def
                           , fullscreenEventHook
                           ]
    , workspaces         = toWorkspaces myWorkspaces
    } `additionalKeys`
    [ ((superMask, xK_p), spawn "rofi -show run")
    , ((superMask, xK_f), -- Move focus to another workspace
       treeselectWorkspace myTreeConf myWorkspaces greedyView)
    , ((superMask .|. shiftMask, xK_f), -- Move both window and focus to another workspace
       treeselectWorkspace myTreeConf myWorkspaces $ liftM2 (.) greedyView shift)
    , ((superMask, xK_v), spawn "emacsclient --create-frame") -- v for $VISUAL
    ]

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

myWorkspaces =
  [ Node "Programming"
    [ Node "Terminal" []
    , Node "Browser" []
    , Node "Editor" []
    , Node "Notes" []
    ]
  , Node "Media"
    [ Node "Steam" []
    , Node "Games" []
    , Node "Browser" []
    , Node "Writing" []
    , Node "GIS" []
    , Node "Discord" []
    ]
  , Node "System"
    [ Node "Terminal" []
    , Node "Editor" []
    ]
  ]
