-->INFO: Schluesselmeisterin
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN

SpawnOnlyWhen
{
	X = _X, Y = _Y, 
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "Schluessel"},
		IsGlobalFlagFalse {Name = "SpawnenDerElfenPassiert"},
	},
	Actions = 
	{
		RevealUnExplored {X = 163, Y = 252, Range = 10},

	},
}


OnIdleGoHome
{
	WalkMode = Run, X = _X, Y = _Y, Direction = 5,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "SchluesselGegeben"},
	},
	Actions =
	{
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "SchluesselGegeben"},
	},
	Actions =
	{
		Follow {Target = Avatar},
	}
}


-- Die Schlüsselmeisterin ist am Tor, jetzt soll sie wieder reden
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {X = 447, Y = 346, Range = 5},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "ZweiterSMDialog"},
		StopFollow {Target = Avatar},
	}
}

-- Wegen Respawnbarkeit der Eiselfe, muss auch der Dialog wieder kommen, so lange die sie sich wiederbelebt
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "DialogElfenGeben"},
		IsGlobalFlagFalse {Name = "SMTot"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "SMTot"}, 
		EnableDialog {},	
	}
}

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "ZweiterSMDialog"},
		IsGlobalFlagFalse {Name = "SMTot2"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "SMTot2"}, 
		EnableDialog {},	
	}
}


Despawn
{
	Conditions =
	{
		FigureDead {NpcId = Avatar},
	},
}

Respawn
{
	WaitTime = 60,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "TorAuf"},
	},
	Actions =
	{
		--Follow {Target = Avatar},
		--RemoveDialog {},
		SetGlobalFlagTrue {Name = "ReturnSchluessel"},
		EnableDialog{},
	},
	DeathActions =
	{
	}
}

