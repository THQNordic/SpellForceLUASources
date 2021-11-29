-->INFO: Archer_Forestcamp
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
AddGotoLocation{X = 249, Y = 223, Range = 3}
AddGotoLocation{X = 251, Y = 229, Range = 3}
AddGotoLocation{X = 250, Y = 234, Range = 3}
AddGotoLocation{X = 248, Y = 237, Range = 3}
AddGotoLocation{X = 246, Y = 240, Range = 3}
AddGotoLocation{X = 242, Y = 246, Range = 3}
AddGotoLocation{X = 234, Y = 250, Range = 3}
AddGotoLocation{X = 226, Y = 256, Range = 3}
AddGotoLocation{X = 216, Y = 265, Range = 3}
AddGotoLocation{X = 210, Y = 274, Range = 3}
AddGotoLocation{X = 206, Y = 286, Range = 3}
AddGotoLocation{X = 193, Y = 293, Range = 3}
AddGotoLocation{X = 186, Y = 288, Range = 3}
AddGotoLocation{X = 177, Y = 296, Range = 3}
AddGotoLocation{X = 168, Y = 303, Range = 3}
AddGotoLocation{X = 158, Y = 307, Range = 3}
AddGotoLocation{X = 145, Y = 319, Range = 3}
AddGotoLocation{X = 142, Y = 324, Range = 3}


---Läuft los sobald der Spieler das Flag setzt
OnIdleWalkPath
{
Loop = FALSCH , 
UpdateInterval = 60, 
Conditions = {IsNpcFlagTrue{Name = "ArcherForestWalkHome"}},	
}
]]


DefineLocationCircle{X = 249, Y = 223, Range = 3, Name = "Point001"}
DefineLocationCircle{X = 251, Y = 229, Range = 3, Name = "Point002"}
DefineLocationCircle{X = 250, Y = 234, Range = 3, Name = "Point003"}
DefineLocationCircle{X = 248, Y = 237, Range = 3, Name = "Point004"}
DefineLocationCircle{X = 246, Y = 240, Range = 3, Name = "Point005"}
DefineLocationCircle{X = 242, Y = 246, Range = 3, Name = "Point006"}
DefineLocationCircle{X = 234, Y = 250, Range = 3, Name = "Point007"}
DefineLocationCircle{X = 226, Y = 256, Range = 3, Name = "Point008"}
DefineLocationCircle{X = 216, Y = 265, Range = 3, Name = "Point009"}
DefineLocationCircle{X = 210, Y = 274, Range = 3, Name = "Point010"}
DefineLocationCircle{X = 206, Y = 286, Range = 3, Name = "Point011"}
DefineLocationCircle{X = 193, Y = 293, Range = 3, Name = "Point012"}
DefineLocationCircle{X = 186, Y = 288, Range = 3, Name = "Point013"}
DefineLocationCircle{X = 177, Y = 296, Range = 3, Name = "Point014"}
DefineLocationCircle{X = 168, Y = 303, Range = 3, Name = "Point015"}
DefineLocationCircle{X = 158, Y = 307, Range = 3, Name = "Point016"}
DefineLocationCircle{X = 145, Y = 319, Range = 3, Name = "Point017"}
DefineLocationCircle{X = 142, Y = 324, Range = 3, Name = "Point018"}
                                      
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

DailyJobParams
{
Loop = FALSCH,
Conditions = {
		IsNpcFlagTrue{Name = "ArcherForestWalkHome"},
	},
}


---Rewardvergabe - wird hier vorgenommmen, da im Dialog zu leicht wiederholbar -Q31-
OnOneTimeEvent
{
Conditions = 	{
		IsPlayerFlagTrue{Name = "GiveRewardForest"}
		},
Actions =	{
		TransferXP{XP = 10 , Flag = Give},
		}
}

