-->INFO: Archer_Eastcamp
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
--Respawn{WaitTime=20 , Conditions = {QuestState{QuestId = 33 , State = StateUnknown}}}

--Dialogsteuerung
--initial
OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetDialogType{Type = SideQuest}
		}
}


---Marschroute ArcherEast nach Hause
REM = [[
AddGotoLocation{ X = 335, Y = 270, Range = 3}
AddGotoLocation{ X = 325, Y = 271, Range = 3}
AddGotoLocation{ X = 319, Y = 266, Range = 3}
AddGotoLocation{ X = 307, Y = 265, Range = 3}
AddGotoLocation{ X = 294, Y = 269, Range = 3}
AddGotoLocation{ X = 288, Y = 267, Range = 3}
AddGotoLocation{ X = 281, Y = 262, Range = 3}
AddGotoLocation{ X = 271, Y = 261, Range = 3}
AddGotoLocation{ X = 264, Y = 263, Range = 3}
AddGotoLocation{ X = 258, Y = 261, Range = 3}
AddGotoLocation{ X = 257, Y = 254, Range = 3}
AddGotoLocation{ X = 253, Y = 244, Range = 3}
AddGotoLocation{ X = 248, Y = 242, Range = 3}
AddGotoLocation{ X = 244, Y = 244, Range = 3}
AddGotoLocation{ X = 238, Y = 248, Range = 3}
AddGotoLocation{ X = 231, Y = 251, Range = 3}
AddGotoLocation{ X = 221, Y = 260, Range = 3}
AddGotoLocation{ X = 209, Y = 274, Range = 3}
AddGotoLocation{ X = 205, Y = 285, Range = 3}
AddGotoLocation{ X = 198, Y = 291, Range = 3}
AddGotoLocation{ X = 189, Y = 290, Range = 3}
AddGotoLocation{ X = 182, Y = 291, Range = 3}
AddGotoLocation{ X = 173, Y = 299, Range = 3}
AddGotoLocation{ X = 167, Y = 303, Range = 3}
AddGotoLocation{ X = 156, Y = 311, Range = 3}
AddGotoLocation{ X = 151, Y = 314, Range = 3}
AddGotoLocation{ X = 144, Y = 319, Range = 3}
AddGotoLocation{ X = 137, Y = 324, Range = 3}
AddGotoLocation{ X = 131, Y = 328, Range = 3}


---Läuft los sobald der Spieler das Flag setzt
OnIdleWalkPath
{
Loop = FALSCH , 
UpdateInterval = 60, 
Conditions = {IsNpcFlagTrue{Name = "ArcherEastWalkHome"}},	
}
]]

DefineLocationCircle{ X = 335, Y = 270, Range = 3, Name = "Point001"}
DefineLocationCircle{ X = 325, Y = 271, Range = 3, Name = "Point002"}
DefineLocationCircle{ X = 319, Y = 266, Range = 3, Name = "Point003"}
DefineLocationCircle{ X = 307, Y = 265, Range = 3, Name = "Point004"}
DefineLocationCircle{ X = 294, Y = 269, Range = 3, Name = "Point005"}
DefineLocationCircle{ X = 288, Y = 267, Range = 3, Name = "Point006"}
DefineLocationCircle{ X = 281, Y = 262, Range = 3, Name = "Point007"}
DefineLocationCircle{ X = 271, Y = 261, Range = 3, Name = "Point008"}
DefineLocationCircle{ X = 264, Y = 263, Range = 3, Name = "Point009"}
DefineLocationCircle{ X = 258, Y = 261, Range = 3, Name = "Point010"}
DefineLocationCircle{ X = 257, Y = 254, Range = 3, Name = "Point011"}
DefineLocationCircle{ X = 253, Y = 244, Range = 3, Name = "Point012"}
DefineLocationCircle{ X = 248, Y = 242, Range = 3, Name = "Point013"}
DefineLocationCircle{ X = 244, Y = 244, Range = 3, Name = "Point014"}
DefineLocationCircle{ X = 238, Y = 248, Range = 3, Name = "Point015"}
DefineLocationCircle{ X = 231, Y = 251, Range = 3, Name = "Point016"}
DefineLocationCircle{ X = 221, Y = 260, Range = 3, Name = "Point017"}
DefineLocationCircle{ X = 209, Y = 274, Range = 3, Name = "Point018"}
DefineLocationCircle{ X = 205, Y = 285, Range = 3, Name = "Point019"}
DefineLocationCircle{ X = 198, Y = 291, Range = 3, Name = "Point020"}
DefineLocationCircle{ X = 189, Y = 290, Range = 3, Name = "Point021"}
DefineLocationCircle{ X = 182, Y = 291, Range = 3, Name = "Point022"}
DefineLocationCircle{ X = 173, Y = 299, Range = 3, Name = "Point023"}
DefineLocationCircle{ X = 167, Y = 303, Range = 3, Name = "Point024"}
DefineLocationCircle{ X = 156, Y = 311, Range = 3, Name = "Point025"}
DefineLocationCircle{ X = 151, Y = 314, Range = 3, Name = "Point026"}
DefineLocationCircle{ X = 144, Y = 319, Range = 3, Name = "Point027"}
DefineLocationCircle{ X = 137, Y = 324, Range = 3, Name = "Point028"}
DefineLocationCircle{ X = 131, Y = 328, Range = 3, Name = "Point029"}
                                      
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
AddControlPoint{Name = "029", Location = "Point029" , WalkMode = Run}

