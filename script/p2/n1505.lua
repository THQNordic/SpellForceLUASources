-->INFO: Archer_NEcamp
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Dialogsteuerung
--initial
OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetDialogType{Type = SideQuest}
		}
}


REM = [[
--!EDS PATROL BEGIN
AddGotoLocation{X = 351, Y = 402, Range = 3}
AddGotoLocation{X = 350, Y = 397, Range = 3}
AddGotoLocation{X = 348, Y = 389, Range = 3}
AddGotoLocation{X = 344, Y = 381, Range = 3}
AddGotoLocation{X = 339, Y = 377, Range = 3}
AddGotoLocation{X = 335, Y = 373, Range = 3}
AddGotoLocation{X = 329, Y = 375, Range = 3}
AddGotoLocation{X = 322, Y = 374, Range = 3}
AddGotoLocation{X = 318, Y = 371, Range = 3}
AddGotoLocation{X = 317, Y = 358, Range = 3}
AddGotoLocation{X = 305, Y = 355, Range = 3}
AddGotoLocation{X = 295, Y = 348, Range = 3}
AddGotoLocation{X = 281, Y = 334, Range = 3}
AddGotoLocation{X = 271, Y = 330, Range = 3}
AddGotoLocation{X = 253, Y = 336, Range = 3}
AddGotoLocation{X = 241, Y = 342, Range = 3}
AddGotoLocation{X = 224, Y = 336, Range = 3}
AddGotoLocation{X = 211, Y = 325, Range = 3}
AddGotoLocation{X = 203, Y = 315, Range = 3}
AddGotoLocation{X = 199, Y = 304, Range = 3}
AddGotoLocation{X = 194, Y = 291, Range = 3}
AddGotoLocation{X = 183, Y = 290, Range = 3}
AddGotoLocation{X = 177, Y = 296, Range = 3}
AddGotoLocation{X = 172, Y = 301, Range = 3}
AddGotoLocation{X = 163, Y = 306, Range = 3}
AddGotoLocation{X = 155, Y = 310, Range = 3}
AddGotoLocation{X = 149, Y = 314, Range = 3}
AddGotoLocation{X = 143, Y = 319, Range = 3}
AddGotoLocation{X = 138, Y = 318, Range = 3}
--!EDS PATROL END

---Läuft los sobald der Spieler das Flag setzt
OnIdleWalkPath
{
Loop = FALSCH , 
UpdateInterval = 60, 
Conditions = {IsNpcFlagTrue{Name = "ArcherNEWalkHome"}},	
}
]]


DefineLocationCircle{X = 351, Y = 402, Range = 3, Name = "Point001"}
DefineLocationCircle{X = 350, Y = 397, Range = 3, Name = "Point002"}
DefineLocationCircle{X = 348, Y = 389, Range = 3, Name = "Point003"}
DefineLocationCircle{X = 344, Y = 381, Range = 3, Name = "Point004"}
DefineLocationCircle{X = 339, Y = 377, Range = 3, Name = "Point005"}
DefineLocationCircle{X = 335, Y = 373, Range = 3, Name = "Point006"}
DefineLocationCircle{X = 329, Y = 375, Range = 3, Name = "Point007"}
DefineLocationCircle{X = 322, Y = 374, Range = 3, Name = "Point008"}
DefineLocationCircle{X = 318, Y = 371, Range = 3, Name = "Point009"}
DefineLocationCircle{X = 317, Y = 358, Range = 3, Name = "Point010"}
DefineLocationCircle{X = 305, Y = 355, Range = 3, Name = "Point011"}
DefineLocationCircle{X = 295, Y = 348, Range = 3, Name = "Point012"}
DefineLocationCircle{X = 281, Y = 334, Range = 3, Name = "Point013"}
DefineLocationCircle{X = 271, Y = 330, Range = 3, Name = "Point014"}
DefineLocationCircle{X = 253, Y = 336, Range = 3, Name = "Point015"}
DefineLocationCircle{X = 241, Y = 342, Range = 3, Name = "Point016"}
DefineLocationCircle{X = 224, Y = 336, Range = 3, Name = "Point017"}
DefineLocationCircle{X = 211, Y = 325, Range = 3, Name = "Point018"}
DefineLocationCircle{X = 203, Y = 315, Range = 3, Name = "Point019"}
DefineLocationCircle{X = 199, Y = 304, Range = 3, Name = "Point020"}
DefineLocationCircle{X = 194, Y = 291, Range = 3, Name = "Point021"}
DefineLocationCircle{X = 183, Y = 290, Range = 3, Name = "Point022"}
DefineLocationCircle{X = 177, Y = 296, Range = 3, Name = "Point023"}
DefineLocationCircle{X = 172, Y = 301, Range = 3, Name = "Point024"}
DefineLocationCircle{X = 163, Y = 306, Range = 3, Name = "Point025"}
DefineLocationCircle{X = 155, Y = 310, Range = 3, Name = "Point026"}
DefineLocationCircle{X = 149, Y = 314, Range = 3, Name = "Point027"}
DefineLocationCircle{X = 143, Y = 319, Range = 3, Name = "Point028"}
DefineLocationCircle{X = 138, Y = 318, Range = 3, Name = "Point029"}
                                      
