-- this file initializes the in game user interface

function CharInfo_OnClick()

end -- CharInfo_OnClick

-- was test only
function GameControl_OnClick()
	local pBuildMenu = tolua.cast(Screen:ControlByName ("<cont>LG_SubMain_Build"), "CMnuContainer")

	--prelimenary:
	pBuildMenu:SetVisible(false)
end

----------------------------------------------------------------------------------------------------------------
-- BuildMenu
----------------------------------------------------------------------------------------------------------------

function btSlot_OnClick(sender)
	local selcat = 0
	local selid = 0

	if Selection:GetSize() > 0 then
		selcat, selid = Selection:GetItem(0)
		if selcat == kGdCategoryFigure then
			if Figure:IsCarrier(selid) then
				if sender:Tag() == 3 then -- crush stones
					GameControl:CmdInitFigureCommand(kFigureCommandCrushStone)
				end
				if sender:Tag() == 6 then -- cut wood
					GameControl:CmdInitFigureCommand(kFigureCommandCutTree)
				end
			end
		end
	end
end -- btSlot_OnClick


function btSpell_OnClick(sender)
end -- btSpell_OnClick


function OnGlobalShortcut_ARF11()
	if Screen:HintsWanted() == true then
	   Screen:SetHintsWanted(false)
	else
	   Screen:SetHintsWanted(true)
	end
end --OnGlobalShortcut_ARF11()


function OnGlobalShortcut_TeleportAvatar()
	local x = 0
	local y = 0
	local valid
	valid, x, y = GameControl:GetMousePosGrid(x, y)
	if valid then
		Application:TeleportAvatar(x, y)
	end
end

-------------------------------------------------------------------------------------------------------------
-- main forms
-------------------------------------------------------------------------------------------------------------

MouseInfoForm =
{
	0, 25, 0, 25;
	Name = "<cont>MouseInfoContainer",
	AddTo = "<cont>LG_Debug",
	HandleIfTransparent = true,
	Alignment = kMnu_alClientWidth,
	Interval = 500,
	Controls = 
	{
		{ 0, 10, 0, 0; Type = "Label", Name = "<ctrl>LabelMouseGrid", Mesh = "ui_oth_tooltip.msh", AutoSize = true}
	}
}


-- this main gui container now directly supported from c
MainForm = 
{
	0, 0, 0, 0;
	Name = "<Cont>GameMenu",
	AddTo = "Screen",
	HandleIfTransparent = true,
	Controls = 
	{
		-- hero buttons
		{   0, 0, 38, 31; Type = "UiButton", Name = "<ctrl>btMainChar",	Hint = "Main character",	MeshGfx = "ui_btn_qs_mainchar.msh"},
		{  74, 0, 38, 31; Type = "UiButton", Name = "<ctrl>btHero1",	Hint = "Hero #1",			MeshGfx = "ui_btn_qs_hero1.msh"},
		{ 115, 0, 38, 31; Type = "UiButton", Name = "<ctrl>btHero2",	Hint = "Hero #2",			MeshGfx = "ui_btn_qs_hero2.msh"},
		{ 156, 0, 38, 31; Type = "UiButton", Name = "<ctrl>btHero3",	Hint = "Hero #3",			MeshGfx = "ui_btn_qs_hero3.msh"},
		{ 197, 0, 38, 31; Type = "UiButton", Name = "<ctrl>btHero4",	Hint = "Hero #4",			MeshGfx = "ui_btn_qs_hero4.msh"},
		{ 238, 0, 38, 31; Type = "UiButton", Name = "<ctrl>btHero5",	Hint = "Hero #5",			MeshGfx = "ui_btn_qs_hero5.msh"},

		-- other character buttons
		{ 457, 0, 38, 31; Type = "UiButton", Name = "<ctrl>btHumanWarrior",		Hint = "Human Warriors", 	MeshGfx = "ui_btn_qs_human_warrior.msh"},
		{ 498, 0, 38, 31; Type = "UiButton", Name = "<ctrl>btDwarfWarrior",		Hint = "Dwarf Warriors", 	MeshGfx = "ui_btn_qs_dwarf_warrior.msh"},
		{ 539, 0, 38, 31; Type = "UiButton", Name = "<ctrl>btElfWarrior",		Hint = "Elf Warriors", 		MeshGfx = "ui_btn_qs_elf_warrior.msh"},
		{ 580, 0, 38, 31; Type = "UiButton", Name = "<ctrl>btOrcWarrior",		Hint = "Orc Warriors", 		MeshGfx = "ui_btn_qs_orc_warrior.msh"},
		{ 621, 0, 38, 31; Type = "UiButton", Name = "<ctrl>btTrollWarrior",		Hint = "Troll Warriors",	MeshGfx = "ui_btn_qs_troll_warrior.msh"},
		{ 662, 0, 38, 31; Type = "UiButton", Name = "<ctrl>btDarkElfWarrior",	Hint = "Dark Elf Warrior",	MeshGfx = "ui_btn_qs_darkelf_warrior.msh"},
		{ 730, 0, 38, 31; Type = "UiButton", Name = "<ctrl>btHuman",			Hint = "Human Civilians", 	MeshGfx = "ui_btn_qs_human.msh"},
		{ 771, 0, 38, 31; Type = "UiButton", Name = "<ctrl>btDwarf",			Hint = "Dwarf Civilians", 	MeshGfx = "ui_btn_qs_dwarf.msh"},
		{ 812, 0, 38, 31; Type = "UiButton", Name = "<ctrl>btElf",				Hint = "Elf Civilians", 	MeshGfx = "ui_btn_qs_elf.msh"},
		{ 853, 0, 38, 31; Type = "UiButton", Name = "<ctrl>btOrc",				Hint = "Orc Civilians", 	MeshGfx = "ui_btn_qs_orc.msh"},
		{ 894, 0, 38, 31; Type = "UiButton", Name = "<ctrl>btTroll",			Hint = "Troll Civilians", 	MeshGfx = "ui_btn_qs_troll.msh"},
		{ 935, 0, 38, 31; Type = "UiButton", Name = "<ctrl>btDarkElf", 			Hint = "Darkelf Civilians",	MeshGfx = "ui_btn_qs_darkelf.msh"}
	
		-- build button
		--{ 986, 0, 38, 31; Type = "UiButton", Name = "<ctrl>btBuild", 	Hint = "Building menu", 	MeshGfx = "ui_btn_build_pick.msh", 	OnClick = "BtnBuild_OnClick"},
	}
}

