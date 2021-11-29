-->INFO: Sidahan
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Respawn{WaitTime = 10}

--Dialogsteuerung
--Umschalter
OnToggleEvent
{
OnConditions = {
			IsNpcFlagTrue{Name = "HasMainquest"},
			},
OnActions = {
		SetDialogType{Type = MainQuest}
		},
OffConditions = {
			IsNpcFlagFalse{Name = "HasMainquest"},
			},
OffActions = {
		SetDialogType{Type = SideQuest}
		},
}
--initial
OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}
--Eloni done?
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 452 , State = StateSolved},
			},
Actions = {
		SetNpcFlagFalse{Name = "HasMainquest"},
		}
}

-- ursprüngliches home
OnIdleGoHome
{
	X = _X, Y = _Y, Direction = South,
	Conditions = {
		Negated(QuestState {QuestId = 27 , State = StateSolved}),
		IsGlobalFlagFalse{Name = "Q26SidahanGo"},
		IsGlobalFlagFalse{Name = "Q26SidahanStay"},
	},
}



-- wenn sie aus dem range kommt, stoppen
OnEvent
{
	Conditions = {
		IsGlobalFlagTrue{Name = "Q26SidahanGo", UpdateInterval = 20},
		IsGlobalFlagTrue{Name = "Q26SidahanToMonument", UpdateInterval = 20},
		Negated(FigureInRangeNpc{TargetNpcId = Avatar, Range = 16 , UpdateInterval = 20}),
	},
	Actions = {
		SetGlobalFlagFalse{Name = "Q26SidahanToMonument"},
	},
}

-- wenn sie wieder in range ist, weiterlaufen
OnEvent
{
	Conditions = {
		IsGlobalFlagTrue{Name = "Q26SidahanGo", UpdateInterval = 20},
		IsGlobalFlagFalse{Name = "Q26SidahanToMonument", UpdateInterval = 20},
		FigureInRangeNpc{TargetNpcId = Avatar, Range = 5 , UpdateInterval = 20},
	},
	Actions = {
		SetGlobalFlagTrue{Name = "Q26SidahanToMonument"},
	},
}

-- zum ersten punkt laufen
OnIdleGoHome{
	WalkMode = Run, X = 314, Y = 148, Direction = 3 , 
	Conditions = {
		IsGlobalFlagTrue{Name = "Q26SidahanGo", UpdateInterval = 20},
		IsGlobalFlagTrue{Name = "Q26SidahanToMonument", UpdateInterval = 20},
	},
	AbortConditions = {
		IsGlobalFlagFalse{Name = "Q26SidahanToMonument", UpdateInterval = 20},
		Negated(IsMonumentInUse {X = 317, Y = 153, Range = 0, UpdateInterval = 20}),
		FigureAlive{NpcId = Avatar},
	},
	AbortActions = {
		Stop{},
		LookAtFigure{Target = Avatar},
		Follow{Target = Avatar},
		},
	HomeActions = {
		SetGlobalFlagFalse{Name = "Q26SidahanGo"},
		SetGlobalFlagTrue{Name = "Q26SidahanStay"},
		},
}