AddControlPoint{Name = "001", Location = "Point001" , WalkMode = Run}
AddControlPoint{Name = "002", Location = "Point002" , WalkMode = Run}
AddControlPoint{Name = "003", Location = "Point003" , WalkMode = Run}
AddControlPoint{Name = "004", Location = "Point004" , WalkMode = Run}
AddControlPoint{Name = "005", Location = "Point005" , WalkMode = Run}
AddControlPoint{Name = "006", Location = "Point006" , WalkMode = Run}
AddControlPoint{Name = "007", Location = "Point007" , WalkMode = Run}
AddControlPoint{Name = "008", Location = "Point008" , WalkMode = Run}
AddControlPoint{Name = "009", Location = "Point009" , WalkMode = Run}
AddControlPoint{Name = "010", Location = "Point010" , WalkMode = Run}
AddControlPoint{Name = "011", Location = "Point011" , WalkMode = Run}
AddControlPoint{Name = "012", Location = "Point012" , WalkMode = Run}
AddControlPoint{Name = "013", Location = "Point013" , WalkMode = Run}
AddControlPoint{Name = "014", Location = "Point014" , WalkMode = Run}
AddControlPoint{Name = "015", Location = "Point015" , WalkMode = Run}
AddControlPoint{Name = "016", Location = "Point016" , WalkMode = Run}
AddControlPoint{Name = "017", Location = "Point017" , WalkMode = Run}
AddControlPoint{Name = "018", Location = "Point018" , WalkMode = Run}
AddControlPoint{Name = "019", Location = "Point019" , WalkMode = Run}
AddControlPoint{Name = "020", Location = "Point020" , WalkMode = Run}
AddControlPoint{Name = "021", Location = "Point021" , WalkMode = Run}
AddControlPoint{Name = "022", Location = "Point022" , WalkMode = Run}
AddControlPoint{Name = "023", Location = "Point023" , WalkMode = Run}
AddControlPoint{Name = "024", Location = "Point024" , WalkMode = Run}
AddControlPoint{Name = "025", Location = "Point025" , WalkMode = Run}
AddControlPoint{Name = "026", Location = "Point026" , WalkMode = Run}
AddControlPoint{Name = "027", Location = "Point027" , WalkMode = Run}
AddControlPoint{Name = "028", Location = "Point028" , WalkMode = Run}
AddControlPoint{Name = "029", Location = "Point029"}

DailyJobParams
{
Loop = FALSCH,
Conditions = {
		IsNpcFlagTrue{Name = "ArcherNEWalkHome"},
	},
}


---Rewardvergabe - wird hier vorgenommmen, da im Dialog zu leicht wiederholbar -Q35-
OnOneTimeEvent
{
Conditions = 	{
		IsPlayerFlagTrue{Name = "GiveRewardNE"}
		},
Actions =	{
		TransferXP{XP = 10 , Flag = Give},
		}
}