dofile("Script\\UiDebugInfo.lua") -- definiert Debug_OnDataUpdate() etc.

DebugForm =
{
	0, 0, 0, 0;
	Name = "<cont>LG_Debug",
	AddTo = "Screen",
	HandleIfTransparent = true,
	EventIgnore = true,
	CanGetFocus = false,
	OnDoDataUpdate = "Debug_OnDataUpdate",
	Interval = Debug and Debug.SelectionInfoUpdate
}


-------------------------------------------------------------------------------------------------------------
-- sub forms
-------------------------------------------------------------------------------------------------------------

SubDebug1 = 
{
	0, 0, 0, 0;
	Name = "<cont>LG_SubDebug_1",
	AddTo = "<cont>LG_Debug",
	Controls =
	{
		{  0, 270, 0, 0; Type = "Label", Name = "<ctrl>lbReloadCount", 	Mesh = "ui_oth_tooltip.msh", AutoSize = true},

		{  0, 280, 0, 0; Type = "Label", Name = "<ctrl>lbACont", 		Mesh = "ui_oth_tooltip.msh", AutoSize = true},
		{  0, 290, 0, 0; Type = "Label", Name = "<ctrl>lbACtrl", 		Mesh = "ui_oth_tooltip.msh", AutoSize = true},
		{  0, 300, 0, 0; Type = "Label", Name = "<ctrl>lbMOver", 		Mesh = "ui_oth_tooltip.msh", AutoSize = true},

		{  0,  70, 0, 0; Type = "Label", Name = "<ctrl>lbFigure1",		Mesh = "ui_oth_tooltip.msh", AutoSize = true},
		{  0,  80, 0, 0; Type = "Label", Name = "<ctrl>lbFigure2", 		Mesh = "ui_oth_tooltip.msh", AutoSize = true},
		{  0,  90, 0, 0; Type = "Label", Name = "<ctrl>lbFigure3", 		Mesh = "ui_oth_tooltip.msh", AutoSize = true},
		{  0, 100, 0, 0; Type = "Label", Name = "<ctrl>lbFigure4", 		Mesh = "ui_oth_tooltip.msh", AutoSize = true},
		{  0, 110, 0, 0; Type = "Label", Name = "<ctrl>lbFigure5", 		Mesh = "ui_oth_tooltip.msh", AutoSize = true},
		{103,  75, 0, 0; Type = "Label", Name = "<ctrl>lbDebugInfo",	Font = kMnuFont_TypeDebug, AutoSize = true}, -- debug info on figures
		{  0, 735, 0, 0; Type = "Label", Name = "<ctrl>lbMouseGrid",		Font = kMnuFont_TypeDebug, AutoSize = true}, --,	Alignment = kMnu_alBottom,	ScaleDim = false},
	}
}


