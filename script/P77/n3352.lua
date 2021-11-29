function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

DebugInitAction( SetNpcTimeStamp{Name = "blocktest"} )
OnOneTimeEvent
{
	Conditions = {
		IsNpcTimeElapsed{Name = "blocktest", Seconds = 5},
	},
	Actions = {
		RemoveObject{X = 10, Y = 12, Object = 901},
		RemoveObject{X = 12, Y = 12, Object = 901},
	},
}

OnOneTimeEvent
{
	Conditions = {
	},
	Actions = {
			PlaceObject {X = 9, Y = 29, Object = random(2054,2056)},		
			PlaceObject {X = 9, Y = 30, Object = random(2054,2056)},		
			PlaceObject {X = 9, Y = 31, Object = random(2054,2056)},		

			PlaceObject {X = 10, Y = 29, Object = random(2054,2056)},		
			PlaceObject {X = 10, Y = 31, Object = random(2054,2056)},		

			PlaceObject {X = 11, Y = 29, Object = random(2054,2056)},		
			PlaceObject {X = 11, Y = 30, Object = random(2054,2056)},		
			PlaceObject {X = 11, Y = 31, Object = random(2054,2056)},		
	},
}

OnOneTimeEvent
{
	Conditions = {
		FigureDead{NpcId = 3072},
	},
	Actions = {
		ShowDebugText{String = "Derrrr Toooooood!"},
		TransferItem{GiveItem = 3459, Flag = Give, Amount = 10}
	},
}

for i = 1, 7, 2 do
	for j = 1, 7, 2 do
		DebugInitAction( SetEffect{Effect = "Campfire", X = (140 + j), Y = (140 + i), Length = 0} )
	end
end


--DebugInitAction( SetEffect{Effect = "IcePack"} )
--DebugInitAction( SetEffect{Effect = "SimpleInvis"} )
DebugInitAction( SetNpcTimeStamp{Name = "fxtest"} )
OnOneTimeEvent
{
	Conditions = {
		IsNpcTimeElapsed{Name = "fxtest", Seconds = 10, UpdateInterval = 10},
	},
	Actions = {
		SetEffect{Effect = "IcePack", Length = 20000},
		--ShowDebugText{String = "EndGame wurde aufgerufen!"},
		Goto{X = 56, Y = 56, NpcId = Avatar, WalkMode = Walk, GotoMode = GotoForced},
		Goto{X = 10, Y = 10, NpcId = 3352, WalkMode = Run, GotoMode = GotoForced},
		--Outcry{ Tag = "outcryBahirShiel001"      , NpcId = 0, String = "Männer, seht doch! Einar ist zurück! Wird auch Zeit, dass Ihr Euch hier einfindet, Sergeant!", Color = ColorWhite },
		--Outcry{ Tag = "outcryBahirShiel001"      , NpcId = 0, String = "Männer, seht doch! Einar ist zurück! Wird auch Zeit, dass Ihr Euch hier einfindet, Sergeant!", Color = ColorWhite },
--		Outcry{ Tag = "outcryEinarLeaf001", NpcId = 3352, String = "He! Ihr da! Hier herüber!", Color = ColorWhite },
--		Outcry{ Tag = "outcryEinarLeaf003", NpcId = 3352, String = "Bei den Göttern! Seht! Ein Troll! Zum Seelenfluss mit dir, Bestie!", Color = ColorWhite },
		Outcry{ Tag = "outcryBahirShiel001"      , NpcId = 3352, String = "Männer, seht doch! Einar ist zurück! Wird auch Zeit, dass Ihr Euch hier einfindet, Sergeant!", Color = ColorWhite },
		Outcry{ Tag = "outcryEinarShiel002", NpcId = 3072, String = "Ich bin ebenfalls erfreut Euch zu sehen, Hauptmann!", Color = ColorWhite },

		SetDialogType{Type = MainQuest},
	},
}

OnOneTimeEvent
{
	Conditions = {
		FigureInRange{NpcId = Avatar, X = 5, Y = 5, Range = 3},
	},
	Actions = {
		CGdsEndGame:new(),
	},
}

DebugInitAction( TransferItem{GiveItem = 3458, Flag = Give, Amount = 10} )

OnOneTimeEvent
{
	Conditions = {
		IsGlobalTimeElapsed{Name = "TEST3", Seconds = 10, UpdateInterval = 10},
	},
	Actions = {
		TransferItem{TakeItem = 3458, Flag = Take, Amount = 6},
		SetEffect{Effect = "Torch", Length = 3333, NpcId = Avatar},
	},
}

DebugInitAction( SetGlobalTimeStamp{Name = "TEST3"} )
DebugInitAction( SetGlobalTimeStamp{Name = "TEST4"} )

