-->INFO: GeorgeAusDemDschungel
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

 
-- Wenn die Mumiencamps platt sind und eine gewisse Zeit abgelaufen (wegen Camp vor Gegner platt) ist 
--geht der George nach Hause und haelt die Klappe
OnIdleGoHome
{
	X = _X, Y = _Y,
	WalkMode = Walk, 
	Conditions =
	{
		IsNpcFlagTrue {Name = "n_P213_GerogeGehtHeim"}
	},
}

OnOneTimeEvent
{
	
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P213_MumienKaputt", Seconds = 300},
		IsNpcFlagFalse {Name = "n_P213_GerogeGehtHeim"},
		IsGlobalFlagTrue {Name = "DschungelWeisenDialog"},
	},
	Actions =
	{
		StopFollow {Target = 0},
		SetNpcFlagTrue {Name = "n_P213_GerogeGehtHeim"},
		Outcry {Tag = "oca2wiseP213_001", NpcId = 10983, String = "Ihr braucht meine Hilfe nicht mehr, ich kehre heim! Viel Glück!", Color = ColorWhite}, 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_10983"}
	}
}

-- Da der Weise wegen des Heilens nicht unsterblich sein darf (dann hat er keine Freunde)
-- Hitpoints 2860
OnEvent 
{
	Conditions =
	{
		IsNpcFlagFalse {Name = "n_P213_GerogeGehtHeim"},
		FigureHasHealth {Percent = 20, UpdateInterval = 2}
	},
	Actions =
	{
		SetHealth {HitPoints = 2100},
	}
}

-- Stirbt der Heiler ausversehen doch kommt er wieder
-- war der Follow an wird er auch wieder an gemacht
Respawn
{
	X = _X, Y = _Y,
	WaitTime = 1,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "n_P213HeilerFolgen"},
	},
	Actions =
	{
		Follow {Target = Avatar},
		Outcry {Tag = "oca2wiseP213_002", NpcId = 10983, String = "Meine Magie hat mich gerettet! Ich bin wieder bereit!"},
	}
}

-- war der Follow aus bleibt er aus
Respawn
{
	X = _X, Y = _Y,
	WaitTime = 1,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "n_P213HeilerFolgen"},
	},
	Actions =
	{
		Outcry {Tag = "oca2wiseP213_002", NpcId = 10983, String = "Meine Magie hat mich gerettet! Ich bin wieder bereit!"},
	}
}



--OnToggleEvent
--{
--	OnConditions =
--	{
--			IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}
--	},
--	OnActions =
--	{
--		Follow {Target = Avatar},
--	},
--	OffConditions =
--	{
--		IsNpcFlagFalse {Name = "n_P213HeilerFolgen"},	
--	},
--	OffActions =
--	{
--		StopFollow {Target = Avatar},
--	}
--	
--}
--

-- Der Heiler folgt nur bis zu den Toren
-- muss aber danach wieder auf Follow zu setzen sein und kriegt deshalb noch Goto aus 
-- dem Range raus und setzt die Var zurück
OnEvent
{
	Conditions =
	{
		FigureInRange {X = 221, Y = 429, Range = 12, UpdateInterval = 2},
		IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}
	},
	Actions =
	{
		Outcry { NpcId = 10983, Tag = "oca2wiseP213_003", String = "Weiter kann ich Euch nicht folgen! Ab hier seid Ihr auf Euch allein gestellt!", Color = ColorWhite},
		SetNpcFlagFalse {Name = "n_P213HeilerFolgen"}, 
		Stop {},
		StopFollow {Target = Avatar},
		Goto {X = 208, Y = 429, WalkMode = Walk},
	}
}

OnEvent
{
	Conditions =
	{
		FigureInRange {X = 201, Y = 376, Range = 12, UpdateInterval = 2},
		IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}
	},
	Actions =
	{
		Outcry { NpcId = 10983, Tag = "oca2wiseP213_003", String = "Weiter kann ich Euch nicht folgen! Ab hier seid Ihr auf Euch allein gestellt!", Color = ColorWhite},
		SetNpcFlagFalse {Name = "n_P213HeilerFolgen"}, 
		Stop {},
		StopFollow {Target = Avatar},
		Goto {X = 185, Y = 376, WalkMode = Walk},
	}
}
--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p213\n10983_GeorgeAusDemDschungel.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "known"},
		},
		Actions = {
			Say{Tag = "wiseP213_001", String = "Kehrt um! Flieht, solange Ihr es noch könnt! Dieser Ort ist nicht für Sterbliche bestimmt!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "known"}),
		},
		Actions = {
			Say{Tag = "wiseP213_004", String = "Seid wachsam!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "wiseP213_002", String = "Das Böse hier wird Euren Geist und Körper verderben ... und Ihr werdet ein Verdammter, so wie ich!"},
			Answer{Tag = "wiseP213_003PC", String = "Ein Verdammter bin ich bereits. Aber hier und heute werde ich dem ein Ende setzen!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{4;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
		}}

	OnAnswer{4;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{4;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{5;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
		}}

	OnAnswer{5;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{5;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "wiseP213_006", String = "Ich habe gelernt, mich den Gesetzen dieses Ortes zu fügen ... und meine Magie schützt mich vor den Krankheiten, die hier überall lauern!"},
			Answer{Tag = "wiseP213_007PC", String = "Werdet Ihr mir helfen?", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "wiseP213_008", String = "Ich kann Euch von Krankheiten heilen! Das könnte Euch hier sehr nützlich sein!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "wiseP213_009", String = "Sagt mir ob ich mit Euch kommen soll!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue {Name = "n_P213_Talked"}, SetRewardFlagTrue {Name = "DschungelWeisenDialog"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[6]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{12;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{12;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "wiseP213_011", String = "Gut, geht voran."},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue {Name = "n_P213HeilerFolgen"}, Follow {Target = 0},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
		}}

	OnAnswer{16;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "wiseP213_013", String = "Wie Ihr wollt! Ich warte."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse {Name = "n_P213HeilerFolgen"}, StopFollow{Target = 0},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{20;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
		}}

	OnAnswer{20;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{20;
		Conditions = {
			UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} ),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_005PC", String = "Wie könnt Ihr hier überleben?", AnswerId = 6},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_010PC", String = "Folgt mir!", AnswerId = 13},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "wiseP213_012PC", String = "Wartet hier!", AnswerId = 17},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(UND( IsNpcFlagFalse {Name = "n_P213_Talked"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[6]Abgeschaltet"} )),
			Negated(UND9{IsNpcFlagFalse {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
			Negated(UND9{IsNpcFlagTrue {Name = "n_P213HeilerFolgen"}, IsNpcFlagTrue {Name = "n_P213_Talked"}} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end