-- obsolete
SubMain_Minimap =
{
	0, 0, 161, 161;
	Name = "<cont>LG_SubMain_Minimap",
	AddTo = "<Cont>UiMain",
	Layer = "ui_cnt_minimap.msh", 
	Alignment = kMnu_alLowerRight,
	ControlsBack = 
	{
		{2, 2, 159, 159; Type = "Minimap", Name = "<ctrl>mmMinimap" }
	}
}


-- obsolete
SubMain_Top = 
{
	0, 0, 0, 31;
	Name = "<cont>LG_SubMain_Top",
	AddTo = "<Cont>UiMain",
	HandleIfTransparent = true,
	--Layer = "ui_cnt_top_DUMMY.msh",
	Alignment = kMnu_alTop
}


SubMain_Inventory =
{
	50, 50, 500, 500;
	Name = "<cont>LG_SubMain_Inventory",
	AddTo = "<Cont>UiMain",
	Background = "",
	Visible = false
}

-------------------------------------------------------------------------------------------------------------
-- list of shortcuts to activate (with UiCreateGlobalShortcut)
-------------------------------------------------------------------------------------------------------------

local active_shortcuts = {
	-- toggle display of tooltips
	{
		kMnu_kmALT_R,
		INP_Keyboard.KC_F11,
		"OnGlobalShortcut_ARF11",
		kMnu_scDebug,
		"toggle display of tooltips"
	},
	-- TeleportAvatar
	{
		kMnu_kmCONTROL,
		INP_Keyboard.KC_Y,
		"OnGlobalShortcut_TeleportAvatar",
		kMnu_scDebug,
		"teleport avatar"
	},
}

function GetModifiersFromName(n)
	local ret = kMnu_kmNONE
	local modifiers = {Shift=kMnu_kmSHIFT, LShift=kMnu_kmLSHIFT, RShift=kMnu_kmRSHIFT, Ctrl=kMnu_kmCONTROL, LCtrl=kMnu_kmLCONTROL, RCtrl=kMnu_kmRCONTROL, Alt=kMnu_kmALT, AltGr=kMnu_kmALT_R}
	for i,v in modifiers do
		if strfind(n,i) then
			ret = ret + v
		end
	end
	return ret
end

-- registers a table with shortkeys (usually from config.lua, i.e. Shortkeys_Debug)
function RegisterKeysFromConfig(keys, debugmode)
	for i,v in keys do
		local fname = "OnGlobalShortcut_"..i -- make function name
		
		globals()[fname] = function() dostring(%v) end -- create function
		
		local keyname = gsub(i,".-_?([^_]+)$","KC_%1") -- get keyname from table index
		
		UiCreateGlobalShortcut{
			tolua.cast(GetModifiersFromName(i), "EKbdModifier"), -- get modifiers from table index
			--EKbdModifier[GetModifiersFromName(i)], -- get modifiers from table index
			--GetModifiersFromName(i), -- get modifiers from table index
			INP_Keyboard[keyname],
			fname,
			debugmode,
			'shortkey from config.lua: '..i..' = "'..v..'"'
		}
	end
end

-------------------------------------------------------------------------------------------------------------
-- MAIN
-------------------------------------------------------------------------------------------------------------
if not UiGameMenu_executed then -- only run once - not on reload
	
	UiGameMenu_executed = 1

	Screen:ClearGlobalShortcuts(true)				-- delete only non spanned

	for i = 1, getn(active_shortcuts) do
		UiCreateGlobalShortcut(active_shortcuts[i])
	end

	if Shortkeys_Debug then
		RegisterKeysFromConfig(Shortkeys_Debug, kMnu_scDebug)
	end

	if Shortkeys_Global then
		RegisterKeysFromConfig(Shortkeys_Global, kMnu_scPublic)
	end

	--dofile("Script\\UiDebugShortcuts.lua")

	--UiCreateForm (MainForm)
	--UiCreateForm (SubMain_Minimap)
	-- obsolete: UiCreateForm (SubMain_Build)
	-- obsolete: UiCreateForm (SubMain_Top)

	UiCreateForm (DebugForm)
	
	-- %$ das hier ist wohl nicht nach Lua Exportiert:
	-- DebugForm.SetCanGetFocus(0)

	UiCreateForm (SubDebug1)
	--xUiCreateForm (MouseInfoForm)

	-- this callback hides the build menu
	Application:GetGameControl().OnClick = Application:MakeCallbackNotify("GameControl_OnClick")
end
