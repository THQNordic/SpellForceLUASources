-->INFO: Seele5
--Seele5 feuer

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

------------------------------------
Respawn
{
	WaitTime = 3, UnitId = self, Clan = 0, Target = Avatar, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse{Name = "g_P202_Seele5Erloest", UpdateInterval = 20}
	}, 
	Actions = 
	{
		ChangeFigureOwner{NpcId = self},
		ChangeRace {Race = 185, NpcId = self},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9986"}
	},
	DeathActions = { }

}

-- feuerspell 298 kostet 48 mana
--wenn zu wenig mana, neu nach gewisser zeit
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
		IsNpcFlagFalse {Name = "P202SeelenManaFlag", UpdateInterval = 5},
		FigureHasMana {Percent = 50, NpcId = self, UpdateInterval = 5}
	},
	Actions = 
	{
		SetNpcTimeStamp {Name = "P202SeelenManaTimer"},
		
		SetNpcFlagTrue {Name = "P202SeelenManaFlag"}
	}
}

OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
		IsNpcTimeElapsed {Name = "P202SeelenManaTimer", Seconds = 30, UpdateInterval = 5},
		--FigureHasMana {Percent = 50, NpcId = self, UpdateInterval = 30}
	},
	Actions = 
	{
		SetMana {Mana = 100, NpcId = self, Decrease = FALSE},
		ClearNpcTimeStamp {Name = "P202SeelenManaTimer"},
	
		SetNpcFlagFalse {Name = "P202SeelenManaFlag"}
	}
}


--nach Platformwechsel immer noch Change Owner
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions =
	{
		IsNpcFlagTrue {Name = "P202SeeleFolgt", UpdateInterval = 20},
		--QuestState {QuestId = 928, State = StateActive, UpdateInterval = 20}
	},
	Actions = 
	{ 
	 	ChangeRace {NpcId = self, Race = 185},
	 	ChangeFigureOwner {NpcId = self}
	}
}


--seelenevrhalten
--wenn Hilfe zugesagt, folgen
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsNpcFlagTrue {Name = "P202SeeleFolgt", UpdateInterval = 50}
	},
	Actions = 
	{
		ChangeFigureOwner{NpcId = self},
		ChangeRace {Race = 185, NpcId = self},
		QuestBegin {QuestId = 933, SubQuestActivate = FALSE},
		RevealUnExplored {X = 474, Y = 302, Range = 3},
		RevealUnExplored {X = 474, Y = 310, Range = 3}
	}
}




--seelenverhalten
--wenn in Nähe des Grabs, auf ins Grab
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		ODER9
		{
			FigureInRange {X = 474, Y = 300, NpcId = self, Range = 4},
			FigureInRange {X = 474, Y = 304, NpcId = self, Range = 4},
			FigureInRange {X = 474, Y = 308, NpcId = self, Range = 4},
			FigureInRange {X = 474, Y = 331, NpcId = self, Range = 4},
			FigureInRange {X = 474, Y = 316, NpcId = self, Range = 4},
			FigureInRange {X = 475, Y = 319, NpcId = self, Range = 3},
			FigureInRange {X = 475, Y = 294, NpcId = self, Range = 3}
		},
		FigureDead {NpcId = 9038}
	},
	Actions = 
	{
		Outcry {NpcId = 9986, String = "Es ist vorbei, endlich!" , Tag = "oca2angrysoulP202_001" , Delay = TRUE , Color = ColorWhite},
		Goto{X = 472, Y = 314, NpcId = self, Range = 0, WalkMode = Run, GotoMode = GotoForced, XRand = 0, YRand = 0},
		SetNpcFlagTrue {Name = "P202SeeleZumGrab"}
	}
}

OnIdleGoHome
{
	X = 472, Y = 314, Direction = 2, Range = 0, WalkRange = 1, WaitTime = 0, WalkMode = Run, GotoMode = GotoNormal,
	Conditions = 
	{
		IsNpcFlagTrue {Name = "P202SeeleZumGrab", UpdateInterval = 20}
	},
	Actions = {},
	HomeActions = {},
	AbortConditions = {},
	AbortActions = {},
}



--wenn eigenes grab entdeckt, change unit
Umspawn
{
	UnitId = 2526, Clan = 0, X = 472, Y = 314, Target = none, NoSpawnEffect = TRUE, OnlyOnce = TRUE, PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsNpcFlagFalse{Name = "P202SeeleChangeUnit"},
		FigureInRange {X = 472, Y = 314, NpcId = self, Range = 0},
	},
	Actions = 
	{
		--SetEffect {Effect = "OccludeBlack", Length = 1000, TargetType = Figure, NpcId = self}, 
		SetNpcFlagTrue{Name = "P202SeeleChangeUnit"},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9986"}
	}
}


