-->INFO: Lev
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 4}
--!EDS ONIDLEGOHOME END




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p78\n3326_Lev.txt


	

	OnBeginDialog{
		Conditions = {
			QuestState{QuestId = 474 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(QuestState{QuestId = 474 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "lev008", String = "Ich hätte bei meinen...Büchern bleiben sollen..."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "Q473LevTalked"}),
		},
		Actions = {
			Say{Tag = "lev007", String = "Danke für die Heilung!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagFalse{Name = "Q473LevTalked"},
		},
		Actions = {
			Say{Tag = "lev001", String = "Ich danke Dir, Tahira! Ohne Dich, wäre ich verloren gewesen! Aonir sei Dank, dass Caele Dich gefunden hat!"},
			Answer{Tag = "lev001PC", String = "Was ist überhaupt geschehen? Ihr seid auf der Suche nach einer Rune?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lev002", String = "Ja, eine besondere Rune! Rohen ist sich sicher, dass sie irgendwo in den Ruinen von Ankbrand liegen muss!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lev003", String = "Aber die Ruinen wimmeln nur so vor Orks! Wir mussten fliehen! Nur Joshua gelang es, sich zu verstecken!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lev004", String = "Caele wusste, wo Dein Haus steht! Deshalb haben wir uns bis zu Dir durchgeschlagen! Bitte, Du musst uns helfen!"},
			Answer{Tag = "lev004PC", String = "Hm... schön, ich werde Eure Rune holen! Du bleibst hier und erholst Dich erst einmal!", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lev005", String = "Wie Du befiehlst! Pass auf Dich auf, Tahira!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lev011", String = "Hier, diese Zauberspruchrolle habe ich von einem der Orks erbeutet. Vielleicht kann sie dir nützlich sein."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lev006", String = "Folge immer dem Weg! Vielleicht trifft Du irgendwo auf Joshua! Mögen die Götter geben, dass er noch lebt!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q473LevTalked"} , QuestBegin{QuestId = 475} , TransferItem{GiveItem = 1984, Flag = Give}, TransferXP{XP = 100, Flag = Give},
			EndDialog(),
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
			Say{Tag = "lev009", String = "Ich... hoffe, Du hast Deine Heilkunst nicht... verlernt, Tahira... Hilf mir..."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q473LevBeggedForHeal"},
			Say{Tag = "lev010", String = "Bitte! Heile mich...!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end