-->INFO: Skerg_TorOeffner
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, 
	Y = _Y, 
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalCounter {Name = "g_p207_Avatar_Tot", Value = 2, Operator = IsGreaterOrEqual},
		IsGlobalFlagTrue {Name = "g_p207_Avatar_Im_Labyrinth"},
	},
	Actions = 
	{
		Goto {X = 89, Y = 127, NpcId = self, WalkMode = Walk}, -- Skerg	
	},
}

Despawn
{
	Conditions = 
	{
		FigureInRange {X = 87, Y = 124, NpcId = self, Range = 0}, -- Skerg wieder vor dem Spalt
		IsGlobalFlagTrue{Name = "g_p207_Quest_983_Labyrinth_geloest"},
	},
	Actions = 
	{
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_p207_Skerg_Hilf_Avatar"}
	},
	Actions =
	{
		Goto {X = 91, Y = 118, NpcId = self, GotoMode = GotoContinuous, WalkMode = Walk}, -- Skerg geht zu Hebel 1
	},
}
------------------
-- Erster Hebel --
------------------

OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {X = 91, Y = 118, NpcId = self, Range = 0}, -- Skerg steht vor Hebel 1
	},
	Actions =
	{
		SetNpcTimeStamp {Name = "t_p207_Skerg_Timer_01"},
		SetGlobalFlagTrue{Name = "g_p207_Festung_Drei_Hebel_Eins_Umgelegt"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_10966"},
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {Name = "t_p207_Skerg_Timer_01", Seconds = 6},
	},
	Actions =
	{
		Goto {X = 101, Y = 108, NpcId = self, GotoMode = GotoContinuous, WalkMode = Walk}, -- Skerg geht zu Hebel 2
	
	},
}

-------------------
-- Zweiter Hebel --
-------------------

OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {X = 101, Y = 108, NpcId = self, Range = 0}, -- Skerg steht vor Hebel 2
	},
	Actions =
	{
		SetNpcTimeStamp {Name = "t_p207_Skerg_Timer_02"},
		SetGlobalFlagTrue{Name = "g_p207_Festung_Drei_Hebel_Zwei_Umgelegt"},		
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_10967"},
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {Name = "t_p207_Skerg_Timer_02", Seconds = 6},
	},
	Actions =
	{
		Goto {X = 127, Y = 126, NpcId = self, GotoMode = GotoContinuous, WalkMode = Walk}, -- Skerg geht zu Hebel 3
	
	},
}

-------------------
-- Dritter Hebel --
-------------------

OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {X = 127, Y = 126, NpcId = self, Range = 0}, -- Skerg steht vor Hebel 3
	},
	Actions =
	{
		SetNpcTimeStamp {Name = "t_p207_Skerg_Timer_03"},
		SetGlobalFlagTrue{Name = "g_p207_Festung_Drei_Hebel_Drei_Umgelegt"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_10968"},
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {Name = "t_p207_Skerg_Timer_03", Seconds = 6},
	},
	Actions =
	{
		Goto {X = 117, Y = 148, NpcId = self, GotoMode = GotoContinuous, WalkMode = Walk}, -- Skerg geht zu Hebel 4
	
	},
}

-------------------
-- Vierter Hebel --
-------------------

OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {X = 117, Y = 148, NpcId = self, Range = 0}, -- Skerg steht vor Hebel 4
	},
	Actions =
	{
		SetNpcTimeStamp {Name = "t_p207_Skerg_Timer_04"},
		SetGlobalFlagTrue{Name = "g_p207_Festung_Drei_Hebel_Vier_Umgelegt"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_10969"},
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {Name = "t_p207_Skerg_Timer_04", Seconds = 6},
	},
	Actions =
	{
		Goto {X = 101, Y = 148, NpcId = self, GotoMode = GotoContinuous, WalkMode = Walk}, -- Skerg geht zu Hebel 5
	
	},
}

-------------------
-- Fünfter Hebel --
-------------------

OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {X = 101, Y = 148, NpcId = self, Range = 0}, -- Skerg steht vor Hebel 5
	},
	Actions =
	{
		SetNpcTimeStamp {Name = "t_p207_Skerg_Timer_05"},
		SetGlobalFlagTrue{Name = "g_p207_Festung_Drei_Hebel_Fuenf_Umgelegt"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_10970"},
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsNpcTimeElapsed {Name = "t_p207_Skerg_Timer_05", Seconds = 6},
	},
	Actions =
	{
		Goto {X = 87, Y = 124, NpcId = self, GotoMode = GotoContinuous, WalkMode = Walk}, -- Skerg geht zurück
	
	},
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P207\n10993_Skerg_TorOeffner.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "g_p207_Skerg_Dialog_Gefuehrt"},
		},
		Actions = {
			Say{Tag = "skergP207_001", String = "Glitzerding! Glitzerding!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_p207_Skerg_Dialog_Gefuehrt"}),
		},
		Actions = {
			Say{Tag = "skergP207_002", String = "Ooh! Du mächtiger Krieger bist! Du viele Glitzerdinge hast!"},
			Answer{Tag = "skergP207_003PC", String = "Ein Skerg? Hier?", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skergP207_008PC", String = "(Dem Skerg ein Goldstück geben.)", AnswerId = 7},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skergP207_004", String = "Ja! Geflohen aus große Menschenstadt! Hier verstecken viele Jahre! Sammeln alle Glitzerdinge!"},
			Answer{Tag = "skergP207_005PC", String = "Wenn Ihr hier schon so lange lebt ... kennt Ihr die Zugänge zu den Festungen im Pass?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "skergP207_006", String = "Ja! Skerg kennt Hebelrätsel! Kann Hebel richtig einstellen! Tor öffnen! Wenn Runenkrieger gibt Skerg ein schönes Glitzerding!"},
			Answer{Tag = "skergP207_007PC", String = "Ein Glitzerding? Wartet, lasst mich sehen, was ich habe ...", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_p207_Skerg_Dialog_Gefuehrt"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "skergP207_008PC", String = "(Dem Skerg ein Goldstück geben.)", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			TransferMoney {Gold = 1, Flag = Take},
			Say{Tag = "skergP207_009", String = "Oh, schön! Skerg jetzt alle Hebel richtig machen! Dann Krieger kann in Festung, ja ja!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_p207_Skerg_Hilf_Avatar"},
			RemoveDialog{},
			EndDialog(),
		}}


	EndDefinition()
end