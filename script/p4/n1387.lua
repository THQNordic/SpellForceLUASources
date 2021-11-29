-->INFO: SinwenWhiteleaf
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = SouthWest}
--!EDS ONIDLEGOHOME END

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
AddGotoLocation{X = 362, Y = 306, Range = 2}
AddGotoLocation{X = 356, Y = 321, Range = 2}
AddGotoLocation{X = 339, Y = 324, Range = 2}
AddGotoLocation{X = 337, Y = 301, Range = 2}
AddGotoLocation{X = 334, Y = 277, Range = 2}
AddGotoLocation{X = 369, Y = 270, Range = 2}
AddGotoLocation{X = 392, Y = 255, Range = 2}
AddGotoLocation{X = 361, Y = 250, Range = 2}
AddGotoLocation{X = 332, Y = 252, Range = 2}
AddGotoLocation{X = 309, Y = 271, Range = 2}
AddGotoLocation{X = 280, Y = 302, Range = 2}
AddGotoLocation{X = 247, Y = 333, Range = 2}
AddGotoLocation{X = 212, Y = 313, Range = 2}
AddGotoLocation{X = 208, Y = 298, Range = 2}
AddGotoLocation{X = 203, Y = 274, Range = 2}
AddGotoLocation{X = 198, Y = 251, Range = 2}
AddGotoLocation{X = 172, Y = 234, Range = 2}
AddGotoLocation{X = 166, Y = 202, Range = 2}
AddGotoLocation{X = 166, Y = 166, Range = 2}
AddGotoLocation{X = 154, Y = 161, Range = 2}
AddGotoLocation{X = 123, Y = 169, Range = 2}
AddGotoLocation{X = 101, Y = 165, Range = 2}
AddGotoLocation{X = 100, Y = 157, Range = 2}

--!EDS PATROL END

---Sinwen läuft nach Eloni nach Dialog
OnIdleWalkPath
{
Loop = FALSCH , 
UpdateInterval = 60, 
Conditions = {IsNpcFlagTrue{Name = "SinwenWalkToEloni"}},	
}
]]

DefineLocationCircle{X = 362, Y = 306, Range = 2 , Name = "Point001"}
DefineLocationCircle{X = 356, Y = 321, Range = 2 , Name = "Point002"}
DefineLocationCircle{X = 339, Y = 324, Range = 2 , Name = "Point003"}
DefineLocationCircle{X = 337, Y = 301, Range = 2 , Name = "Point004"}
DefineLocationCircle{X = 334, Y = 277, Range = 2 , Name = "Point005"}
DefineLocationCircle{X = 369, Y = 270, Range = 2 , Name = "Point006"}
DefineLocationCircle{X = 392, Y = 255, Range = 2 , Name = "Point007"}
DefineLocationCircle{X = 361, Y = 250, Range = 2 , Name = "Point008"}
DefineLocationCircle{X = 332, Y = 252, Range = 2 , Name = "Point009"}
DefineLocationCircle{X = 309, Y = 271, Range = 2 , Name = "Point010"}
DefineLocationCircle{X = 280, Y = 302, Range = 2 , Name = "Point011"}
DefineLocationCircle{X = 247, Y = 333, Range = 2 , Name = "Point012"}
DefineLocationCircle{X = 212, Y = 313, Range = 2 , Name = "Point013"}
DefineLocationCircle{X = 208, Y = 298, Range = 2 , Name = "Point014"}
DefineLocationCircle{X = 203, Y = 274, Range = 2 , Name = "Point015"}
DefineLocationCircle{X = 198, Y = 251, Range = 2 , Name = "Point016"}
DefineLocationCircle{X = 172, Y = 234, Range = 2 , Name = "Point017"}
DefineLocationCircle{X = 166, Y = 202, Range = 2 , Name = "Point018"}
DefineLocationCircle{X = 166, Y = 166, Range = 2 , Name = "Point019"}
DefineLocationCircle{X = 154, Y = 161, Range = 2 , Name = "Point020"}
DefineLocationCircle{X = 123, Y = 169, Range = 2 , Name = "Point021"}
DefineLocationCircle{X = 101, Y = 165, Range = 2 , Name = "Point022"}
DefineLocationCircle{X = 100, Y = 157, Range = 2 , Name = "Point023"}
                                      