---Solver für die SuchQueste, für den Fall das er sie schon hat, ansonsten wird sie erst später im Dialog gesolved
--- -Q30- -Q31-
OnOneTimeEvent
{
Conditions =	{
		IsNpcFlagTrue{Name = "FlagElinKnown"},
		QuestState{QuestId = 31 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 30},
		QuestBegin{QuestId = 31}
		}
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p2\n1500_Archer_Forestcamp.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagElendinKnown"},
		},
		Actions = {
			Say{Tag = "archerForestcamp001", String = "Ihr seid keiner von Brannigans Leuten!"},
			Answer{Tag = "archerForestcamp001PC", String = "Nein! Ich bin hier, um sie zu bekämpfen!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagElendinKnown"}),
		},
		Actions = {
			Say{Tag = "archerForestcamp003", String = "Elens Friede sei mit Euch!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagElendinKnown"},
			Say{Tag = "archerForestcamp002", String = "Dann möge Euch mehr Erfolg beschieden sein als uns!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 265 , Y = 231 , NpcId = 1500 , Range = 20},
			UND(Negated(QuestState{QuestId = 30 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherForestWalkHome"}),
			UND(Negated(QuestState{QuestId = 30 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherForestWalkHome"}),
			QuestState{QuestId = 30 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerForestcamp003PC", String = "Ihr könnt heimkehren, der Weg ist frei!", AnswerId = 4},
			OfferAnswer{Tag = "archerForestcamp005PC", String = "Die Lage ist nach wie vor unverändert!", AnswerId = 7},
			OfferAnswer{Tag = "archerForestcamp006PC", String = "Was führt Euch hierher?", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 265 , Y = 231 , NpcId = 1500 , Range = 20},
			UND(Negated(QuestState{QuestId = 30 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherForestWalkHome"}),
			UND(Negated(QuestState{QuestId = 30 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherForestWalkHome"}),
			Negated(QuestState{QuestId = 30 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerForestcamp003PC", String = "Ihr könnt heimkehren, der Weg ist frei!", AnswerId = 4},
			OfferAnswer{Tag = "archerForestcamp005PC", String = "Die Lage ist nach wie vor unverändert!", AnswerId = 7},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 265 , Y = 231 , NpcId = 1500 , Range = 20},
			UND(Negated(QuestState{QuestId = 30 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherForestWalkHome"}),
			Negated(UND(Negated(QuestState{QuestId = 30 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherForestWalkHome"})),
			QuestState{QuestId = 30 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerForestcamp003PC", String = "Ihr könnt heimkehren, der Weg ist frei!", AnswerId = 4},
			OfferAnswer{Tag = "archerForestcamp006PC", String = "Was führt Euch hierher?", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 265 , Y = 231 , NpcId = 1500 , Range = 20},
			UND(Negated(QuestState{QuestId = 30 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherForestWalkHome"}),
			Negated(UND(Negated(QuestState{QuestId = 30 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherForestWalkHome"})),
			Negated(QuestState{QuestId = 30 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerForestcamp003PC", String = "Ihr könnt heimkehren, der Weg ist frei!", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 265 , Y = 231 , NpcId = 1500 , Range = 20},
			Negated(UND(Negated(QuestState{QuestId = 30 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherForestWalkHome"})),
			UND(Negated(QuestState{QuestId = 30 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherForestWalkHome"}),
			QuestState{QuestId = 30 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerForestcamp005PC", String = "Die Lage ist nach wie vor unverändert!", AnswerId = 7},
			OfferAnswer{Tag = "archerForestcamp006PC", String = "Was führt Euch hierher?", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 265 , Y = 231 , NpcId = 1500 , Range = 20},
			Negated(UND(Negated(QuestState{QuestId = 30 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherForestWalkHome"})),
			UND(Negated(QuestState{QuestId = 30 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherForestWalkHome"}),
			Negated(QuestState{QuestId = 30 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerForestcamp005PC", String = "Die Lage ist nach wie vor unverändert!", AnswerId = 7},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 265 , Y = 231 , NpcId = 1500 , Range = 20},
			Negated(UND(Negated(QuestState{QuestId = 30 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherForestWalkHome"})),
			Negated(UND(Negated(QuestState{QuestId = 30 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherForestWalkHome"})),
			QuestState{QuestId = 30 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerForestcamp006PC", String = "Was führt Euch hierher?", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 265 , Y = 231 , NpcId = 1500 , Range = 20},
			Negated(UND(Negated(QuestState{QuestId = 30 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherForestWalkHome"})),
			Negated(UND(Negated(QuestState{QuestId = 30 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherForestWalkHome"})),
			Negated(QuestState{QuestId = 30 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(FigureInRange{X = 265 , Y = 231 , NpcId = 1500 , Range = 20}),
			UND(FigureInRange{X = 142 , Y = 324 , NpcId = 1500 , Range = 4} , IsNpcFlagFalse{Name = "Home"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerForestcamp008PC", String = "Willkommen zurück!", AnswerId = 12},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(FigureInRange{X = 265 , Y = 231 , NpcId = 1500 , Range = 20}),
			Negated(UND(FigureInRange{X = 142 , Y = 324 , NpcId = 1500 , Range = 4} , IsNpcFlagFalse{Name = "Home"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 30},
			QuestBegin{QuestId = 31},
			Say{Tag = "archerForestcamp004", String = "Frei? Seid Ihr Euch sicher? Wir sind zu erschöpft, um noch eine Schlacht schlagen zu können!"},
			Answer{Tag = "archerForestcamp004PC", String = "Euch wird nichts geschehen! Geht!", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ArcherForestWalkHome"},
			Say{Tag = "archerForestcamp005", String = "Gut! Ich vertraue Euch! Kommt, Schwestern!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 30},
			QuestBegin{QuestId = 31},
			Say{Tag = "archerForestcamp006", String = "Wir werden ausharren! Noch ist der Kampf nicht vorbei!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "archerForestcamp007", String = "Brannigans Truppen belagern unsere Heimstatt! Wir versuchten einen Ausfall, doch wir wurden zerschlagen!"},
			Answer{Tag = "archerForestcamp007PC", String = "Gibt es noch mehr Überlebende?", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "GiveQuestRescueElfTroops"},
			QuestSolve{QuestId = 30},
			QuestBegin{QuestId = 31},
			Say{Tag = "archerForestcamp008", String = "Ich glaube, dass es vier Gruppen von uns bis in die Wälder geschafft haben! Ich weiß nicht, wo die anderen sind! Aber ich bete für ihr Leben! Viele von uns sind zu erschöpft, um noch zu kämpfen! Doch noch sind die Eloni nicht geschlagen!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{ Name = "DieLetztenSchuetzen1"} , SetNpcFlagTrue{Name = "Home"},
			QuestSolve{QuestId = 31},
			Say{Tag = "archerForestcamp009", String = "Zurück - dank Euch! Elens Segen, Freund! Nehmt dies hier als Zeichen unserer Anerkennung! Ich hoffe, es wird Euch dienlich sein!"},
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