OnOneTimeEvent
{
	Conditions = {
		IsGlobalTimeElapsed{Name = "TEST3", Seconds = 15, UpdateInterval = 10},
	},
	Actions = {
		ClearGlobalTimeStamp{Name = "TEST3"},
		SetEffect{Effect = "Torch", Length = 9666},
		SetEffect{Effect = "GateSmallClose", Length = 9999},
		SetDialogType{Type = SideQuest},
	},
}
OnOneTimeEvent
{
	Conditions = {
		IsGlobalTimeElapsed{Name = "TEST4", Seconds = 60, UpdateInterval = 10},
	},
	Actions = {
		SetGlobalTimeStamp{Name = "TEST3"},
	},
}
OnEvent
{
	Conditions = {
		IsGlobalTimeElapsed{Name = "TEST3", Seconds = 8, UpdateInterval = 10},
	},
	Actions = {
		SetEffect{Effect = "Spawnboss", Length = 1999},
	},
}


OnPlatformOneTimeEvent
{
	Conditions = {
		PlayerHasMoney{Gold = 1, Silver = 0, Copper = 0, UpdateInterval = 10},
	},
	Actions = {
		--ShowDebugText{String = "Spieler hat mind. soviel Geld!"},
		SetEffect{NpcId = Avatar, Effect = "Loot", Length = 9999},
	},
}

DebugInitAction( SetGlobalTimeStamp{Name = "MONEY"} )
OnEvent
{
	Conditions = {
		Negated(PlayerHasMoney{Gold = 1, Silver = 0, Copper = 0, UpdateInterval = 10}),
		IsGlobalTimeElapsed{Name = "MONEY", Seconds = 1, UpdateInterval = 10},
	},
	Actions = {
		TransferMoney{Silver = 3},
		SetGlobalTimeStamp{Name = "MONEY"},
	},
}


PlatformInitAction(	SetEffect{Effect = "AcidCloud", X = 16, Y = 16, Length = 5500} )
PlatformInitAction(	ShowDebugText{String = "PlatformInitAction!"} )

OnPlatformOneTimeEvent
{
	Conditions = {
	},
	Actions = {
		--SetEffect{Effect = "FogForever", X = 10, Y = 10, Length = 0},
		ShowDebugText{String = "OnPlatformOneTimeEvent!"},
	},
}
REM = [[
]]

REM = [[
OnToggleEvent
{
	OnConditions = {
		IsNpcFlagTrue{Name = "PlatformOneTimeEvent" .. "Num" .. tostring(NumOneTimeEvents), UpdateInterval = 1},
	},
	OnActions = {
		SetEffect{Effect = "GateLargeOpen", NpcId = Avatar, Length = 9999},
	},
	OffConditions = {
		IsNpcFlagFalse{Name = "PlatformOneTimeEvent" .. "Num" .. tostring(NumOneTimeEvents), UpdateInterval = 1},
	},
	OffActions = {
		SetEffect{Effect = "GateSmallClose", NpcId = Avatar, Length = 9999},
	},
}
]]


REM = [[
OnToggleEvent
{
	OnConditions = {
		TimeDay(),
	},
	OnActions = {
		StopEffect{},
		SetEffect{Effect = "TorchOff"},
		SetEffect{Effect = "Inflex"},
		SetInfoText{String = "" , Tag = "Es ist TAG !" , Color = ColorDarkBlue , ClearAfterSpeech = TRUE},
	},
	OffConditions = {
		Negated(TimeDay()),
	},
	OffActions = {
		StopEffect{},
		SetEffect{Effect = "Torch"},
		SetEffect{Effect = "Spawnboss"},
		SetInfoText{String = "" , Tag = "Es ist NACHT !" , Color = ColorPink , ClearAfterSpeech = TRUE},
	},
}
]]

REM = [[
DebugInitAction( SetGlobalTimeStamp{Name = "EFFEKT_TEST2"} )
OnOneTimeEvent
{
	Conditions = {
		IsGlobalTimeElapsed{Name = "EFFEKT_TEST2", Seconds = 5, UpdateInterval = 10},
	},
	Actions = {
		--SetInfoText{String = "" , Tag = "" , Color = ColorRed , ClearAfterSpeech = TRUE},
		SetInfoText{String = "weisser text" , Tag = "" , Color = ColorWhite , ClearAfterSpeech = TRUE},
		SetInfoText{String = "jetzt müsste eine acid cloud erscheinen! tut sie das???" , Tag = "" , Color = ColorYellow , ClearAfterSpeech = FALSE},
	},
}
]]