--danach sterben
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 2,
	Conditions = 
	{
		IsNpcFlagTrue {Name = "P202SeeleChangeUnit", UpdateInterval = 2} 
	},
	Actions = 
	{
		Kill{NpcId = self},
		SetGlobalFlagTrue{Name = "g_P202_Seele5Erloest"},
		QuestSolve {QuestId = 933, ActivateNextQuest = FALSE},
		SetRewardFlagTrue { Name = "Seelenwesen5"}
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P202\n9986_Seele5.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagTrue {Name = "P202DieseSeelebekannt", UpdateInterval= 20},
		},
		Actions = {
			Say{Tag = "angry_soulP202_001", String = "Setzt mich frei!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagTrue {Name = "P202DieseSeelebekannt", UpdateInterval= 20}),
		},
		Actions = {
			Say{Tag = "angry_soulP202_002", String = "Ihr da! Ihr müsst mir beistehen!"},
			Answer{Tag = "", String = "", AnswerId = 4},
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
			IsGlobalFlagTrue {Name = "g_P202SpielerHilftSeelen"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "angry_soulP202_005PC", String = "Begleitet mich, ich helfe Euch!", AnswerId = 7},
			OfferAnswer{Tag = "angry_soulP202_007PC", String = "Was muß ich tun, um Euch zu erlösen?", AnswerId = 9},
			OfferAnswer{Tag = "angry_soulP202_012PC", String = "Ich mache keinen Handel mit den Toten!", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P202SpielerHilftSeelen"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "angry_soulP202_007PC", String = "Was muß ich tun, um Euch zu erlösen?", AnswerId = 9},
			OfferAnswer{Tag = "angry_soulP202_012PC", String = "Ich mache keinen Handel mit den Toten!", AnswerId = 14},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "angry_soulP202_003", String = "Ich bin hier gefangen! Befreit mich aus dieser Stadt!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "angry_soulP202_004", String = "Ihr müsst mich hier herausbringen! Gemeinsam können wir es schaffen!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P202SpielerHilftSeelen"},
		},
		Actions = {
			SetNpcFlagTrue {Name = "P202DieseSeelebekannt"},
			SetGlobalFlagTrue {Name = "g_P202SeelenGesamtQuestBeginnt"} ,
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "angry_soulP202_005PC", String = "Begleitet mich, ich helfe Euch!", AnswerId = 7},
			OfferAnswer{Tag = "angry_soulP202_007PC", String = "Was muß ich tun, um Euch zu erlösen?", AnswerId = 9},
			OfferAnswer{Tag = "angry_soulP202_012PC", String = "Ich mache keinen Handel mit den Toten!", AnswerId = 14},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P202SpielerHilftSeelen"}),
		},
		Actions = {
			SetNpcFlagTrue {Name = "P202DieseSeelebekannt"},
			SetGlobalFlagTrue {Name = "g_P202SeelenGesamtQuestBeginnt"} ,
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "angry_soulP202_007PC", String = "Was muß ich tun, um Euch zu erlösen?", AnswerId = 9},
			OfferAnswer{Tag = "angry_soulP202_012PC", String = "Ich mache keinen Handel mit den Toten!", AnswerId = 14},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "angry_soulP202_006", String = "Ich danke Euch! Lasst uns keine Zeit verlieren!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P202SpielerHilftSeelen"},
			SetNpcFlagTrue {Name = "P202SeeleFolgt"},
			SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9986"} ,
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "angry_soulP202_008", String = "Tod und Feuer! Der Fial Darg muss brennen! Vernichtet ihn! Er hat mir das angetan!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "angry_soulP202_009", String = "Er hält mich hier und lässt mich nicht heimkehren in mein Grab, fesselt meine Seele an diese Welt! Dafür will ich sein Fleisch von den Knochen schälen!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "angry_soulP202_010", String = "Helft mir dabei! Und dann bettet mich zurück in mein Grab im Osten, damit ich diese elende Welt endlich hinter mir lassen kann!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "angry_soulP202_011", String = "Lasst uns unseren Zorn vereinen! Mein Feuer gehört Euch, wenn Ihr mir nur helft!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P202SpielerHilftSeelen"},
			SetNpcFlagTrue {Name = "P202SeeleFolgt"},
			SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9986"} ,
			EndDialog(),
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse {Name = "g_P202SpielerHilftSeelen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end