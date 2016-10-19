import XMonad

import XMonad.Util.Run
import XMonad.Util.Themes
import XMonad.Util.EZConfig
import XMonad.Util.CustomKeys
import XMonad.Util.SpawnOnce

import XMonad.Config.Desktop

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName

import XMonad.Layout.Tabbed
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Layout.BorderResize
import XMonad.Layout.WindowArranger
import XMonad.Layout.MouseResizableTile

import qualified XMonad.StackSet as W

import System.IO
import qualified Data.Map as Map

myTerminal = "urxvt"

myWorkspaces = clickable $ ["1:main","2:web","3:web","4:irc","5"]
  where clickable l = zipWith clickHandler [1..] l
        clickHandler idx label = "<action=`xdotool key super+" ++ show(idx) ++ "`>" ++ label ++ "</action>"

myNormalBorderColor  = "#000000"
myFocusedBorderColor = "#69DFFA"
myBorderWidth        = 1
myModMask            = mod4Mask
myFocusFollowsMouse  = True

myAdditionalKeys =
  [
    ("<XF86AudioMute>",         spawn "amixer -q set Master toggle" )
  , ("<XF86AudioLowerVolume>",  spawn "amixer sset Master 5%-" )
  , ("<XF86AudioRaiseVolume>",  spawn "amixer sset Master 5%+" )
  , ("<XF86AudioMicMute>",      spawn "amixer -q set Capture toggle" )
  , ("<XF86MonBrightnessUp>",   spawn "xbacklight +5%" )
  , ("<XF86MonBrightnessDown>", spawn "xbacklight -5%" )
  ]

myLayoutHook = smartBorders $ avoidStruts $ tiledResizable ||| Full
  where
    -- default tiling algorithm partitions the screen into two panes
    tall = Tall nmaster delta ratio
    gaps' = gaps [(U,10), (D,10), (L,10), (R,10)]
    tiled = gaps' $ spacing 10 $ tall
    tiledResizable = gaps' $ mouseResizableTile
    tiledResizableMirrored = gaps' $ mouseResizableTileMirrored

    -- The default number of windows in the master pane
    nmaster = 1
    -- Default proportion of screen occupied by master pane
    ratio   = 1/2
    -- Percent of screen to increment by when resizing panes
    delta   = 3/100

myKeys = customKeys delKeys addKeys
  where
    delKeys :: XConfig l -> [(KeyMask, KeySym)]
    delKeys XConfig { modMask = modm } = []

    addKeys :: XConfig l -> [((KeyMask, KeySym), X ())]
    addKeys XConfig { modMask = modm } =
      [ ((modm, xK_Escape), spawn "lock")
      , ((modm, xK_d), spawn "sh ~/scripts/x/auto-monitors.sh")
      , ((mod4Mask, xK_b), sendMessage ToggleStruts)
      ]

myStartupHook = do
  {-spawnOnce "compton"-}
  spawnOnce "./.fehbg"
  spawnOnce "xsetroot -cursor_name left_ptr"
  spawnOnce "xrdb -load ~/.Xresources"
  spawnOnce "xset r rate 200 50"
  setWMName "LG3D"

myLogHook = dynamicLogWithPP . myXmobar

myXmobar xmproc = def
  { ppOutput  = hPutStrLn xmproc
  , ppCurrent = xmobarColor "#69DFFA" "" . wrap "[" "]"   -- #9BC1B2
  , ppTitle   = xmobarColor "#69DFFA" "" . shorten 32       -- #9BC1B2
  , ppLayout  = \_ -> ""
  }

myManageHook = manageDocks <+> composeAll
  [ className =? "Firefox"  --> moveToWorkspace 2
  , appName   =? "chromium" --> moveToWorkspace 3
  , className =? "Slack"    --> moveToWorkspace 4
  , resource  =? "stalonetray" --> doIgnore
  ]
    where moveToWorkspace i = doF (W.shift $ myWorkspaces !! (i-1))

myConfig xmproc = def
  { terminal           = myTerminal
  , workspaces         = myWorkspaces
  , borderWidth        = myBorderWidth
  , normalBorderColor  = myNormalBorderColor
  , focusedBorderColor = myFocusedBorderColor
  , focusFollowsMouse  = myFocusFollowsMouse
  , modMask            = myModMask
  , keys               = myKeys
  , startupHook        = myStartupHook
  , logHook            = myLogHook xmproc
  , layoutHook         = myLayoutHook
  , manageHook         = myManageHook
  } `additionalKeysP` myAdditionalKeys

xmobarConfigPath = "/usr/bin/xmobar /home/daniel/.xmobarrc"

main = do
  xmproc <- spawnPipe xmobarConfigPath
  xmonad $ ewmh $ myConfig xmproc

