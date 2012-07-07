;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Name:           Cubemen Key Config
; Version:        1.0
; Author:         D1G1T4L3CH0 <d1g1t4l3ch0@gmail.com>

;    Cubemen Key Config
;    Copyright (C) 2012  D1G1T4L3CH0
;
;    This program is free software: you can redistribute it and/or modify
;    it under the terms of the GNU General Public License as published by
;    the Free Software Foundation, either version 3 of the License, or
;    (at your option) any later version.
;
;    This program is distributed in the hope that it will be useful,
;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;    GNU General Public License for more details.
;
;    You should have received a copy of the GNU General Public License
;    along with this program.  If not, see <http://www.gnu.org/licenses/>.

; Script Function:
;	To change the default gameplay keys in the game Cubemen since it has no way of doing so. This works by accepting the configured key in the ini file and sending the default game key to the game in it's place. An example would be to configure Sell Unit to the s key, and when you press s, x is actually sent to the game. This is safe for use while not in the game.

; TODO:
;	Do some checks to make sure the ini file was loaded correctly.
;	Do some more checks to make sure the keys were typed correctly. Maybe.
;	Make sure ther aren't multiples of the same key.
;	Need a way to toggle enable / disable the hotkeys so you can disable it for instance if you want to use the Steam overlay.
;	Maybe make a gui to configure the hotkeys. Probably not. Ini files are easy to edit.

; Known Issues:
;	* The hotkeys remain active while the Steam Overlay is active over the game. This may be fixed by adding a toggle for the hoykeys.

