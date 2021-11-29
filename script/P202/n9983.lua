-->INFO: Seele2
--Seele 2 melee

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

------------------------------------
Respawn
{
	WaitTime = 3, UnitId = self, Clan = 0, Target = Avatar, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse{Name = "g_P202_Seele2Erloest", UpdateInterval = 20}
	},
	Actions = 
	{
		ChangeFigureOwner{NpcId = self},
		ChangeRace {Race = 185, NpcId = self},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9983"}
	},
	DeathActions = { }

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


--wenn zu wenig mana, neu
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
		FigureHasMana {Percent = 50, NpcId = self, UpdateInterval = 30}
	},
	Actions = 
	{
		SetMana {Mana = 18, NpcId = self, Decrease = FALSE}
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
		QuestBegin {QuestId = 930, SubQuestActivate = FALSE},
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
		Outcry {NpcId = 9983, String = "Ich bin frei!" , Tag = "oca2strongsoulP202_001" , Delay = TRUE , Color = ColorWhite},
		Goto{X = 472, Y = 302, NpcId = self, Range = 0, WalkMode = Run, GotoMode = GotoForced, XRand = 0, YRand = 0},
		SetNpcFlagTrue {Name = "P202SeeleZumGrab"}
	}
}

OnIdleGoHome
{
	X = 472, Y = 302, Direction = 2, Range = 0, WalkRange = 1, WaitTime = 0, WalkMode = Run, GotoMode = GotoNormal,
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
	UnitId = 2523, Clan = 0, X = 472, Y = 302, Target = none, NoSpawnEffect = TRUE, OnlyOnce = TRUE, PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsNpcFlagFalse{Name = "P202SeeleChangeUnit"},
		FigureInRange {X = 472, Y = 302, NpcId = self, Range = 0},
	},
	Actions = 
	{
		--SetEffect {Effect = "OccludeBlack", Length = 1000, TargetType = Figure, NpcId = self}, 
		SetNpcFlagTrue{Name = "P202SeeleChangeUnit"},
			SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9983"}
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
		SetGlobalFlagTrue{Name = "g_P202_Seele2Erloest"},
		QuestSolve {QuestId = 930, ActivateNextQuest = FALSE},
		SetRewardFlagTrue { Name = "Seelenwesen2"}
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P202\n9983_Seele2.txt


	

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
			Say{Tag = "strong_soulP202_001", String = "Setzt mich frei!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagTrue {Name = "P202DieseSeelebekannt", UpdateInterval= 20}),
		},
		Actions = {
			Say{Tag = "strong_soulP202_002", String = "Kamerad, steht mir zur Seite!"},
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
			OfferAnswer{Tag = "strong_soulP202_005PC", String = "Begleitet mich, ich helfe Euch!", AnswerId = 7},
			OfferAnswer{Tag = "strong_soulP202_007PC", String = "Was muß ich tun, um Euch zu erlösen?", AnswerId = 9},
			OfferAnswer{Tag = "strong_soulP202_012PC", String = "Ich mache keinen Handel mit den Toten!", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P202SpielerHilftSeelen"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "strong_soulP202_007PC", String = "Was muß ich tun, um Euch zu erlösen?", AnswerId = 9},
			OfferAnswer{Tag = "strong_soulP202_012PC", String = "Ich mache keinen Handel mit den Toten!", AnswerId = 14},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "strong_soulP202_003", String = "Ein Fluch bindet mich an diese Stadt! Ihr könnt mich erlösen, wenn Ihr mir heflt!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "strong_soulP202_004", String = "Tut es und ich werde Euch mit meiner Kraft beistehen!"},
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
			OfferAnswer{Tag = "strong_soulP202_005PC", String = "Begleitet mich, ich helfe Euch!", AnswerId = 7},
			OfferAnswer{Tag = "strong_soulP202_007PC", String = "Was muß ich tun, um Euch zu erlösen?", AnswerId = 9},
			OfferAnswer{Tag = "strong_soulP202_012PC", String = "Ich mache keinen Handel mit den Toten!", AnswerId = 14},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P202SpielerHilftSeelen"}),
		},
		Actions = {
			SetNpcFlagTrue {Name = "P202DieseSeelebekannt"},
			SetGlobalFlagTrue {Name = "g_P202SeelenGesamtQuestBeginnt"} ,
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "strong_soulP202_007PC", String = "Was muß ich tun, um Euch zu erlösen?", AnswerId = 9},
			OfferAnswer{Tag = "strong_soulP202_012PC", String = "Ich mache keinen Handel mit den Toten!", AnswerId = 14},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "strong_soulP202_006", String = "Seid bedankt! Ich folge Euch, Freund!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P202SpielerHilftSeelen"},
			SetNpcFlagTrue {Name = "P202SeeleFolgt"},
			SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9983"} ,
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
			Say{Tag = "strong_soulP202_008", String = "Ich kam als Söldner hierher aber ich habe versagt und  fiel unter den Klauen der Monster! Mein Leichnam liegt im Osten verscharrt."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "strong_soulP202_009", String = "Doch dieser verhasste der Fial Darg, zerrte meine Seele empor und zwingt mich nun hier umher zu streifen! Ruhelos und voller Hass!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "strong_soulP202_010", String = "Lasst uns gemeinsam den Fial Darg erschlagen! Ich will Euch solange mit meinen Schwertarm beistehen, bis Ihr mich zu meiner alten Ruhestätte gebracht habt!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "strong_soulP202_011", String = "Erlöst mich aus diesem erbärmlichen Schicksal, auf dass ich mit Ehre von dieser Welt gehen kann! Es soll Euer Schaden nicht sein"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P202SpielerHilftSeelen"},
			SetNpcFlagTrue {Name = "P202SeeleFolgt"},
			SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9983"} ,
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