AddControlPoint{Name = "001", Location = "Point001"}
AddControlPoint{Name = "002", Location = "Point002"}
AddControlPoint{Name = "003", Location = "Point003"}
AddControlPoint{Name = "004", Location = "Point004"}
AddControlPoint{Name = "005", Location = "Point005"}
AddControlPoint{Name = "006", Location = "Point006"}
AddControlPoint{Name = "007", Location = "Point007"}
AddControlPoint{Name = "008", Location = "Point008"}
AddControlPoint{Name = "009", Location = "Point009"}
AddControlPoint{Name = "010", Location = "Point010"}
AddControlPoint{Name = "011", Location = "Point011"}
AddControlPoint{Name = "012", Location = "Point012"}
AddControlPoint{Name = "013", Location = "Point013"}
AddControlPoint{Name = "014", Location = "Point014"}
AddControlPoint{Name = "015", Location = "Point015"}
AddControlPoint{Name = "016", Location = "Point016"}
AddControlPoint{Name = "017", Location = "Point017"}
AddControlPoint{Name = "018", Location = "Point018"}
AddControlPoint{Name = "019", Location = "Point019"}
AddControlPoint{Name = "020", Location = "Point020"}
AddControlPoint{Name = "021", Location = "Point021"}
AddControlPoint{Name = "022", Location = "Point022"}
AddControlPoint{Name = "023", Location = "Point023"}

DailyJobParams
{
Loop = FALSCH,
Conditions = {
		IsNpcFlagTrue{Name = "SinwenWalkToEloni"},
	},
}