DailyJobParams
{
Loop = FALSCH,
Conditions = {
		IsNpcFlagTrue{Name = "ArcherEastWalkHome"},
	},
}


---Rewardvergabe - wird hier vorgenommmen, da im Dialog zu leicht wiederholbar -Q33-
OnOneTimeEvent
{
Conditions = 	{
		IsPlayerFlagTrue{Name = "GiveReward"}
		},
Actions =	{
		TransferXP{XP = 10 , Flag = Give},
		}
}

---Solver für die SuchQueste, für den Fall das er sie schon hat, ansonsten wird sie erst später im Dialog gesolved
--- -Q32- -Q33-
OnOneTimeEvent
{
Conditions =	{
		IsNpcFlagTrue{Name = "FlagLianKnown"},
		QuestState{QuestId = 32 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 32},
		QuestBegin{QuestId = 33}
		}
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p2\n1411_Archer_Eastcamp.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagLianKnown"},
		},
		Actions = {
			Say{Tag = "archerEastcamp001", String = "Wartet Schwestern! Kein Ork spürt uns nach - ein Mensch ist es!"},
			Answer{Tag = "archerEastcamp001PC", String = "Und nicht Euer Feind!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagLianKnown"}),
		},
		Actions = {
			Say{Tag = "archerEastcamp003", String = "Was gibt es, Freund?"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagLianKnown"},
			Say{Tag = "archerEastcamp002", String = "Dann kehrt besser um! Dieser Wald ist voll von jenen, die es sind!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 343 , Y = 268 , NpcId = 1411 , Range = 20},
			UND(Negated(QuestState{QuestId = 32 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherEastWalkHome"}),
			UND(Negated(QuestState{QuestId = 32 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherEastWalkHome"}),
			QuestState{QuestId = 32 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerEastcamp003PC", String = "Brannigans Horden sind geschlagen! Ihr könnt heimkehren!", AnswerId = 4},
			OfferAnswer{Tag = "archerEastcamp004PC", String = "Haltet durch! Noch sind Brannigans Armeen nicht besiegt!", AnswerId = 7},
			OfferAnswer{Tag = "archerEastcamp005PC", String = "Was tut Ihr hier?", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 343 , Y = 268 , NpcId = 1411 , Range = 20},
			UND(Negated(QuestState{QuestId = 32 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherEastWalkHome"}),
			UND(Negated(QuestState{QuestId = 32 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherEastWalkHome"}),
			Negated(QuestState{QuestId = 32 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerEastcamp003PC", String = "Brannigans Horden sind geschlagen! Ihr könnt heimkehren!", AnswerId = 4},
			OfferAnswer{Tag = "archerEastcamp004PC", String = "Haltet durch! Noch sind Brannigans Armeen nicht besiegt!", AnswerId = 7},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 343 , Y = 268 , NpcId = 1411 , Range = 20},
			UND(Negated(QuestState{QuestId = 32 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherEastWalkHome"}),
			Negated(UND(Negated(QuestState{QuestId = 32 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherEastWalkHome"})),
			QuestState{QuestId = 32 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerEastcamp003PC", String = "Brannigans Horden sind geschlagen! Ihr könnt heimkehren!", AnswerId = 4},
			OfferAnswer{Tag = "archerEastcamp005PC", String = "Was tut Ihr hier?", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 343 , Y = 268 , NpcId = 1411 , Range = 20},
			UND(Negated(QuestState{QuestId = 32 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherEastWalkHome"}),
			Negated(UND(Negated(QuestState{QuestId = 32 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherEastWalkHome"})),
			Negated(QuestState{QuestId = 32 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerEastcamp003PC", String = "Brannigans Horden sind geschlagen! Ihr könnt heimkehren!", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 343 , Y = 268 , NpcId = 1411 , Range = 20},
			Negated(UND(Negated(QuestState{QuestId = 32 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherEastWalkHome"})),
			UND(Negated(QuestState{QuestId = 32 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherEastWalkHome"}),
			QuestState{QuestId = 32 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerEastcamp004PC", String = "Haltet durch! Noch sind Brannigans Armeen nicht besiegt!", AnswerId = 7},
			OfferAnswer{Tag = "archerEastcamp005PC", String = "Was tut Ihr hier?", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 343 , Y = 268 , NpcId = 1411 , Range = 20},
			Negated(UND(Negated(QuestState{QuestId = 32 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherEastWalkHome"})),
			UND(Negated(QuestState{QuestId = 32 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherEastWalkHome"}),
			Negated(QuestState{QuestId = 32 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerEastcamp004PC", String = "Haltet durch! Noch sind Brannigans Armeen nicht besiegt!", AnswerId = 7},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 343 , Y = 268 , NpcId = 1411 , Range = 20},
			Negated(UND(Negated(QuestState{QuestId = 32 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherEastWalkHome"})),
			Negated(UND(Negated(QuestState{QuestId = 32 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherEastWalkHome"})),
			QuestState{QuestId = 32 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerEastcamp005PC", String = "Was tut Ihr hier?", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			FigureInRange{X = 343 , Y = 268 , NpcId = 1411 , Range = 20},
			Negated(UND(Negated(QuestState{QuestId = 32 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherEastWalkHome"})),
			Negated(UND(Negated(QuestState{QuestId = 32 , State = StateUnknown}) , IsNpcFlagFalse{Name = "ArcherEastWalkHome"})),
			Negated(QuestState{QuestId = 32 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(FigureInRange{X = 343 , Y = 268 , NpcId = 1411 , Range = 20}),
			UND(FigureInRange{X = 131 , Y = 328 , NpcId = 1411 , Range = 4}, IsNpcFlagFalse{Name = "Home"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "archerEastcamp008PC", String = "Willkommen zu Hause!", AnswerId = 13},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(FigureInRange{X = 343 , Y = 268 , NpcId = 1411 , Range = 20}),
			Negated(UND(FigureInRange{X = 131 , Y = 328 , NpcId = 1411 , Range = 4}, IsNpcFlagFalse{Name = "Home"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 32},
			QuestBegin{QuestId = 33},
			Say{Tag = "archerEastcamp004", String = "Bei Elen, ist das wahr? Sprecht Ihr die Wahrheit? Gesegnet seid Ihr, Runenkrieger! Kommt Schwestern, wir können zurück nach Hause!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ArcherEastWalkHome"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 32},
			QuestBegin{QuestId = 33},
			Say{Tag = "archerEastcamp005", String = "Dann bleibt uns nichts als weiter hier auszuharren!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "archerEastcamp006", String = "Wir versuchten, den Gürtel von Brannigans Horden zu zerschlagen, der unsere Heimstatt umschließt! Wir scheiterten! Unsere Truppen wurden aufgerieben und von der Heimstatt abgeschnitten!"},
			Answer{Tag = "archerEastcamp006PC", String = "Gab es außer Euch noch weitere Überlebende?", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "GiveQuestRescueElfTroops"},
			QuestSolve{QuestId = 32},
			QuestBegin{QuestId = 33},
			Say{Tag = "archerEastcamp007", String = "Soviel ich weiß, flohen vier Gruppen in die Wälder! Wo die anderen sind, kann ich nicht sagen! Aber wenn es ihnen so ergangen ist, wie uns, wird niemand von uns je zurückkehren! Wir sind völlig erschöpft!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "archerEastcamp008", String = "Bitte... wenn es in Eurer Macht steht - helft uns!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{ Name = "DieLetztenSchuetzen2"}, SetNpcFlagTrue{Name = "Home"},
			QuestSolve{QuestId = 33},
			Say{Tag = "archerEastcamp009", String = "Das verdanken wir nur Euch! Hier, bitte nehmt dies als Zeichen unseres immerwährenden Dankes! Und möge Elen Euch auf all Euren Wegen begleiten!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}


	EndDefinition()
end