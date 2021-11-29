-->INFO: Seele3
--Seele 3 healer

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

------------------------------------

Respawn
{
	WaitTime = 3, UnitId = self, Clan = 0, Target = Avatar, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse{Name = "g_P202_Seele3Erloest", UpdateInterval = 20}
	},
	Actions = 
	{
		ChangeFigureOwner{NpcId = self},
		ChangeRace {Race = 185, NpcId = self},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9984"}
	},
	DeathActions = { }

}

-- heal spell 266 kostet 33 mana
-- wenn zu wenig mana, neu nach gewisser zeit
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
		IsNpcFlagFalse {Name = "P202SeelenManaFlag", UpdateInterval = 5},
		FigureHasMana {Percent = 25, NpcId = self, UpdateInterval = 30}
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
		IsNpcTimeElapsed {Name = "P202SeelenManaTimer", Seconds = 30},
		FigureHasMana {Percent = 25, NpcId = self, UpdateInterval = 30}
	},
	Actions = 
	{
		SetMana {Mana = 110, NpcId = self, Decrease = FALSE},
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
	 	ChangeFigureOwner {NpcId = self},
	 	RevealUnExplored {X = 474, Y = 302, Range = 3},
		RevealUnExplored {X = 474, Y = 310, Range = 3}
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
		QuestBegin {QuestId = 931, SubQuestActivate = FALSE}
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
		Outcry {NpcId = 9984, String = "Endlich finde ich Frieden!" , Tag = "oca2kindsoulP202_001" , Delay = TRUE , Color = ColorWhite},
		Goto{X = 472, Y = 306, NpcId = self, Range = 0, WalkMode = Run, GotoMode = GotoForced, XRand = 0, YRand = 0},
		SetNpcFlagTrue {Name = "P202SeeleZumGrab"}
	}
}

OnIdleGoHome
{
	X = 472, Y = 306, Direction = 2, Range = 0, WalkRange = 1, WaitTime = 0, WalkMode = Run, GotoMode = GotoNormal,
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
	UnitId = 2524, Clan = 0, X = 472, Y = 306, Target = none, NoSpawnEffect = TRUE, OnlyOnce = TRUE, PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsNpcFlagFalse{Name = "P202SeeleChangeUnit"},
		FigureInRange {X = 472, Y = 306, NpcId = self, Range = 0},
	},
	Actions = 
	{
		--SetEffect {Effect = "OccludeBlack", Length = 1000, TargetType = Figure, NpcId = self}, 
		SetNpcFlagTrue{Name = "P202SeeleChangeUnit"},
			SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9984"}
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
		SetGlobalFlagTrue{Name = "g_P202_Seele3Erloest"},
		QuestSolve {QuestId = 931, ActivateNextQuest = FALSE},
		SetRewardFlagTrue { Name = "Seelenwesen3"}
	}
}
---------------------------------------------------------------------
----Wenn nicht wie versprochen zum Grab
--OnOneTimeEvent
--{
--	NotInDialog = FALSE, UpdateInterval = 20,
--	Conditions = 
--	{
--		
--	},
--	Actions = 
--	{
--		Outcry {NpcId = 9984, String = "Ihr habt mich irregeführt! Nun empfangt meinen Zorn!" , Tag = "oca2kindsoulP202_004" , Delay = TRUE , Color = ColorWhite},
--	}
--}






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P202\n9984_Seele3.txt


	

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
			Say{Tag = "kind_soulP202_001", String = "Setzt mich frei!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagTrue {Name = "P202DieseSeelebekannt", UpdateInterval= 20}),
		},
		Actions = {
			Say{Tag = "kind_soulP202_002", String = "Schenkt Gnade, Abenteurer!"},
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
			OfferAnswer{Tag = "kind_soulP202_005PC", String = "Begleitet mich, ich helfe Euch!", AnswerId = 7},
			OfferAnswer{Tag = "kind_soulP202_007PC", String = "Was muß ich tun, um Euch zu erlösen?", AnswerId = 9},
			OfferAnswer{Tag = "kind_soulP202_012PC", String = "Ich mache keinen Handel mit den Toten!", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P202SpielerHilftSeelen"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kind_soulP202_007PC", String = "Was muß ich tun, um Euch zu erlösen?", AnswerId = 9},
			OfferAnswer{Tag = "kind_soulP202_012PC", String = "Ich mache keinen Handel mit den Toten!", AnswerId = 14},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kind_soulP202_003", String = "Dunkle Magie bindet mich an diesen Ort und ich vermag die Bande nicht zu brechen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kind_soulP202_004", String = "Steht mir bei und ich will meine Kraft in Eure Dienste stellen."},
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
			OfferAnswer{Tag = "kind_soulP202_005PC", String = "Begleitet mich, ich helfe Euch!", AnswerId = 7},
			OfferAnswer{Tag = "kind_soulP202_007PC", String = "Was muß ich tun, um Euch zu erlösen?", AnswerId = 9},
			OfferAnswer{Tag = "kind_soulP202_012PC", String = "Ich mache keinen Handel mit den Toten!", AnswerId = 14},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P202SpielerHilftSeelen"}),
		},
		Actions = {
			SetNpcFlagTrue {Name = "P202DieseSeelebekannt"},
			SetGlobalFlagTrue {Name = "g_P202SeelenGesamtQuestBeginnt"} ,
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kind_soulP202_007PC", String = "Was muß ich tun, um Euch zu erlösen?", AnswerId = 9},
			OfferAnswer{Tag = "kind_soulP202_012PC", String = "Ich mache keinen Handel mit den Toten!", AnswerId = 14},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kind_soulP202_006", String = "Ich werde an Eurer Seite bleiben."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P202SpielerHilftSeelen"},
			SetNpcFlagTrue {Name = "P202SeeleFolgt"},
			SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9984"} ,
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
			Say{Tag = "kind_soulP202_008", String = "Bringt meine Seele zu dem Grabmal, das meine guten Kameraden für mich errichtet haben. Weit im Osten, dort wo ich damals der Finsternis erlag."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kind_soulP202_009", String = "Aber passt auf! Der Fial Darg wird versuche, uns daran hindern! Ihr werdet ihm gegenüber treten müssen!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kind_soulP202_010", String = "Ich werde Euch meine heilenden Kräfte zur Verfügung stellen, bis wir meine Ruhestatt erreicht haben."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kind_soulP202_011", String = "Bitte, Freund, gewährt einer verlorenen Seele diese Gnade."},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P202SpielerHilftSeelen"},
			SetNpcFlagTrue {Name = "P202SeeleFolgt"},
			SetGlobalFlagTrue {Name = "PleaseRemoveDialog_9984"} ,
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