local cond = CGdsIsNpcSelected:new(Avatar)
cond:SetUpdateInterval(1)
OnOneTimeEvent
{
	Conditions = {
		cond,
		Negated(CGdsIsInfoTextActive:new()),
	},
	Actions = {
		SetInfoText{String = "juhuuuu, es ist passiert!" , Tag = "" , Color = ColorWhite , ClearAfterSpeech = TRUE},
		--SetEffect{Effect = "AcidCloud", Length = 16000, X = 25, Y = 15},
	},
}

REM = [[
OnOneTimeEvent
{
	Conditions = {
		IsGlobalTimeElapsed{Name = "EFFEKT_TEST2", Seconds = 25, UpdateInterval = 10},
	},
	Actions = {
		SetInfoText{String = "weissserrrr text 2" , Tag = "" , Color = ColorWhite , ClearAfterSpeech = TRUE},
		SetInfoText{String = "weissserrrr text 3" , Tag = "" , Color = ColorWhite , ClearAfterSpeech = TRUE},
		SetInfoText{String = "gelberrrrr text 2" , Tag = "" , Color = ColorYellow , ClearAfterSpeech = FALSE},
	},
}

OnOneTimeEvent
{
	Conditions = {
		IsGlobalTimeElapsed{Name = "EFFEKT_TEST2", Seconds = 45, UpdateInterval = 10},
	},
	Actions = {
		SetEffect{Effect = "BuildingFire", Length = 16000, NpcId = Avatar},
		SetInfoText{String = "" , Tag = "" , Color = ColorWhite , ClearAfterSpeech = TRUE},
	},
}
]]



DebugInitAction( SetGlobalTimeStamp{Name = "EFFEKT_TEST"} )

OnEvent
{
	Conditions = {
		IsGlobalTimeElapsed{Name = "EFFEKT_TEST", Seconds = 24, UpdateInterval = 10},
	},
	Actions = {
		SetGlobalTimeStamp{Name = "EFFEKT_TEST"},
		
		-- hier der effekt
		SetEffect{Effect = "IcePack", Length = 8000, NpcId = Avatar},
		--Outcry{NpcId = 3352, Tag = "", String = "Brrrrr, ist das kalt hier ..." , Color = ColorRed},
		Outcry{ Tag = "outcryBahirShiel001"      , NpcId = 3352, String = "Männer, seht doch! Einar ist zurück! Wird auch Zeit, dass Ihr Euch hier einfindet, Sergeant!", Color = ColorWhite },
	},
}

DebugInitAction( TransferXP{XP = 2222, Flag = Give} )
REM = [[
OnOneTimeEvent
{
	Conditions = {
		Negated(CGdsAdvancementLookUp:new(0, 0, 0))
	},
	Actions = {
		--ShowDebugText{Tag = "DEBUG", String = "DU HAST JETZT KEINE STAT PUNKTE MEHR !!!", Color = ColorRed},
		Outcry{NpcId = 3352, Tag = "", String = "Kein schöner Stat ..." , Color = ColorRed},
	},
}
OnOneTimeEvent
{
	Conditions = {
		Negated(CGdsAdvancementLookUp:new(0, 0, 1))
	},
	Actions = {
		--ShowDebugText{Tag = "DEBUG", String = "DU HAST JETZT KEINE ABILITY PUNKTE MEHR !!!", Color = ColorRed},
		Outcry{NpcId = 3352, Tag = "", String = "Kein schöner Skill ..." , Color = ColorRed},
	},
}
]]
DebugInitAction( TransferItem{GiveItem = 3211, Flag = Give} )
OnOneTimeEvent
{
	Conditions = {
		CGdsIsMeleeAbilityActive:new(152)
	},
	Actions = {
		ShowDebugText{Tag = "DEBUG", String = "DU BIST JETZT EIN BERSERKER, MUAAAAAHHHHRRRRRrrrr !!!", Color = ColorRed},
		Outcry{NpcId = 3352, Tag = "", String = "Kein schöner Anblick ..." , Color = ColorRed},
	},
}