--!EDS ONIDLEGOHOME END





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\P104\n5642_Schluesselmeisterin.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "SMKnown"},
		},
		Actions = {
			Say{Tag = "schluesselmeisterin104_001", String = "Wer seid Ihr? Wir haben Kampflärm gehört ... ?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "SMKnown"}),
			IsGlobalFlagTrue{Name = "Schluessel"},
			IsGlobalFlagTrue{Name = "ZweiterSMDialog"},
			UND(IsGlobalFlagTrue{Name = "ReturnSchluessel"}, IsGlobalFlagTrue{Name = "SchluesselGegeben"}),
		},
		Actions = {
			Say{Tag = "schluesselmeisterin104_002", String = "Was wünscht Ihr?"},
			OfferAnswer{Tag = "schluesselmeisterin104_003PC", String = "Jemand muss das Tor zum Berg öffnen! Schnell!", AnswerId = 2},
			OfferAnswer{Tag = "schluesselmeisterin104_009PC", String = "Öffnet das Tor, schnell!", AnswerId = 7},
			OfferAnswer{Tag = "schluesselmeisterin104_003PC", String = "Jemand muss das Tor zum Berg öffnen! Schnell!", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "SMKnown"}),
			IsGlobalFlagTrue{Name = "Schluessel"},
			IsGlobalFlagTrue{Name = "ZweiterSMDialog"},
			Negated(UND(IsGlobalFlagTrue{Name = "ReturnSchluessel"}, IsGlobalFlagTrue{Name = "SchluesselGegeben"})),
		},
		Actions = {
			Say{Tag = "schluesselmeisterin104_002", String = "Was wünscht Ihr?"},
			OfferAnswer{Tag = "schluesselmeisterin104_003PC", String = "Jemand muss das Tor zum Berg öffnen! Schnell!", AnswerId = 2},
			OfferAnswer{Tag = "schluesselmeisterin104_009PC", String = "Öffnet das Tor, schnell!", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "SMKnown"}),
			IsGlobalFlagTrue{Name = "Schluessel"},
			Negated(IsGlobalFlagTrue{Name = "ZweiterSMDialog"}),
			UND(IsGlobalFlagTrue{Name = "ReturnSchluessel"}, IsGlobalFlagTrue{Name = "SchluesselGegeben"}),
		},
		Actions = {
			Say{Tag = "schluesselmeisterin104_002", String = "Was wünscht Ihr?"},
			OfferAnswer{Tag = "schluesselmeisterin104_003PC", String = "Jemand muss das Tor zum Berg öffnen! Schnell!", AnswerId = 2},
			OfferAnswer{Tag = "schluesselmeisterin104_003PC", String = "Jemand muss das Tor zum Berg öffnen! Schnell!", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "SMKnown"}),
			IsGlobalFlagTrue{Name = "Schluessel"},
			Negated(IsGlobalFlagTrue{Name = "ZweiterSMDialog"}),
			Negated(UND(IsGlobalFlagTrue{Name = "ReturnSchluessel"}, IsGlobalFlagTrue{Name = "SchluesselGegeben"})),
		},
		Actions = {
			Say{Tag = "schluesselmeisterin104_002", String = "Was wünscht Ihr?"},
			OfferAnswer{Tag = "schluesselmeisterin104_003PC", String = "Jemand muss das Tor zum Berg öffnen! Schnell!", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "SMKnown"}),
			Negated(IsGlobalFlagTrue{Name = "Schluessel"}),
			IsGlobalFlagTrue{Name = "ZweiterSMDialog"},
			UND(IsGlobalFlagTrue{Name = "ReturnSchluessel"}, IsGlobalFlagTrue{Name = "SchluesselGegeben"}),
		},
		Actions = {
			Say{Tag = "schluesselmeisterin104_002", String = "Was wünscht Ihr?"},
			OfferAnswer{Tag = "schluesselmeisterin104_009PC", String = "Öffnet das Tor, schnell!", AnswerId = 7},
			OfferAnswer{Tag = "schluesselmeisterin104_003PC", String = "Jemand muss das Tor zum Berg öffnen! Schnell!", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "SMKnown"}),
			Negated(IsGlobalFlagTrue{Name = "Schluessel"}),
			IsGlobalFlagTrue{Name = "ZweiterSMDialog"},
			Negated(UND(IsGlobalFlagTrue{Name = "ReturnSchluessel"}, IsGlobalFlagTrue{Name = "SchluesselGegeben"})),
		},
		Actions = {
			Say{Tag = "schluesselmeisterin104_002", String = "Was wünscht Ihr?"},
			OfferAnswer{Tag = "schluesselmeisterin104_009PC", String = "Öffnet das Tor, schnell!", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "SMKnown"}),
			Negated(IsGlobalFlagTrue{Name = "Schluessel"}),
			Negated(IsGlobalFlagTrue{Name = "ZweiterSMDialog"}),
			UND(IsGlobalFlagTrue{Name = "ReturnSchluessel"}, IsGlobalFlagTrue{Name = "SchluesselGegeben"}),
		},
		Actions = {
			Say{Tag = "schluesselmeisterin104_002", String = "Was wünscht Ihr?"},
			OfferAnswer{Tag = "schluesselmeisterin104_003PC", String = "Jemand muss das Tor zum Berg öffnen! Schnell!", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "SMKnown"}),
			Negated(IsGlobalFlagTrue{Name = "Schluessel"}),
			Negated(IsGlobalFlagTrue{Name = "ZweiterSMDialog"}),
			Negated(UND(IsGlobalFlagTrue{Name = "ReturnSchluessel"}, IsGlobalFlagTrue{Name = "SchluesselGegeben"})),
		},
		Actions = {
			Say{Tag = "schluesselmeisterin104_002", String = "Was wünscht Ihr?"},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagTrue{Name = "Schluessel"},
			IsGlobalFlagTrue{Name = "ZweiterSMDialog"},
			UND(IsGlobalFlagTrue{Name = "ReturnSchluessel"}, IsGlobalFlagTrue{Name = "SchluesselGegeben"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "SMKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "schluesselmeisterin104_003PC", String = "Jemand muss das Tor zum Berg öffnen! Schnell!", AnswerId = 2},
			OfferAnswer{Tag = "schluesselmeisterin104_009PC", String = "Öffnet das Tor, schnell!", AnswerId = 7},
			OfferAnswer{Tag = "schluesselmeisterin104_003PC", String = "Jemand muss das Tor zum Berg öffnen! Schnell!", AnswerId = 10},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagTrue{Name = "Schluessel"},
			IsGlobalFlagTrue{Name = "ZweiterSMDialog"},
			Negated(UND(IsGlobalFlagTrue{Name = "ReturnSchluessel"}, IsGlobalFlagTrue{Name = "SchluesselGegeben"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "SMKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "schluesselmeisterin104_003PC", String = "Jemand muss das Tor zum Berg öffnen! Schnell!", AnswerId = 2},
			OfferAnswer{Tag = "schluesselmeisterin104_009PC", String = "Öffnet das Tor, schnell!", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagTrue{Name = "Schluessel"},
			Negated(IsGlobalFlagTrue{Name = "ZweiterSMDialog"}),
			UND(IsGlobalFlagTrue{Name = "ReturnSchluessel"}, IsGlobalFlagTrue{Name = "SchluesselGegeben"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "SMKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "schluesselmeisterin104_003PC", String = "Jemand muss das Tor zum Berg öffnen! Schnell!", AnswerId = 2},
			OfferAnswer{Tag = "schluesselmeisterin104_003PC", String = "Jemand muss das Tor zum Berg öffnen! Schnell!", AnswerId = 10},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagTrue{Name = "Schluessel"},
			Negated(IsGlobalFlagTrue{Name = "ZweiterSMDialog"}),
			Negated(UND(IsGlobalFlagTrue{Name = "ReturnSchluessel"}, IsGlobalFlagTrue{Name = "SchluesselGegeben"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "SMKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "schluesselmeisterin104_003PC", String = "Jemand muss das Tor zum Berg öffnen! Schnell!", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Schluessel"}),
			IsGlobalFlagTrue{Name = "ZweiterSMDialog"},
			UND(IsGlobalFlagTrue{Name = "ReturnSchluessel"}, IsGlobalFlagTrue{Name = "SchluesselGegeben"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "SMKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "schluesselmeisterin104_009PC", String = "Öffnet das Tor, schnell!", AnswerId = 7},
			OfferAnswer{Tag = "schluesselmeisterin104_003PC", String = "Jemand muss das Tor zum Berg öffnen! Schnell!", AnswerId = 10},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Schluessel"}),
			IsGlobalFlagTrue{Name = "ZweiterSMDialog"},
			Negated(UND(IsGlobalFlagTrue{Name = "ReturnSchluessel"}, IsGlobalFlagTrue{Name = "SchluesselGegeben"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "SMKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "schluesselmeisterin104_009PC", String = "Öffnet das Tor, schnell!", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Schluessel"}),
			Negated(IsGlobalFlagTrue{Name = "ZweiterSMDialog"}),
			UND(IsGlobalFlagTrue{Name = "ReturnSchluessel"}, IsGlobalFlagTrue{Name = "SchluesselGegeben"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "SMKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "schluesselmeisterin104_003PC", String = "Jemand muss das Tor zum Berg öffnen! Schnell!", AnswerId = 10},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Schluessel"}),
			Negated(IsGlobalFlagTrue{Name = "ZweiterSMDialog"}),
			Negated(UND(IsGlobalFlagTrue{Name = "ReturnSchluessel"}, IsGlobalFlagTrue{Name = "SchluesselGegeben"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "SMKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "schluesselmeisterin104_004", String = "Ihr erteilt hier keine Befehle, Runenknecht!"},
			Answer{Tag = "schluesselmeisterin104_005PC", String = "Wenige Meilen von hier kämpft eine Gruppe von Flüchtlingen um ihr Leben, mit dem Rücken zu Eurem vermaledeiten Tor! Die Imperialen rücken aus dem Sumpfland herauf! Und Ihr habt nichts Besseres zu tun, als mich zu beleidigen?", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "schluesselmeisterin104_006", String = "Es gibt nicht einfach einen Schlüssel für dieses Tor. Wenn es geöffnet werden soll, muss eine von uns mit Euch kommen."},
			Answer{Tag = "schluesselmeisterin104_007PC", String = "Dann kommt! Wir haben keine Zeit zu verlieren!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "schluesselmeisterin104_008", String = "Wohlan denn. Geht voran!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "SchluesselGegeben"}, SetGlobalFlagFalse{Name = "Schluessel"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse {Name = "ReturnSchluessel"},RemoveDialog{},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "schluesselmeisterin104_010", String = "So soll es sein. Viel Glück für Euch und Eure Leute."},
			Answer{Tag = "schluesselmeisterin104_011PC", String = "Ich danke Euch. Nun rasch!", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse{Name = "ZweiterSMDialog"}, SetGlobalFlagTrue {Name = "TorAuf"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse {Name = "ReturnSchluessel"},RemoveDialog{},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "schluesselmeisterin104_008", String = "Wohlan denn. Geht voran!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse {Name = "ReturnSchluessel"}, RemoveDialog{}, Follow {Target = Avatar},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end