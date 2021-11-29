-- this file contains the debug shortcuts

---------------------------------------------------------------------------------------------------------------
-- declaration
---------------------------------------------------------------------------------------------------------------

function LoadConfig(key)
	if LastLoadedDebugConfig == key then -- beim 2. Mal drücken: ausschalten!
		GameView:Mode_ShowDebugOff()
		LastLoadedDebugConfig = nil
	else
		GameView:Mode_ShowDebugOn()
		DebugInfo:LoadConfig(key)
		LastLoadedDebugConfig = key
	end
end

function OnGlobalShortcut_F1()
	LoadConfig("F1")
end --OnGlobalShortcut_F1()

function OnGlobalShortcut_F2()
	LoadConfig("F2")
end --OnGlobalShortcut_F2()

function OnGlobalShortcut_F3()
	LoadConfig("F3")
end --OnGlobalShortcut_F3()

function OnGlobalShortcut_F4()
	LoadConfig("F4")
end --OnGlobalShortcut_F4()

function OnGlobalShortcut_F5()
	LoadConfig("F5")
end --OnGlobalShortcut_F5()

function OnGlobalShortcut_F6()
	LoadConfig("F6")
end --OnGlobalShortcut_F6()

function OnGlobalShortcut_F7()
	LoadConfig("F7")
end --OnGlobalShortcut_F7()

function OnGlobalShortcut_F8()
	LoadConfig("F8")
end --OnGlobalShortcut_F8()

function OnGlobalShortcut_CF1()
	DebugInfo:SaveConfig("F1")
end --OnGlobalShortcut_CF1()

function OnGlobalShortcut_CF2()
	DebugInfo:SaveConfig("F2")
end --OnGlobalShortcut_CF2()

function OnGlobalShortcut_CF3()
	DebugInfo:SaveConfig("F3")
end --OnGlobalShortcut_CF3()

function OnGlobalShortcut_CF4()
	DebugInfo:SaveConfig("F4")
end --OnGlobalShortcut_CF4()

function OnGlobalShortcut_CF5()
	DebugInfo:SaveConfig("F5")
end --OnGlobalShortcut_CF5()

function OnGlobalShortcut_CF6()
	DebugInfo:SaveConfig("F6")
end --OnGlobalShortcut_CF6()

function OnGlobalShortcut_CF7()
	DebugInfo:SaveConfig("F7")
end --OnGlobalShortcut_CF7()

function OnGlobalShortcut_CF8()
	DebugInfo:SaveConfig("F8")
end --OnGlobalShortcut_CF8()

-------------------------------------------------------------------------------------------------------------
-- list of shortcuts to activate (with UiCreateGlobalShortcut)
-------------------------------------------------------------------------------------------------------------

local active_shortcuts = {
	{
		kMnu_kmNONE,
		INP_Keyboard.KC_F1,
		"OnGlobalShortcut_F1",
		kMnu_scDebug,
		"Set World Debug Mode 1"
	},
	{
		kMnu_kmNONE,
		INP_Keyboard.KC_F2,
		"OnGlobalShortcut_F2",
		kMnu_scDebug,
		"Set World Debug Mode 2"

	},
	{
		kMnu_kmNONE,
		INP_Keyboard.KC_F3,
		"OnGlobalShortcut_F3",
		kMnu_scDebug,
		"Set World Debug Mode 3"
	},
	{
		kMnu_kmNONE,
		INP_Keyboard.KC_F4,
		"OnGlobalShortcut_F4",
		kMnu_scDebug,
		"Set World Debug Mode 4"
	},
	{
		kMnu_kmNONE,
		INP_Keyboard.KC_F5,
		"OnGlobalShortcut_F5",
		kMnu_scDebug,
		"Set World Debug Mode 5"
	},
	{
		kMnu_kmNONE,
		INP_Keyboard.KC_F6,
		"OnGlobalShortcut_F6",
		kMnu_scDebug,
		"Set World Debug Mode 6"
	},
	{
		kMnu_kmNONE,
		INP_Keyboard.KC_F7,
		"OnGlobalShortcut_F7",
		kMnu_scDebug,
		"Set World Debug Mode 7"
	},
	{
		kMnu_kmNONE,
		INP_Keyboard.KC_F8,
		"OnGlobalShortcut_F8",
		kMnu_scDebug,
		"Set World Debug Mode 8"
	},
	{
		kMnu_kmNONE,
		INP_Keyboard.KC_F9,
		"OnGlobalShortcut_F9",
		kMnu_scDebug,
		"< please comment >"
	},
	{
		kMnu_kmNONE,
		INP_Keyboard.KC_F10,
		"OnGlobalShortcut_F10",
		kMnu_scDebug,
		"< please comment >"
	},
	{
		kMnu_kmNONE,
		INP_Keyboard.KC_F11,
		"OnGlobalShortcut_F11",
		kMnu_scDebug,
		"< please comment >"
	},
	{
		kMnu_kmNONE,
		INP_Keyboard.KC_F12,
		"OnGlobalShortcut_F12",
		kMnu_scDebug,
		"< please comment >"
	},
	{
		kMnu_kmCONTROL,
		INP_Keyboard.KC_F1,
		"OnGlobalShortcut_CF1",
		kMnu_scDebug,
		"Save as World Debug Mode 1"
	},
	{
		kMnu_kmCONTROL,
		INP_Keyboard.KC_F2,
		"OnGlobalShortcut_CF2",
		kMnu_scDebug,
		"Save as World Debug Mode 2"
	},
	{
		kMnu_kmCONTROL,
		INP_Keyboard.KC_F3,
		"OnGlobalShortcut_CF3",
		kMnu_scDebug,
		"Save as World Debug Mode 3"
	},
	{
		kMnu_kmCONTROL,
		INP_Keyboard.KC_F4,
		"OnGlobalShortcut_CF4",
		kMnu_scDebug,
		"Save as World Debug Mode 4"
	},
	{
		kMnu_kmCONTROL,
		INP_Keyboard.KC_F5,
		"OnGlobalShortcut_CF5",
		kMnu_scDebug,
		"Save as World Debug Mode 5"
	},
	{
		kMnu_kmCONTROL,
		INP_Keyboard.KC_F6,
		"OnGlobalShortcut_CF6",
		kMnu_scDebug,
		"Save as World Debug Mode 6"
	},
	{
		kMnu_kmCONTROL,
		INP_Keyboard.KC_F7,
		"OnGlobalShortcut_CF7",
		kMnu_scDebug,
		"Save as World Debug Mode 7"
	},
	{
		kMnu_kmCONTROL,
		INP_Keyboard.KC_F8,
		"OnGlobalShortcut_CF8",
		kMnu_scDebug,
		"Save as World Debug Mode 8"
	}
}

---------------------------------------------------------------------------------------------------------------
-- MAIN
---------------------------------------------------------------------------------------------------------------

for i = 1, getn(active_shortcuts) do
	UiCreateGlobalShortcut(active_shortcuts[i])
end
