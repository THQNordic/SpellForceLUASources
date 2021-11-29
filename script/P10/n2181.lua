-->INFO: Bron
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = West}
--!EDS ONIDLEGOHOME END


--!EDS RESPAWN BEGIN
Respawn{WaitTime=3}
--!EDS RESPAWN END


--initial
OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetDialogType{Type = SideQuest}
		}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p10\n2181_Bron.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagBronKnown"},
		},
		Actions = {
			Say{Tag = "bron001", String = "Na sowas, ein menschliches Gesicht!"},
			Answer{Tag = "bron001PC", String = "Bei der Gastfreundschaft der Zwerge wundert es mich nicht, dass Ihr so selten eins zu sehen bekommt! Lebt Ihr hier?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBronKnown"}),
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			QuestState{QuestId = 156 , State = StateActive},
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "bron003", String = "Ah, Ihr wieder!"},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBronKnown"}),
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			QuestState{QuestId = 156 , State = StateActive},
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "bron003", String = "Ah, Ihr wieder!"},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBronKnown"}),
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "bron003", String = "Ah, Ihr wieder!"},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBronKnown"}),
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "bron003", String = "Ah, Ihr wieder!"},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBronKnown"}),
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			QuestState{QuestId = 156 , State = StateActive},
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "bron003", String = "Ah, Ihr wieder!"},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBronKnown"}),
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			QuestState{QuestId = 156 , State = StateActive},
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "bron003", String = "Ah, Ihr wieder!"},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBronKnown"}),
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "bron003", String = "Ah, Ihr wieder!"},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBronKnown"}),
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "bron003", String = "Ah, Ihr wieder!"},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			QuestState{QuestId = 156 , State = StateActive},
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBronKnown"},
			Say{Tag = "bron002", String = "Aye! Ich bin Bron Gonnar! Meine Familie züchtet hier seit vier Generationen Rinder!"},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			QuestState{QuestId = 156 , State = StateActive},
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBronKnown"},
			Say{Tag = "bron002", String = "Aye! Ich bin Bron Gonnar! Meine Familie züchtet hier seit vier Generationen Rinder!"},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBronKnown"},
			Say{Tag = "bron002", String = "Aye! Ich bin Bron Gonnar! Meine Familie züchtet hier seit vier Generationen Rinder!"},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBronKnown"},
			Say{Tag = "bron002", String = "Aye! Ich bin Bron Gonnar! Meine Familie züchtet hier seit vier Generationen Rinder!"},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			QuestState{QuestId = 156 , State = StateActive},
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBronKnown"},
			Say{Tag = "bron002", String = "Aye! Ich bin Bron Gonnar! Meine Familie züchtet hier seit vier Generationen Rinder!"},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			QuestState{QuestId = 156 , State = StateActive},
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBronKnown"},
			Say{Tag = "bron002", String = "Aye! Ich bin Bron Gonnar! Meine Familie züchtet hier seit vier Generationen Rinder!"},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBronKnown"},
			Say{Tag = "bron002", String = "Aye! Ich bin Bron Gonnar! Meine Familie züchtet hier seit vier Generationen Rinder!"},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBronKnown"},
			Say{Tag = "bron002", String = "Aye! Ich bin Bron Gonnar! Meine Familie züchtet hier seit vier Generationen Rinder!"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bron004", String = "Diese Bestie! Spaziert hier einfach herum und stiehlt sich ein Tier nach dem anderen! Als wäre nichts dabei! Und man kann nichts dagegen tun! Gar nichts!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bron005", String = "Selbst die Zwerge werden nicht mit ihm fertig - und das will schon was heißen! Niethalfs Hammer möge ihn treffen und zerschmettern!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "GiantQuestion"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			QuestState{QuestId = 156 , State = StateActive},
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{5;
		Conditions = {
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			QuestState{QuestId = 156 , State = StateActive},
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{5;
		Conditions = {
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			QuestState{QuestId = 156 , State = StateActive},
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			QuestState{QuestId = 156 , State = StateActive},
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bron006", String = "So wie Ihr Euch anhört, wollt Ihr dafür nichts bezahlen!"},
			Answer{Tag = "bron006PC", String = "Es dient einem guten Zweck! Gebt es mir und Ihr habt die längste Zeit Probleme mit Hörgr gehabt!", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bron007", String = "Verdammt, das soll mir eine halbe Herde wert sein! Hier, nehmt!"},
			Answer{Tag = "bron007PC", String = "Danke! Nun etwas von dieser Flüssigkeit hinzu...", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bron008", String = "Ah, ich verstehe! Gift ins Fleisch! Das wird Hörgr schlecht bekommen!"},
			Answer{Tag = "bron008PC", String = "Das hoffe ich! Wünscht mir Glück, dass er den Tausch nicht bemerkt!", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bron009", String = "Dann alles Glück der Welt für Euch, Freund!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 2485 , Amount = 1 , Flag = Give} , 
					TransferItem{TakeItem = 2487 , Amount = 1 , Flag = Take} , 
					QuestSolve{QuestId = 156} , QuestBegin{QuestId = 157},
			TransferXP{XP = 50 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			QuestState{QuestId = 156 , State = StateActive},
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			QuestState{QuestId = 156 , State = StateActive},
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
		}}

	OnAnswer{11;
		Conditions = {
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			QuestState{QuestId = 156 , State = StateActive},
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			QuestState{QuestId = 156 , State = StateActive},
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "bron009PCa", String = "Ich habe ein Wolfjunges gefunden! Es ist kurz vor dem Verhungern! Zu schwach, um sich noch zu bewegen...", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bron010", String = "So? Dann füttern wir ihn also durch, damit er später, wenn er wieder bei Kräften ist, meine Herde reißt, ja?"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(PlayerHasMoney{Amount = 1000}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "bron011PC", String = "Redet keinen Unsinn! Ich bezahle Euch dafür! Ich habe nur gerade nicht genug Geld bei mir!", AnswerId = 18},
		}}

	OnAnswer{14;
		Conditions = {
			PlayerHasMoney{Amount = 1000},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "bron010PC", String = "Redet keinen Unsinn! Ich bezahle Euch dafür! Hier, nehmt diese Münzen und gebt mir ein gutes Stück!", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bron011", String = "Nun, ich kann Euch schwerlich verbieten, was Ihr mit ehrlich erworbenem Fleisch anstellt! Hier nehmt..."},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 2513 , Amount = 1 , Flag = Give} , 
					TransferXP{XP = 30 , Flag = Give} , 
					TransferMoney{Silver = 10 , Flag = Take},
					SetPlayerFlagTrue{Name = "HasBeef"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			QuestState{QuestId = 156 , State = StateActive},
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{17;
		Conditions = {
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			QuestState{QuestId = 156 , State = StateActive},
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
		}}

	OnAnswer{17;
		Conditions = {
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{17;
		Conditions = {
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			QuestState{QuestId = 156 , State = StateActive},
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			QuestState{QuestId = 156 , State = StateActive},
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bron012", String = "Dann kommt wieder, wenn Ihr 10 Silber beisammen habt! Das ist der Preis für ein Stück Fleisch!"},
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
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			QuestState{QuestId = 156 , State = StateActive},
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{20;
		Conditions = {
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			QuestState{QuestId = 156 , State = StateActive},
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
		}}

	OnAnswer{20;
		Conditions = {
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{20;
		Conditions = {
			UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"}),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron003PC", String = "Man sagt, ein Riese stiehlt Euer Vieh?", AnswerId = 2},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			QuestState{QuestId = 156 , State = StateActive},
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			QuestState{QuestId = 156 , State = StateActive},
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron005PC", String = "Ich brauche ein Stück Eures besten Fleisches!", AnswerId = 6},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bron009PC", String = "Ich muss Euch um etwas Fleisch bitten!", AnswerId = 12},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(UND(QuestState{QuestId = 148 , State = StateActive} , IsNpcFlagFalse{Name = "GiantQuestion"})),
			Negated(QuestState{QuestId = 156 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 163 , State = StateActive} , IsPlayerFlagFalse{Name = "HasBeef"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end