--Läuft los sobald der Spieler das Flag setzt -Q27-             
--DefineLocationCircle{ X = 338, Y = 62,  Range = 2 , Name = "Point001"}
--DefineLocationCircle{ X = 319, Y = 83,  Range = 2 , Name = "Point002"}
--DefineLocationCircle{ X = 301, Y = 91,  Range = 2 , Name = "Point003"}
--DefineLocationCircle{ X = 296, Y = 98,  Range = 2 , Name = "Point004"}
--DefineLocationCircle{ X = 308, Y = 117, Range = 2 , Name = "Point005"}
--DefineLocationCircle{ X = 306, Y = 142, Range = 2 , Name = "Point006"}
--DefineLocationCircle{ X = 297, Y = 149, Range = 2 , Name = "Point007"}
--DefineLocationCircle{ X = 282, Y = 142, Range = 2 , Name = "Point008"}
--DefineLocationCircle{ X = 271, Y = 143, Range = 2 , Name = "Point009"}
DefineLocationCircle{ X = 277, Y = 170, Range = 2 , Name = "Point010"}
DefineLocationCircle{ X = 275, Y = 188, Range = 2 , Name = "Point011"}
DefineLocationCircle{ X = 268, Y = 198, Range = 2 , Name = "Point012"}
DefineLocationCircle{ X = 254, Y = 197, Range = 2 , Name = "Point013"}
DefineLocationCircle{ X = 233, Y = 190, Range = 2 , Name = "Point014"}
DefineLocationCircle{ X = 223, Y = 190, Range = 2 , Name = "Point015"}
DefineLocationCircle{ X = 207, Y = 197, Range = 2 , Name = "Point016"}
DefineLocationCircle{ X = 189, Y = 219, Range = 2 , Name = "Point017"}
DefineLocationCircle{ X = 186, Y = 238, Range = 2 , Name = "Point018"}
DefineLocationCircle{ X = 197, Y = 239, Range = 2 , Name = "Point019"}
DefineLocationCircle{ X = 214, Y = 223, Range = 2 , Name = "Point020"}
DefineLocationCircle{ X = 225, Y = 221, Range = 2 , Name = "Point021"}
DefineLocationCircle{ X = 232, Y = 224, Range = 2 , Name = "Point022"}
DefineLocationCircle{ X = 248, Y = 240, Range = 2 , Name = "Point023"}
DefineLocationCircle{ X = 241, Y = 248, Range = 2 , Name = "Point024"}
DefineLocationCircle{ X = 232, Y = 250, Range = 2 , Name = "Point025"}
DefineLocationCircle{ X = 211, Y = 271, Range = 2 , Name = "Point026"}
DefineLocationCircle{ X = 205, Y = 286, Range = 2 , Name = "Point027"}
DefineLocationCircle{ X = 194, Y = 291, Range = 2 , Name = "Point028"}
DefineLocationCircle{ X = 184, Y = 286, Range = 2 , Name = "Point029"}
DefineLocationCircle{ X = 174, Y = 299, Range = 2 , Name = "Point030"}
DefineLocationCircle{ X = 156, Y = 311, Range = 2 , Name = "Point031"}
DefineLocationCircle{ X = 133, Y = 327, Range = 2 , Name = "Point032"}
                                      
--AddControlPoint{Name = "001", Location = "Point001", WalkMode = Run}
--AddControlPoint{Name = "002", Location = "Point002", WalkMode = Run}
--AddControlPoint{Name = "003", Location = "Point003", WalkMode = Run}
--AddControlPoint{Name = "004", Location = "Point004", WalkMode = Run}
--AddControlPoint{Name = "005", Location = "Point005", WalkMode = Run}
--AddControlPoint{Name = "006", Location = "Point006", WalkMode = Run}
--AddControlPoint{Name = "007", Location = "Point007", WalkMode = Run}
--AddControlPoint{Name = "008", Location = "Point008", WalkMode = Run}
--AddControlPoint{Name = "009", Location = "Point009", WalkMode = Run}
AddControlPoint{Name = "010", Location = "Point010", WalkMode = Run}
AddControlPoint{Name = "011", Location = "Point011", WalkMode = Run}
AddControlPoint{Name = "012", Location = "Point012", WalkMode = Run}
AddControlPoint{Name = "013", Location = "Point013", WalkMode = Run}
AddControlPoint{Name = "014", Location = "Point014", WalkMode = Run}
AddControlPoint{Name = "015", Location = "Point015", WalkMode = Run}
AddControlPoint{Name = "016", Location = "Point016", WalkMode = Run}
AddControlPoint{Name = "017", Location = "Point017", WalkMode = Run}
AddControlPoint{Name = "018", Location = "Point018", WalkMode = Run}
AddControlPoint{Name = "019", Location = "Point019", WalkMode = Run}
AddControlPoint{Name = "020", Location = "Point020", WalkMode = Run}
AddControlPoint{Name = "021", Location = "Point021", WalkMode = Run}
AddControlPoint{Name = "022", Location = "Point022", WalkMode = Run}
AddControlPoint{Name = "023", Location = "Point023", WalkMode = Run}
AddControlPoint{Name = "024", Location = "Point024", WalkMode = Run}
AddControlPoint{Name = "025", Location = "Point025", WalkMode = Run}
AddControlPoint{Name = "026", Location = "Point026", WalkMode = Run}
AddControlPoint{Name = "027", Location = "Point027", WalkMode = Run}
AddControlPoint{Name = "028", Location = "Point028", WalkMode = Run}
AddControlPoint{Name = "029", Location = "Point029", WalkMode = Run}
AddControlPoint{Name = "030", Location = "Point030", WalkMode = Run}
AddControlPoint{Name = "031", Location = "Point031", WalkMode = Run}
AddControlPoint{Name = "032", Location = "Point032", WalkMode = Run}