---Solver für die SuchQueste, für den Fall das er sie schon hat, ansonsten wird sie erst später im Dialog gesolved
--- -Q34- -Q35-
OnOneTimeEvent
{
Conditions =	{
		IsNpcFlagTrue{Name = "FlagSilvenKnown"},
		QuestState{QuestId = 34 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 34},
		QuestBegin{QuestId = 35}
		}
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p2\n1505_Archer_NEcamp.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagSilvenKnown"},
		},
		Actions = {
			Say{Tag = "archerNEcamp001", String = "Bleibt stehen! Keinen Schritt weiter!"},
			Answer{Tag = "archerNEcamp001PC", String = "Ich bin keiner von Brannigans Leuten!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSilvenKnown"}),
		},
		Actions = {
			Say{Tag = "archerNEcamp003", String = "Ihr seid es!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSilvenKnown"},
			Say{Tag = "archerNEcamp002", String = "Nun, wer auch immer Ihr seid - Ihr hättet Euch keinen unpassenderen Zeitpunkt aussuchen können, hier aufzutauchen!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 351 , Y = 406 , NpcId = 1505 , Range = 20},
			UND(Negated(QuestState{QuestId = 34 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherNEWalkHome"}),
			UND(Negated(QuestState{QuestId = 34 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherNEWalkHome"}),
			QuestState{QuestId = 34 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerNEcamp003PC", String = "Kehrt heim, der Weg zurück in Euer Dorf ist frei.", AnswerId = 4},
			OfferAnswer{Tag = "archerNEcamp005PC", String = "Brannigans Horden halten Eure Heimstatt noch besetzt!", AnswerId = 7},
			OfferAnswer{Tag = "archerNEcamp006PC", String = "Wie hat es Euch hierher verschlagen?", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 351 , Y = 406 , NpcId = 1505 , Range = 20},
			UND(Negated(QuestState{QuestId = 34 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherNEWalkHome"}),
			UND(Negated(QuestState{QuestId = 34 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherNEWalkHome"}),
			Negated(QuestState{QuestId = 34 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerNEcamp003PC", String = "Kehrt heim, der Weg zurück in Euer Dorf ist frei.", AnswerId = 4},
			OfferAnswer{Tag = "archerNEcamp005PC", String = "Brannigans Horden halten Eure Heimstatt noch besetzt!", AnswerId = 7},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 351 , Y = 406 , NpcId = 1505 , Range = 20},
			UND(Negated(QuestState{QuestId = 34 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherNEWalkHome"}),
			Negated(UND(Negated(QuestState{QuestId = 34 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherNEWalkHome"})),
			QuestState{QuestId = 34 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerNEcamp003PC", String = "Kehrt heim, der Weg zurück in Euer Dorf ist frei.", AnswerId = 4},
			OfferAnswer{Tag = "archerNEcamp006PC", String = "Wie hat es Euch hierher verschlagen?", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 351 , Y = 406 , NpcId = 1505 , Range = 20},
			UND(Negated(QuestState{QuestId = 34 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherNEWalkHome"}),
			Negated(UND(Negated(QuestState{QuestId = 34 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherNEWalkHome"})),
			Negated(QuestState{QuestId = 34 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerNEcamp003PC", String = "Kehrt heim, der Weg zurück in Euer Dorf ist frei.", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 351 , Y = 406 , NpcId = 1505 , Range = 20},
			Negated(UND(Negated(QuestState{QuestId = 34 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherNEWalkHome"})),
			UND(Negated(QuestState{QuestId = 34 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherNEWalkHome"}),
			QuestState{QuestId = 34 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerNEcamp005PC", String = "Brannigans Horden halten Eure Heimstatt noch besetzt!", AnswerId = 7},
			OfferAnswer{Tag = "archerNEcamp006PC", String = "Wie hat es Euch hierher verschlagen?", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 351 , Y = 406 , NpcId = 1505 , Range = 20},
			Negated(UND(Negated(QuestState{QuestId = 34 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherNEWalkHome"})),
			UND(Negated(QuestState{QuestId = 34 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherNEWalkHome"}),
			Negated(QuestState{QuestId = 34 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerNEcamp005PC", String = "Brannigans Horden halten Eure Heimstatt noch besetzt!", AnswerId = 7},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 351 , Y = 406 , NpcId = 1505 , Range = 20},
			Negated(UND(Negated(QuestState{QuestId = 34 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherNEWalkHome"})),
			Negated(UND(Negated(QuestState{QuestId = 34 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherNEWalkHome"})),
			QuestState{QuestId = 34 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerNEcamp006PC", String = "Wie hat es Euch hierher verschlagen?", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 351 , Y = 406 , NpcId = 1505 , Range = 20},
			Negated(UND(Negated(QuestState{QuestId = 34 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherNEWalkHome"})),
			Negated(UND(Negated(QuestState{QuestId = 34 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherNEWalkHome"})),
			Negated(QuestState{QuestId = 34 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(FigureInRange{X = 351 , Y = 406 , NpcId = 1505 , Range = 20}),
			UND(FigureInRange{X = 138 , Y = 318 , NpcId = 1505 , Range = 4}, IsNpcFlagFalse{Name = "Home"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerNEcamp008PC", String = "Willkommen zu Hause!", AnswerId = 12},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(FigureInRange{X = 351 , Y = 406 , NpcId = 1505 , Range = 20}),
			Negated(UND(FigureInRange{X = 138 , Y = 318 , NpcId = 1505 , Range = 4}, IsNpcFlagFalse{Name = "Home"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 34},
			QuestBegin{QuestId = 35},
			Say{Tag = "archerNEcamp004", String = "Haben die Schwestern aus der Heimstatt Euch geschickt?"},
			Answer{Tag = "archerNEcamp004PC", String = "Ja! Sidahan hat mir von Euch berichtet!", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ArcherNEWalkHome"},
			Say{Tag = "archerNEcamp005", String = "Nun gut! Ich vertraue Euch, Fremdling! Kommt Schwestern, kehren wir heim!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 34},
			QuestBegin{QuestId = 35},
			Say{Tag = "archerNEcamp006", String = "Diese grünhäutigen Mörder! Der Zorn der Götter möge sie erschlagen! Wir werden warten!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "archerNEcamp007", String = "Wir versuchten einen Ausfall durch den Ring der Belagerer! Aber wir wurden von der Heimstatt abgeschnitten und mussten in die Wälder fliehen!"},
			Answer{Tag = "archerNEcamp007PC", String = "Gibt es noch mehr Überlebende?", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "GiveQuestRescueElfTroops"},
			QuestSolve{QuestId = 34},
			QuestBegin{QuestId = 35},
			Say{Tag = "archerNEcamp008", String = "Ich sah vier Gruppen in verschiedene Richtungen in die Wälder fliehen! Ohne Hilfe werden wir alle sterben! Aber was schert Euch das?"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{ Name = "DieLetztenSchuetzen3"} , SetNpcFlagTrue{Name = "Home"},
			QuestSolve{QuestId = 35},
			Say{Tag = "archerNEcamp009", String = "Das verdanken wir nur Euch! Hier, nehmt das! Ich hoffe, es wird Euch nützlich sein!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}


	EndDefinition()
end