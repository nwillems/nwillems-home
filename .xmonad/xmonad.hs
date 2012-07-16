import Data.List

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.Named
import XMonad.Layout.MagicFocus
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import qualified XMonad.Util.CustomKeys as C
import qualified XMonad.StackSet as W
import qualified Data.Map as M

(ws1, ws2, ws3, ws4, ws5, ws6, ws7, ws8, ws9) = ("web", "2", "3", "4", "5", "6", "7", "8", "9")
myWorkspaces = [ws1, ws2, ws3, ws4, ws5, ws6, ws7, ws8, ws9]
-- myKeys :: XConfig Layout -> [(ButtonMask, KeySym) X ()]
myKeys conf @ (XConfig {XMonad.modMask = modm}) = M.fromList $
    [
        ((modm,               xK_Print), spawn "/home/nwillems/scripts/screenshot.sh src")
      , ((modm .|. shiftMask, xK_Print), spawn "/home/nwillems/scripts/screenshot.sh win")
      , ((modm,               xK_p), spawn "exe=`xmessage This machine doesn't run dmenu, asshole` && exec $exe")
    ]

tmpKeys x = M.union (keys defaultConfig x) (myKeys x)

myManageHook = composeAll
    [
      className =? "/usr/bin/chromium" --> doShift ws1
    ]

myLayout = tiled ||| Mirror tiled ||| mfMirrorTiled ||| Full
  where
    tiled = Tall tNmaster tDelta tRatio
    mfMirrorTiled = named "Dev" $ magicFocus $ Mirror $ Tall mfNmaster mfDelta mfRatio
    -- Number of master windows per default
    tNmaster = 1 
    mfNmaster = 1
     -- Default ratio master pane occupies
    tRatio = 1/2
    mfRatio = 8/10
     -- Resizing percent
    tDelta = 3/100
    mfDelta = 3/100

-- ODL CONFIG myLayout = avoidStruts $ layoutHook defaultConfig

myEventHook = followOnlyIf (fmap not isMagicFocus)
  where isMagicFocus = fmap (isSuffixOf "Dev") $
                       gets (description . W.layout . W.workspace . W.current . windowset)


-- ------------------------------
-- XMOBAR Config
-- ------------------------------
myBar = "xmobar"
myPrettyPrint = xmobarPP {ppCurrent = xmobarColor "yellow" "" .wrap "[" "]" }
myToggleBar XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

main = xmonad =<< statusBar myBar myPrettyPrint myToggleBar 
        defaultConfig {
          modMask            = mod4Mask
        , terminal           = "urxvt"
        , borderWidth        = 2
        , normalBorderColor  = "#72562B"
        , focusedBorderColor = "#6294D0"
        , keys               = tmpKeys
        , manageHook         = myManageHook <+> manageHook defaultConfig <+> manageDocks
        , layoutHook         = myLayout
        , handleEventHook    = myEventHook
        }