DailyJobParams
{
Loop = FALSCH,
Conditions = {
		 QuestState {QuestId = 27 , State = StateSolved},
	},
}


-- ist doch uberflussig, oder?
REM = [[
OnEvent
{
	Conditions = {
		EnemyUnitInRange{X = 304, Y = 135, Range = 30, UpdateInterval = 30},
	},
	Actions = {
		Goto{WalkMode = Run, X = 303, Y = 129},
	},
}
]]




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p2\n1400_Sidahan.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagSidahanKnown"},
		},
		Actions = {
			Say{Tag = "sidahan001", String = "Ihr Götter, das ist das Ende! Brannigans Armeen haben unsere Heimstatt umstellt! Sie brennen alles nieder!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSidahanKnown"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sidahan002", String = "Wo ist Leonidar? Wo ist Utran? Wo sind die Heere der Menschen? Sagt mir: wo?"},
			Answer{Tag = "sidahan002PC", String = "Abgeschnitten und eingekreist von der Schwarzen Faust! Auch sie kämpfen um ihr Leben, so wie Ihr!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sidahan003", String = "Dann möge Elen uns allen gnädig sein! Sie haben den Kreis geschlossen! Wir sind verloren!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			UND(QuestState{QuestId = 29 , State = StateUnknown} , IsPlayerFlagFalse{Name = "GiveQuestRescueElfTroops"}),
			QuestState{QuestId = 27 , State = StateUnknown},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSidahanKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sidahan007PC", String = "Seid Ihr aus dem Dorf geflohen?", AnswerId = 9},
			OfferAnswer{Tag = "sidahan011PC", String = "Was kann ich tun?", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			UND(QuestState{QuestId = 29 , State = StateUnknown} , IsPlayerFlagFalse{Name = "GiveQuestRescueElfTroops"}),
			Negated(QuestState{QuestId = 27 , State = StateUnknown}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSidahanKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sidahan007PC", String = "Seid Ihr aus dem Dorf geflohen?", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(QuestState{QuestId = 29 , State = StateUnknown} , IsPlayerFlagFalse{Name = "GiveQuestRescueElfTroops"})),
			QuestState{QuestId = 27 , State = StateUnknown},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSidahanKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sidahan011PC", String = "Was kann ich tun?", AnswerId = 14},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND(QuestState{QuestId = 29 , State = StateUnknown} , IsPlayerFlagFalse{Name = "GiveQuestRescueElfTroops"})),
			Negated(QuestState{QuestId = 27 , State = StateUnknown}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSidahanKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
			UND(IsGlobalFlagTrue{Name = "Q26GateSentenceOn"} , IsGlobalFlagFalse{Name = "EloniGateOpen"}),
		},
		Actions = {
			Say{Tag = "sidahan004", String = "Das Tor zum Waldtal ist verschlossen! Das war Zarn, dieser elende Verräter! Die menschliche Goldgier ist unersättlich!"},
			Answer{Tag = "sidahan004PC", String = "Wie kann ich das Tor öffnen?", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(IsGlobalFlagTrue{Name = "Q26GateSentenceOn"} , IsGlobalFlagFalse{Name = "EloniGateOpen"})),
			UND(QuestState{QuestId = 29 , State = StateUnknown} , IsPlayerFlagFalse{Name = "GiveQuestRescueElfTroops"}),
			QuestState{QuestId = 27 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "sidahan007", String = "Elens Segen!"},
			OfferAnswer{Tag = "sidahan007PC", String = "Seid Ihr aus dem Dorf geflohen?", AnswerId = 9},
			OfferAnswer{Tag = "sidahan011PC", String = "Was kann ich tun?", AnswerId = 14},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(IsGlobalFlagTrue{Name = "Q26GateSentenceOn"} , IsGlobalFlagFalse{Name = "EloniGateOpen"})),
			UND(QuestState{QuestId = 29 , State = StateUnknown} , IsPlayerFlagFalse{Name = "GiveQuestRescueElfTroops"}),
			Negated(QuestState{QuestId = 27 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "sidahan007", String = "Elens Segen!"},
			OfferAnswer{Tag = "sidahan007PC", String = "Seid Ihr aus dem Dorf geflohen?", AnswerId = 9},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(IsGlobalFlagTrue{Name = "Q26GateSentenceOn"} , IsGlobalFlagFalse{Name = "EloniGateOpen"})),
			Negated(UND(QuestState{QuestId = 29 , State = StateUnknown} , IsPlayerFlagFalse{Name = "GiveQuestRescueElfTroops"})),
			QuestState{QuestId = 27 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "sidahan007", String = "Elens Segen!"},
			OfferAnswer{Tag = "sidahan011PC", String = "Was kann ich tun?", AnswerId = 14},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(UND(IsGlobalFlagTrue{Name = "Q26GateSentenceOn"} , IsGlobalFlagFalse{Name = "EloniGateOpen"})),
			Negated(UND(QuestState{QuestId = 29 , State = StateUnknown} , IsPlayerFlagFalse{Name = "GiveQuestRescueElfTroops"})),
			Negated(QuestState{QuestId = 27 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "sidahan007", String = "Elens Segen!"},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sidahan005", String = "Zarn muss den Schlüssel gestohlen haben! Wahrscheinlich versteckt er sich in einem der Goblinlager! Das einzige diesseits des Tores liegt westlich von hier in einer alten Ruine!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sidahan006", String = "Aber seht Euch vor - das Lager ist gut bewacht! Ihr solltet Euch erst genug Truppen herbeirufen, ehe Ihr einen Angriff wagt!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 451} , SetGlobalFlagFalse{Name = "Q26GateSentenceOn"} , RevealUnExplored{ X = 249 , Y = 157 , Range = 7},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			UND(QuestState{QuestId = 29 , State = StateUnknown} , IsPlayerFlagFalse{Name = "GiveQuestRescueElfTroops"}),
			QuestState{QuestId = 27 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sidahan007PC", String = "Seid Ihr aus dem Dorf geflohen?", AnswerId = 9},
			OfferAnswer{Tag = "sidahan011PC", String = "Was kann ich tun?", AnswerId = 14},
		}}

	OnAnswer{8;
		Conditions = {
			UND(QuestState{QuestId = 29 , State = StateUnknown} , IsPlayerFlagFalse{Name = "GiveQuestRescueElfTroops"}),
			Negated(QuestState{QuestId = 27 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sidahan007PC", String = "Seid Ihr aus dem Dorf geflohen?", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND(QuestState{QuestId = 29 , State = StateUnknown} , IsPlayerFlagFalse{Name = "GiveQuestRescueElfTroops"})),
			QuestState{QuestId = 27 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sidahan011PC", String = "Was kann ich tun?", AnswerId = 14},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND(QuestState{QuestId = 29 , State = StateUnknown} , IsPlayerFlagFalse{Name = "GiveQuestRescueElfTroops"})),
			Negated(QuestState{QuestId = 27 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sidahan008", String = "Nein! Wir versuchten einen Ausfall! Er misslang! Viele meiner Schwestern wurden dabei getötet!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sidahan009", String = "Diejenigen, die schon durch den Ring der Belagerer gestoßen waren, wurden abgeschnitten und in alle Winde verstreut! Ich konnte vier Gruppen ausmachen, die in verschiedene Richtungen flohen!"},
			Answer{Tag = "sidahan009PC", String = "Dann sollte sie jemand suchen und wieder in Sicherheit bringen! Wohin haben sich Eure Schwestern gewandt?", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sidahan010", String = "Zwei Gruppen flüchteten in das Waldtal, eine davon in Richtung Osten! Die dritte wurde in Richtung Nordosten abgedrängt! Die vierte Gruppe... steht vor Euch!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "GiveQuestRescueElfTroops"},
			SetPlayerFlagTrue{Name = "GiveQuestFindForestGroup"},
			SetPlayerFlagTrue{Name = "GiveQuestFindEastGroup"},
			SetPlayerFlagTrue{Name = "GiveQuestFindNorthEastGroup"},
			Say{Tag = "sidahan011", String = "Ich komme alleine zurecht - aber bitte, sucht meine Schwestern! Findet sie und bringt sie sicher zurück in die Heimstatt!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
			UND(QuestState{QuestId = 29 , State = StateUnknown} , IsPlayerFlagFalse{Name = "GiveQuestRescueElfTroops"}),
			QuestState{QuestId = 27 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sidahan007PC", String = "Seid Ihr aus dem Dorf geflohen?", AnswerId = 9},
			OfferAnswer{Tag = "sidahan011PC", String = "Was kann ich tun?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			UND(QuestState{QuestId = 29 , State = StateUnknown} , IsPlayerFlagFalse{Name = "GiveQuestRescueElfTroops"}),
			Negated(QuestState{QuestId = 27 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sidahan007PC", String = "Seid Ihr aus dem Dorf geflohen?", AnswerId = 9},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(UND(QuestState{QuestId = 29 , State = StateUnknown} , IsPlayerFlagFalse{Name = "GiveQuestRescueElfTroops"})),
			QuestState{QuestId = 27 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sidahan011PC", String = "Was kann ich tun?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(UND(QuestState{QuestId = 29 , State = StateUnknown} , IsPlayerFlagFalse{Name = "GiveQuestRescueElfTroops"})),
			Negated(QuestState{QuestId = 27 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sidahan012", String = "Es sind Hunderte! Alleine könnt Ihr niemals..."},
			Answer{Tag = "sidahan012PC", String = "Ich diene der Rune! Ich kann Euch helfen! Gibt es in dieser Gegend noch einige der alten Monumente?", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sidahan013", String = "Die gibt es! Dann besteht vielleicht noch Hoffnung!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sidahan014", String = "Hört zu: die Goblins der Schwarzen Faust belagern unsere Siedlung! Welle um Welle brandet gegen unsere Verteidigung!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sidahan015", String = "Ihr müsst den Goblins mit Euren Truppen in den Rücken fallen! Nehmt sie in die Zange - sie werden nicht mit Euch rechnen!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sidahan016", String = "Sollte Euch das gelingen, dann sprecht mit Lycande, unserer Anführerin in der Heimstatt! Sie wird wissen, was weiter zu tun ist!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 448}, RevealUnExplored{ X = 254 , Y = 276 , Range = 15}, RevealUnExplored{ X = 187 , Y = 287 , Range = 15},
			QuestBegin{QuestId = 27} , QuestBegin{QuestId = 133},
			Say{Tag = "sidahan017", String = "Nun zeige ich Euch ein Monument! Folgt mir!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q26SidahanGo"},
			EndDialog(),
		}}


	EndDefinition()
end