; Default Keys:
;	ESC		 - Pause / Unpause
;	\ or `	 - Switch Camera
;	+ -		 - Change Game Speed
;	m		 - Music On / Off
;	s		 - Sound FX On / Off
;	[ ]		 - Zoom Level
;	Arrows	 - Rotate Level
;	Space	 - Clear Selection
;	1 to 8	 - Unit Selection
;	x		 - Sell Unit
;	w		 - Next Wave (If Ready)
;	' ,		 - Cycle Selected Units

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#UseHook ; Ensures that the same key as the hotkey can be sent.
#SingleInstance force ; To make sure the user doesn't have multiple instances of the script running and possibly conflicting with one another.
SetTitleMatchMode 3 ; We want an exact match for for Cubemen so we know it's the game and not a website about Cubemen.

ifnotexist keys.ini ; If the ini file does not exist, make it.
{
; Create the ini file.
iniwrite ESC,keys.ini,Keys,PauseToggle
iniwrite \,keys.ini,Keys,CameraToggle
iniwrite +,keys.ini,Keys,GameSpeedIncrease
iniwrite -,keys.ini,Keys,GameSpeedDecrease
iniwrite s,keys.ini,Keys,SoundToggle
iniwrite m,keys.ini,Keys,MusicToggle
iniwrite ],keys.ini,Keys,ZoomIncrease
iniwrite [,keys.ini,Keys,ZoomDecrease
iniwrite UP,keys.ini,Keys,RotateUp
iniwrite DOWN,keys.ini,Keys,RotateDown
iniwrite LEFT,keys.ini,Keys,RotateLeft
iniwrite RIGHT,keys.ini,Keys,RotateRight
iniwrite SPACE,keys.ini,Keys,ClearSelection
iniwrite 1,keys.ini,Keys,UnitSelect_GRILL
iniwrite 2,keys.ini,Keys,UnitSelect_FLINT
iniwrite 3,keys.ini,Keys,UnitSelect_MOTY
iniwrite 4,keys.ini,Keys,UnitSelect_FRED
iniwrite 5,keys.ini,Keys,UnitSelect_PICKY
iniwrite 6,keys.ini,Keys,UnitSelect_LAZLO
iniwrite 7,keys.ini,Keys,UnitSelect_SID
iniwrite 8,keys.ini,Keys,UnitSelect_MIKE
iniwrite x,keys.ini,Keys,SellUnit
iniwrite w,keys.ini,Keys,NextWave
iniwrite ',keys.ini,Keys,CycleUnits
; Exit with a message box explaining how to edit the keys.
msgbox 4,Cubemen Key Config - First Run,This seems to be the first time this has been run so a new keys.ini file has been created and loaded with the default keys.`n`nYou should edit that file (keys.ini) to change the keys you want to use in the game. If you run this again without editing that file, only the default game keys will be used. if you change the keys.ini file after this is running, you will need to run this again to reload that file.`n`nTo change all the keys back to defaults, just delete the keys.ini file. Cubemen Key Config will now exit so you can edit the file.`n`nDo you need a list of keys you can type into the keys.ini file?
ifmsgbox yes ; Open the AutoHotkey website to the list of keys page.
	run www.autohotkey.com/docs/KeyList.htm
exit
}

; Load the ini.
iniread PauseToggle,keys.ini,Keys,PauseToggle
iniread CameraToggle,keys.ini,Keys,CameraToggle
iniread GameSpeedIncrease,keys.ini,Keys,GameSpeedIncrease
iniread GameSpeedDecrease,keys.ini,Keys,GameSpeedDecrease
iniread MusicToggle,keys.ini,Keys,MusicToggle
iniread SoundToggle,keys.ini,Keys,SoundToggle
iniread ZoomIncrease,keys.ini,Keys,ZoomIncrease
iniread ZoomDecrease,keys.ini,Keys,ZoomDecrease
iniread RotateUp,keys.ini,Keys,RotateUp
iniread RotateDown,keys.ini,Keys,RotateDown
iniread RotateLeft,keys.ini,Keys,RotateLeft
iniread RotateRight,keys.ini,Keys,RotateRight
iniread ClearSelection,keys.ini,Keys,ClearSelection
iniread UnitSelect_GRILL,keys.ini,Keys,UnitSelect_GRILL
iniread UnitSelect_FLINT,keys.ini,Keys,UnitSelect_FLINT
iniread UnitSelect_MOTY,keys.ini,Keys,UnitSelect_MOTY
iniread UnitSelect_FRED,keys.ini,Keys,UnitSelect_FRED
iniread UnitSelect_PICKY,keys.ini,Keys,UnitSelect_PICKY
iniread UnitSelect_LAZLO,keys.ini,Keys,UnitSelect_LAZLO
iniread UnitSelect_SID,keys.ini,Keys,UnitSelect_SID
iniread UnitSelect_MIKE,keys.ini,Keys,UnitSelect_MIKE
iniread SellUnit,keys.ini,Keys,SellUnit
iniread NextWave,keys.ini,Keys,NextWave
iniread CycleUnits,keys.ini,Keys,CycleUnits

; For possible future use in a gui.
GRILL	 = Pistol
FLINT	 = Flamer
MOTY	 = Morter
FRED	 = Ice Gun
RICKY	 = Rockets
LAZLO	 = Laser Gun
SID		 = Sniper
MIKE	 = Auto Moving (Healer)

; Notification that the script is loaded. Also serves the purpose of a warning since hotkeys will not be enabled until after the OK button is pressed.
msgbox 0,Cubemen Key Config,Your key configuration has been loaded. Remember to exit Cubemen Key Config from the windows system tray (next to the time / date) by right-clicking the green H AutoHotkey icon and choosing Exit.`n`nClick OK to close this dialog and enable the keys.,15000

; The hotkeys.
Hotkey %PauseToggle%,PauseToggle
Hotkey %CameraToggle%,CameraToggle
Hotkey %GameSpeedIncrease%,GameSpeedIncrease
Hotkey %GameSpeedDecrease%,GameSpeedDecrease
Hotkey %MusicToggle%,MusicToggle
Hotkey %SoundToggle%,SoundToggle
Hotkey %ZoomIncrease%,ZoomIncrease
Hotkey %ZoomDecrease%,ZoomDecrease
Hotkey %RotateUp%,RotateUp
Hotkey %RotateDown%,RotateDown
Hotkey %RotateLeft%,RotateLeft
Hotkey %RotateRight%,RotateRight
Hotkey %ClearSelection%,ClearSelection
Hotkey %UnitSelect_GRILL%,UnitSelect_GRILL
Hotkey %UnitSelect_FLINT%,UnitSelect_FLINT
Hotkey %UnitSelect_MOTY%,UnitSelect_MOTY
Hotkey %UnitSelect_FRED%,UnitSelect_FRED
Hotkey %UnitSelect_PICKY%,UnitSelect_PICKY
Hotkey %UnitSelect_LAZLO%,UnitSelect_LAZLO
Hotkey %UnitSelect_SID%,UnitSelect_SID
Hotkey %UnitSelect_MIKE%,UnitSelect_MIKE
Hotkey %SellUnit%,SellUnit
Hotkey %NextWave%,NextWave
Hotkey %CycleUnits%,CycleUnits
Return

; The labels.
; Maybe I need to make this bit smaller by using a common label...
PauseToggle:
if GameCheck()
	Send {ESC}
Else
	Send {%A_ThisHotkey%}
Return

CameraToggle:
if GameCheck()
	Send \
Else
	Send {%A_ThisHotkey%}
Return

GameSpeedIncrease:
if GameCheck()
	Send {NumpadAdd}
Else
	Send {%A_ThisHotkey%}
Return

GameSpeedDecrease:
if GameCheck()
	Send {NumpadSub}
Else
	Send {%A_ThisHotkey%}
Return

MusicToggle:
if GameCheck()
	Send m
Else
	Send {%A_ThisHotkey%}
Return

SoundToggle:
if GameCheck()
	Send s
Else
	Send {%A_ThisHotkey%}
Return

ZoomIncrease:
if GameCheck()
	Send ]
Else
	Send {%A_ThisHotkey%}
Return

ZoomDecrease:
if GameCheck()
	Send [
Else
	Send {%A_ThisHotkey%}
Return

RotateUp:
if GameCheck()
	Send {UP}
Else
	Send {%A_ThisHotkey%}
Return

RotateDown:
if GameCheck()
	Send {DOWN}
Else
	Send {%A_ThisHotkey%}
Return

RotateLeft:
if GameCheck()
	Send {LEFT}
Else
	Send {%A_ThisHotkey%}
Return

RotateRight:
if GameCheck()
	Send {RIGHT}
Else
	Send {%A_ThisHotkey%}
Return

ClearSelection:
if GameCheck()
	Send {SPACE}
Else
	Send {%A_ThisHotkey%}
Return

UnitSelect_GRILL:
if GameCheck()
	Send 1
Else
	Send {%A_ThisHotkey%}
Return

UnitSelect_FLINT:
if GameCheck()
	Send 2
Else
	Send {%A_ThisHotkey%}
Return

UnitSelect_MOTY:
if GameCheck()
	Send 3
Else
	Send {%A_ThisHotkey%}
Return

UnitSelect_FRED:
if GameCheck()
	Send 4
Else
	Send {%A_ThisHotkey%}
Return

UnitSelect_PICKY:
if GameCheck()
	Send 5
Else
	Send {%A_ThisHotkey%}
Return

UnitSelect_LAZLO:
if GameCheck()
	Send 6
Else
	Send {%A_ThisHotkey%}
Return

UnitSelect_SID:
if GameCheck()
	Send 7
Else
	Send {%A_ThisHotkey%}
Return

UnitSelect_MIKE:
if GameCheck()
	Send 8
Else
	Send {%A_ThisHotkey%}
Return

SellUnit:
if GameCheck()
	Send x
Else
	Send {%A_ThisHotkey%}
Return

NextWave:
if GameCheck()
	Send w
Else
	Send {%A_ThisHotkey%}
Return

CycleUnits:
if GameCheck()
	Send '
Else
	Send {%A_ThisHotkey%}
Return

; Funtion to check if the game is running and active. We don't want to send keys to anything else.
; Returns: bool
GameCheck()
{
	IfWinActive Cubemen ; See if there is a window with the name Cubemen currently active.
		WinGet OutputVar, ProcessName ; Get the process name of the last found window.
	if (OutputVar = "Cubemen.exe")
		Return true ; It's Cubemen.
	Else
		Return false ; It's something else or a window named Cubemen was not found.
}