DebugInitAction( TransferItem{GiveItem = 3178, Flag = Give} )
REM = [[
DebugInitAction( TransferItem{GiveItem = 1984, Flag = Give} )
DebugInitAction( SetGlobalTimeStamp{Name = "TEST"} )
OnOneTimeEvent
{
	Conditions = {
		IsGlobalTimeElapsed{Name = "TEST", Seconds = 30},
	},
	Actions = {
		TransferItem{TakeItem = 1984, Flag = Take},
		--ShowDebugText{Tag = "DEBUG", String = "Dir wurde ein Gegenstand genommen.", Color = ColorPurple},
	},
}
OnOneTimeEvent
{
	Conditions = {
		IsGlobalTimeElapsed{Name = "TEST", Seconds = 6},
		
		-- im inventory, equipment? FUNZT!
		Negated(CGdsIsInventoryOpen:new(8)),
		
		-- testen... berserk
		--CGdsIsMeleeAbilityActive:new(3211), --item id
		--CGdsIsMeleeAbilityActive:new(1588),	-- spell id

		-- spell memorized?
		--CGdsIsSpellMemorized:new(1973),	-- scroll 1984
		--CGdsIsSpellMemorized:new(3211), -- berserk
	},
	Actions = {
		PlaceObject{X = 15, Y = 10, Object = 1923},
		PlaceObject{X = 15, Y = 8, Object = 1923},
		PlaceObject{X = 14, Y = 7, Object = 1923},
		PlaceObject{X = 12, Y = 8, Object = 1923},
		
--		ShowDebugText{Tag = "DEBUG", String = "DIES IST der Darzustellende Text", Color = ColorWhite, ClearAfterSpeech = FALSE},
		Outcry{NpcId = 3352, Tag = "", String = "HURRAAAAAA!!!" , Color = ColorRed},
		
		-- 5% player health
		CGdsFigureSetHealth:new(0, 25),
		CGdsFigureSetHealth:new(3072, 5),
	},
}




OnOneTimeEvent
{
	Conditions = {
	},
	Actions = {
		SetDialogType{Type = SideQuest}, 
		Spawn{X = _X, Y = _Y, UnitId = 190},
	},
}

OnOneTimeEvent
{
	Conditions = {
		FigureHasHealth{Percent = 95 , NpcId = 3352},
	},
	Actions = {
		SetEffect{Effect = "AcidCloud", Length = 16666},
		PlaceObject{X = 20, Y = 10, Object = 2130},
	},
}

OnOneTimeEvent
{
	Conditions = {
		PlayerUnitExists{Amount = 1, UnitId = 543},
	},
	Actions = {
		PlaceObject{X = 15, Y = 35, Object = 2130},
		PlaceObject{X = 17, Y = 35, Object = 2130},
		PlaceObject{X = 16, Y = 33, Object = 2130},
		PlaceObject{X = 10, Y = 30, Object = 1922},
		SetEffect{Effect = "AcidCloud", Length = 16666, NpcId = Avatar},
	},
}

OnOneTimeEvent
{
	Conditions = {
		PlayerUnitExists{Amount = 1, UnitId = 544},
	},
	Actions = {
		PlaceObject{X = 10, Y = 30, Object = 1922},
		SetEffect{Effect = "Fog", Length = 16666, NpcId = Avatar},
	},
}

OnOneTimeEvent
{
	Conditions = {
		PlayerBuildingExists{BuildingId = 4, OnlyWhenBuiltUp = FALSE, UpdateInterval = 5},		-- Holzfäller
	},
	Actions = {
		PlaceObject{X = 10, Y = 25, Object = 1923},
		Spawn{X = 15, Y = 35, UnitId = 190},
		Spawn{X = 15, Y = 35, UnitId = 190},
		Spawn{X = 15, Y = 35, UnitId = 190},
		Spawn{X = 15, Y = 35, UnitId = 190},
		Spawn{X = 15, Y = 35, UnitId = 190},
		Spawn{X = 15, Y = 35, UnitId = 190},
		Outcry{NpcId = 3352, String = "ARR! Du .... !" , Color = ColorRed},
	},
}
]]

REM = [[
OnOneTimeEvent
{
	Conditions = {
		AvatarSkill{Skill = Feuer, Level = 10},
	},
	Actions = {
		PlaceObject{X = 20, Y = 20, Object = 1922},
	},
}

OnOneTimeEvent
{
	Conditions = {
		AvatarStat{Stat = Str, Value = 30},
	},
	Actions = {
		PlaceObject{X = 25, Y = 20, Object = 1923},
	},
}
]]

OnOneTimeEvent
{
	Conditions = {
	},
	Actions = {
		SetDialogType{Type = SideQuest},
	},
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.0
-- Source: C:\project\main\mission\dialoge\p2\n3034_gate.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{String = "Ich bin verschlossen."},
			Answer{String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			PlayerHasItem{ItemId = 3178},
		},
		Actions = {
			Say{String = ""},
			OfferAnswer{String = "Waaaaaaaaaas????", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3178}),
		},
		Actions = {
			Say{String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{String = "Das passt, das Tor öffnet sich."},
			Answer{String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetDialogType{Type = MainQuest}, 
			Say{String = "nicht wundern..."},
			Answer{String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{String = ""},
		}}


EndDefinition()
end
