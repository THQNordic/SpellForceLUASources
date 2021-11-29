-->INFO: Windjalf
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
-- Windjalf
--!EDS ONIDLEGOHOME BEGIN

OnIdleGoHome
{
	WalkMode = Run, X = 391, Y = 216, Direction = 2,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "WindjalfFolgt"},
		IsGlobalCounter {Name = "WindjalfZaehler", Value = 0, Operator = IsEqual},
	},
	HomeActions =
	{
		SetGlobalFlagTrue {Name = "ToeteWerwoelfe"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "ToeteWerwoelfe"},
		ODER(ODER(ODER(FigureAlive {NpcId = 6373}, FigureAlive {NpcId = 6374}),FigureAlive {NpcId = 6375}), FigureAlive {NpcId = 6376}),
	},
	Actions =
	{
		Outcry{Tag = "ocWindjalfP008_001", NpcId = 6304, String = "Da! Wolfsmenschen versperren den Weg! Erschlagt sie, Runenknecht! Sonst können wir nicht weiter!", Color = ColorWhite},		
	}
	
}

OnOneTimeEvent 
{
	Conditions = 
	{
		FigureDead {NpcId = 6373},
		FigureDead {NpcId = 6374},
		FigureDead {NpcId = 6375},
		FigureDead {NpcId = 6376},
		IsGlobalFlagTrue {Name = "ToeteWerwoelfe"}, 
	}, 
	Actions =
	{
		IncreaseGlobalCounter {Name = "WindjalfZaehler"},
	}
}



OnIdleGoHome
{
	WalkMode = Run, X = 318, Y = 248, Direction = 2,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "WindjalfFolgt"},
		IsGlobalCounter {Name = "WindjalfZaehler", Value = 1, Operator = IsEqual},
	},
	HomeActions =
	{
		SetGlobalFlagTrue {Name = "ToeteWerwoelfe1"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "ToeteWerwoelfe1"},
		ODER(ODER(ODER(FigureAlive {NpcId = 6363}, FigureAlive {NpcId = 6364}),FigureAlive {NpcId = 6365}), FigureAlive {NpcId = 6366}),
	},
	Actions =
	{
		Outcry{Tag = "ocWindjalfP008_001", NpcId = 6304, String = "Da! Wolfsmenschen versperren den Weg! Erschlagt sie, Runenknecht! Vorher können wir nicht weiter!", Color = ColorWhite},		
	}
	
}

OnOneTimeEvent 
{
	Conditions = 
	{
		FigureDead {NpcId = 6363},
		FigureDead {NpcId = 6364},
		FigureDead {NpcId = 6365},
		FigureDead {NpcId = 6366},
		FigureDead {NpcId = 6367},
		FigureDead {NpcId = 6368},
		IsGlobalFlagTrue {Name = "ToeteWerwoelfe1"},
	}, 
	Actions =
	{
		IncreaseGlobalCounter {Name = "WindjalfZaehler"},
	}
}


OnIdleGoHome
{
	WalkMode = Run, X = 283, Y = 257, Direction = 2,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "WindjalfFolgt"},
		IsGlobalCounter {Name = "WindjalfZaehler", Value = 2, Operator = IsEqual},
	},
	HomeActions =
	{
		SetGlobalFlagTrue {Name = "ToeteWerwoelfe2"},
	}

}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "ToeteWerwoelfe2"},
		ODER(ODER(ODER(FigureAlive {NpcId = 6369}, FigureAlive {NpcId = 6370}),FigureAlive {NpcId = 6371}), FigureAlive {NpcId = 6372}),
	},
	Actions =
	{
		Outcry{Tag = "ocWindjalfP008_001", NpcId = 6304, String = "Da! Wolfsmenschen versperren den Weg! Erschlagt sie, Runenknecht! Vorher können wir nicht weiter!", Color = ColorWhite},		
	}
	
}

OnOneTimeEvent 
{
	Conditions = 
	{
		FigureDead {NpcId = 6369},
		FigureDead {NpcId = 6370},
		FigureDead {NpcId = 6371},
		FigureDead {NpcId = 6372},
		IsGlobalFlagTrue {Name = "ToeteWerwoelfe2"},

	}, 
	Actions =
	{
		IncreaseGlobalCounter {Name = "WindjalfZaehler"},
	}
}

OnIdleGoHome
{
	WalkMode = Run, X = 270, Y = 316, Direction = 2,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "WindjalfFolgt"},
		IsGlobalCounter {Name = "WindjalfZaehler", Value = 3, Operator = IsEqual},
	},
	HomeActions =
	{
		IncreaseGlobalCounter {Name = "WindjalfZaehler"},
	}

}