---Despawn wenn sie das Portal erreicht
OnOneTimeEvent
{
Conditions = 	{
		FigureInRange{ X = 100 , Y = 156 , NpcId = _NpcId , Range = 3}
		},
Actions =	{
		SetGlobalFlagTrue{Name = "SinwenHasLeftTheBuilding"},
		Vanish{NpcId = _NpcId}
		}
}






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p4\n1387_SinwenWhiteleaf.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagSinwenKnown"},
		},
		Actions = {
			Say{Tag = "sinwen001", String = "Wer seid Ihr?"},
			Answer{Tag = "sinwen001PC", String = "Ein Gesandter des Ordens auf dem Weg nach Shiel!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSinwenKnown"}),
		},
		Actions = {
			Say{Tag = "sinwen004", String = "Willkommen zurück!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sinwen002", String = "Dann kann ich Euch nur Elens Segen und alles Glück der Welt wünschen, Freund! Ihr werdet es brauchen!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSinwenKnown"},
			Say{Tag = "sinwen003", String = "Ich bin Sinwen! Willkommen im Schattenhain - einst einer der schönsten Gärten Elens!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen004PC", String = "Was ist geschehen, Sinwen?", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			QuestState{QuestId = 462 , State = StateActive},
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen009PC", String = "Eure Schwestern sind frei!", AnswerId = 10},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual}),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen011PC", String = "Wo werden Eure Schwestern gefangen gehalten?", AnswerId = 13},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			QuestState{QuestId = 77 , State = StateUnknown},
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen013PC", String = "Was ist das für ein Bannwerk, von dem Ihr spracht?", AnswerId = 16},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			QuestState{QuestId = 461 , State = StateActive},
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen014PC", String = "Ich habe die Bestandteile des Ringes gefunden!", AnswerId = 19},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			QuestState{QuestId = 460 , State = StateActive},
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen016PC", String = "Hier sind die Teile der Maske!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			IsNpcFlagTrue{Name = "NGSentence"},
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen018PC", String = "Was hat es mit diesem Nachtglanz auf sich?", AnswerId = 27},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			IsNpcFlagTrue{Name = "MaskSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sinwen021PC", String = "Eine Bannmaske?", AnswerId = 30},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagSinwenQuestion1"}),
			Negated(QuestState{QuestId = 462 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 24 , State = StateUnknown} , IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual})),
			Negated(QuestState{QuestId = 77 , State = StateUnknown}),
			Negated(QuestState{QuestId = 461 , State = StateActive}),
			Negated(QuestState{QuestId = 460 , State = StateActive}),
			Negated(IsNpcFlagTrue{Name = "NGSentence"}),
			Negated(IsNpcFlagTrue{Name = "MaskSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sinwen005", String = "Brannigans Horde treibt in diesen Landen schon lange ihr Unwesen! Doch früher waren sie nur gemeine Räuber und Diebe! Jetzt haben sie neue Waffen, neue Rüstungen - neue Befehlshaber!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sinwen006", String = "Ich war hier zu Gast, um die Reste für mein Bannwerk zu erwerben, als die Horden aus dem Osten wie eine Sturmflut über uns hereinbrachen! Sie brannten die Heimstatt nieder und erschlugen viele meiner Schwestern!"},
			Answer{Tag = "sinwen006PC", String = "Doch Ihr konntet fliehen?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sinwen007", String = "Oh, ich floh nicht vor dem Kampf, wenn Ihr das meint! Brannigan ließ einige von uns gefangensetzen. Als Geiseln, sollten die Schwestern aus Eloni Rache suchen!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sinwen008", String = "Sein Unterführer Ronk legte uns in Ketten... und wir wurden wie Vieh zur Schau gestellt! "},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSinwenQuestion1"},
			Say{Tag = "sinwen009", String = "Als ein Trupp Utraner ihre Lager angriff, konnte ich fliehen. Doch viele meiner Schwestern werden dort noch immer gefangen gehalten!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sinwen010", String = "Elen segne Euch! Auch wenn wir einen hohen Preis gezahlt haben... so müssen meine Schwestern nun wenigstens nicht in Gefangenschaft sterben!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 462} , QuestSolve{QuestId = 24},
					 SetRewardFlagTrue{ Name = "DieGeiseln"},
			Say{Tag = "sinwen011", String = "Hier! Nehmt dies als Dank, Runendiener! Unsere Wünsche und Gebete werden Euch begleiten!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sinwen012", String = "Im Lager nahe dem Portal nach Shiel! Seitdem die Utraner durchgebrochen sind, hat Ronk dort seine Truppen verstärkt! Meine Schwestern sind direkt vor seiner Unterkunft angekettet!"},
			Answer{Tag = "sinwen012PC", String = "Nicht mehr lange! Eure Schwestern werden bald frei sein, das verspreche ich Euch!", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 24 , SubQuestActivate = TRUE} , RevealUnExplored{X = 335 , Y = 239 , Range = 15},
			Say{Tag = "sinwen013", String = "Seht euch vor, Ronk ist grausam! Er wird sie eher töten, als sie freizugeben! Wenn Ihr sein Lager angreift, müsst Ihr schnell handeln!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sinwen014", String = "Es sind zwei besondere Gegenstände, die ich fertigen möchte. Zum einen ein Ring  - Nachtglanz! Ich hatte bereits alle Bestandteile dafür zusammen... Zum anderen eine Bannmaske!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 77} , SetNpcFlagTrue{Name = "NGSentence"} , SetNpcFlagTrue{Name = "MaskSentence"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sinwen015", String = "Sehr gut, wartet..."},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sinwen016", String = "Hier ist der Ring Nachtglanz für Euch."},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 2357 , Amount = 1, Flag = Give},
					TransferItem{TakeItem = 2191 , Amount = 1, Flag = Take},
					TransferItem{TakeItem = 2193 , Amount = 1, Flag = Take},
					TransferItem{TakeItem = 2194 , Amount = 1, Flag = Take},
					QuestSolve{QuestId = 461} , QuestSolve{QuestId = 78},
					SetRewardFlagTrue{ Name = "Bannwerk1"},
			QuestSolve{QuestId = 461} , QuestSolve{QuestId = 78},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sinwen017", String = "Ich werde sofort beginnen..."},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sinwen018", String = "Sie ist fertig! Hier, nehmt sie! Möge sie Euch allzeit schützen!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 2358 , Amount = 1 , Flag = Give},
					TransferItem{TakeItem = 2200 , Amount = 1, Flag = Take},
					TransferItem{TakeItem = 2201 , Amount = 1, Flag = Take},
					TransferItem{TakeItem = 2205 , Amount = 1, Flag = Take},
					QuestSolve{QuestId = 460} , QuestSolve{QuestId = 82},
					SetRewardFlagTrue{ Name = "Bannwerk2"},
			QuestSolve{QuestId = 460} , QuestSolve{QuestId = 82},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sinwen019", String = "Nachtglanz ist ein edler Ring aus dunklem Stein. Er wird aus Rauchquarz geformt! Anschließend werden Mondsilber und Sternenfeuer hineingewebt!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 78} , QuestBegin{QuestId = 79} , 
					QuestBegin{QuestId = 80} , QuestBegin{QuestId = 81} ,
					SetNpcFlagFalse{Name = "NGSentence"},
			Say{Tag = "sinwen020", String = "Er ist vor allem für Zauberer geeignet und bietet Schutz gegen Magie!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sinwen021", String = "Wenn Ihr mir die Bestandteile wiederbeschafft, so will ich ihn gerne als Dank für unsere Rettung für Euch fertigen!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sinwen022", String = "Sie ist nicht schwer herzustellen, wenn man die Bestandteile dafür hat! Ein Edelstein des ewigen Feuers wird gemahlen und mit der Essenz des Kriecherblutes auf einen Trollschädel aufgetragen..."},
			Answer{Tag = "sinwen022PC", String = "Das klingt nach dunkler Magie... Recht ungewöhnlich für eine Elfe...?", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sinwen023", String = "Die Kräfte der Natur und die Kräfte des Todes liegen manchmal eng beieinander! Der Tod ist auch nur ein Teil der Natur..."},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sinwen024", String = "Die Bannmaske eignet sich vor allem für Kämpfer! Sie schenkt ihnen Kraft und Schutz!"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 82} , QuestBegin{QuestId = 83} , 
				QuestBegin{QuestId = 84} , QuestBegin{QuestId = 85} , 
				SetNpcFlagFalse{Name = "MaskSentence"},
			Say{Tag = "sinwen025", String = "Wenn Ihr mir die Zutaten bringt, werde ich sie für Euch anfertigen! Das bin ich Euch schuldig!"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}


	EndDefinition()
end