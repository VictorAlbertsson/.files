module Main
  ( main
  )
where

import Data.Tree

import XMonad
import XMonad.Config.Desktop
import XMonad.Layout.NoBorders
import XMonad.Actions.TreeSelect
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)
import qualified XMonad.StackSet as W

superMask  = mod4Mask

main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ ewmh $ docks def
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
    , ((superMask, xK_f), treeselectWorkspace myTreeConf myWorkspaces W.greedyView)
    , ((superMask .|. shiftMask, xK_f), treeselectWorkspace myTreeConf myWorkspaces W.shift)
    ]

myTreeConf = TSConfig { ts_hidechildren = True
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
        [ Node "Browser" []
        , Node "Games"
          [ Node "Steam" []
          , Node "1"     []
          , Node "2"     []
          , Node "3"     []
          , Node "4"     []
          , Node "5"     []
          , Node "6"     []
          , Node "7"     []
          , Node "8"     []
          , Node "9"     []
          ]
        , Node "Work"
          [ Node "Programming" []
          , Node "Writing" []
          ]
        ]