OnOneTimeEvent
{
	Conditions=
	{
		FigureInRange {NpcId = _NpcId, X = 162, Y = 359, Range = 10},
	},
	Actions =
	{
		Outcry {Tag = "ocRodeP008_004", NpcId = 6758, String = "Windjalf ist zurück! Der Runenkrieger hat Windjalf gerettet!", Color = ColorWhite}, 
	}
}

OnIdleGoHome
{
	WalkMode = Run, X = 143, Y = 377, Direction = 2,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "WindjalfFolgt"},
		IsGlobalCounter {Name = "WindjalfZaehler", Value = 4, Operator = IsEqual},
	},
	HomeActions =
	{
		SetGlobalFlagTrue {Name = "WindjalfZuHause"},
		SetGlobalFlagFalse {Name = "WindjalfFolgt"},
		QuestSolve {QuestId = 612},
		SetRewardFlagTrue {Name = "RueckkehrMitWindjalf"},
		QuestBegin {QuestId = 613},
		SetGlobalTimeStamp {Name = "Windjalf"},
		EnableDialog {},
	}
}
--!EDS ONIDLEGOHOME END
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "SilberPanzer"},
	},
	Actions =
	{
		QuestSolve {QuestId = 613},
		QuestBegin {QuestId = 687},
		SetItemFlagTrue {Name = "GibSilberPanzerZauber"},
		TransferItem {GiveItem = 4145},
	}
}



Respawn
{
	X = _X, Y = _Y, WaitTime =1,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "WindjalfBefreitP108"},
		IsNpcFlagFalse {Name = "OneTimer"},
	},
	Actions = 
	{
		QuestSolve {QuestId = 611},
		QuestBegin {QuestId = 612},
		SetNpcFlagFalse {Name = "OneTimer"},
	},
}


SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "CutsceneInitHerstellungEntry", UpdateInterval = 15},
	},
	Actions = 
	{
		SetNoFightFlagTrue {NpcId = self},
	},
}


Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "CutsceneHerstellungEntryOver"},
	},
	Actions = 
	{
		SetNoFightFlagFalse {NpcId = self},
		SetGlobalFlagFalse {Name = "CutsceneHerstellungEntryOver"},
	}
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P108\n6304_Windjalf.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "Known"},
		},
		Actions = {
			Say{Tag = "windjalf108_001", String = "Ein Mensch? Nein ... mehr als das! Oder soll ich sagen ... weniger?"},
			Answer{Tag = "windjalf108_002PC", String = "Sagt einfach danke.", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsGlobalFlagFalse {Name = "WindjalfFolgt"}, IsGlobalFlagFalse {Name = "SchonGeredet"}),
			UND(IsGlobalFlagTrue {Name = "WindjalfZuHause"}, IsGlobalFlagFalse {Name = "WindjalfFolgt"}),
		},
		Actions = {
			Say{Tag = "windjalf108_004", String = "Was wollt Ihr?"},
			OfferAnswer{Tag = "windjalf108_005PC", String = "Kehrt heim, Ihr seid frei.", AnswerId = 2},
			OfferAnswer{Tag = "windjalf108_011PC", String = "Nun Windjalf, da Ihr in Sicherheit seid ...", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(IsGlobalFlagFalse {Name = "WindjalfFolgt"}, IsGlobalFlagFalse {Name = "SchonGeredet"}),
			Negated(UND(IsGlobalFlagTrue {Name = "WindjalfZuHause"}, IsGlobalFlagFalse {Name = "WindjalfFolgt"})),
		},
		Actions = {
			Say{Tag = "windjalf108_004", String = "Was wollt Ihr?"},
			OfferAnswer{Tag = "windjalf108_005PC", String = "Kehrt heim, Ihr seid frei.", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsGlobalFlagFalse {Name = "WindjalfFolgt"}, IsGlobalFlagFalse {Name = "SchonGeredet"})),
			UND(IsGlobalFlagTrue {Name = "WindjalfZuHause"}, IsGlobalFlagFalse {Name = "WindjalfFolgt"}),
		},
		Actions = {
			Say{Tag = "windjalf108_004", String = "Was wollt Ihr?"},
			OfferAnswer{Tag = "windjalf108_011PC", String = "Nun Windjalf, da Ihr in Sicherheit seid ...", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(IsGlobalFlagFalse {Name = "WindjalfFolgt"}, IsGlobalFlagFalse {Name = "SchonGeredet"})),
			Negated(UND(IsGlobalFlagTrue {Name = "WindjalfZuHause"}, IsGlobalFlagFalse {Name = "WindjalfFolgt"})),
		},
		Actions = {
			Say{Tag = "windjalf108_004", String = "Was wollt Ihr?"},
		}}

	OnAnswer{1;
		Conditions = {
			UND(IsGlobalFlagFalse {Name = "WindjalfFolgt"}, IsGlobalFlagFalse {Name = "SchonGeredet"}),
			UND(IsGlobalFlagTrue {Name = "WindjalfZuHause"}, IsGlobalFlagFalse {Name = "WindjalfFolgt"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "windjalf108_003", String = "Ha! Lieber sterbe ich in diesem Loch!"},
			OfferAnswer{Tag = "windjalf108_005PC", String = "Kehrt heim, Ihr seid frei.", AnswerId = 2},
			OfferAnswer{Tag = "windjalf108_011PC", String = "Nun Windjalf, da Ihr in Sicherheit seid ...", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			UND(IsGlobalFlagFalse {Name = "WindjalfFolgt"}, IsGlobalFlagFalse {Name = "SchonGeredet"}),
			Negated(UND(IsGlobalFlagTrue {Name = "WindjalfZuHause"}, IsGlobalFlagFalse {Name = "WindjalfFolgt"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "windjalf108_003", String = "Ha! Lieber sterbe ich in diesem Loch!"},
			OfferAnswer{Tag = "windjalf108_005PC", String = "Kehrt heim, Ihr seid frei.", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse {Name = "WindjalfFolgt"}, IsGlobalFlagFalse {Name = "SchonGeredet"})),
			UND(IsGlobalFlagTrue {Name = "WindjalfZuHause"}, IsGlobalFlagFalse {Name = "WindjalfFolgt"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "windjalf108_003", String = "Ha! Lieber sterbe ich in diesem Loch!"},
			OfferAnswer{Tag = "windjalf108_011PC", String = "Nun Windjalf, da Ihr in Sicherheit seid ...", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(IsGlobalFlagFalse {Name = "WindjalfFolgt"}, IsGlobalFlagFalse {Name = "SchonGeredet"})),
			Negated(UND(IsGlobalFlagTrue {Name = "WindjalfZuHause"}, IsGlobalFlagFalse {Name = "WindjalfFolgt"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "windjalf108_003", String = "Ha! Lieber sterbe ich in diesem Loch!"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "windjalf108_006", String = "Ich werde von einer widernatürlichen Kreatur gefangen, um von der nächsten befreit zu werden!"},
			Answer{Tag = "windjalf108_007PC", String = "Hütet Eure Zunge, Zwerg. Ich bin nicht gekommen, um mich beleidigen zu lassen!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "windjalf108_008", String = "Verzeiht meine Worte. Aber mein Leben interessiert Euch doch gar nicht, es geht nur um mein Wissen!"},
			Answer{Tag = "windjalf108_009PC", String = "Sei es, wie es will. Wir müssen zurück in die Stadt. Da können wir reden!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "windjalf108_010", String = "Dann lasst uns gehen. Aber seid gewarnt, wenn nun die Untoten geschlagen sind, werden die Wolfsmenschen wieder aus ihren Löchern hervorkommen, um das Schlachtfeld zu plündern!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "WindjalfFolgt"}, SetGlobalFlagTrue {Name = "SchonGeredet"}, RemoveDialog{},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "windjalf108_012", String = "... tritt Euer wahres Anliegen zu Tage!"},
			Answer{Tag = "windjalf108_013PC", String = "Der Feuerbann.", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "windjalf108_013", String = "Der Feuerbann! Wenn ich lieber sterbe und meine Brüder in Gefahr bringe, um das Geheimnis vor einem alten Eisriesen zu bewahren, warum sollte ich es dann einem Runenkrieger offenbaren?"},
			Answer{Tag = "windjalf108_014PC", String = "Weil Ihr sonst weitaus größeres Unheil damit anrichtet, alter Mann! Erspart mir Eure Zänkereien!", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "windjalf108_015", String = "Stünde nicht Blutschuld zwischen uns, ich würde Euch erschlagen, wo Ihr steht! Euresgleichen war es doch ..."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "windjalf108_016", String = "Aber gut. Ich verdanke Euch mein Leben und wohl auch das meiner Brüder. Er gehört Euch, nehmt den Feuerbann und mit ihm das geheime Wissen meiner Ahnen."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "windjalf108_017", String = "Mögen die Götter geben, dass Euer Weg gerecht ist. Lebt wohl, Runendiener."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "SilberPanzer"}, RemoveDialog{},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end