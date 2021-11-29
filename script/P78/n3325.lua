-->INFO: Joshua
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 3,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "3325_IdleOff"},
	},
}

OnOneTimeEvent
{
	Actions = {
		RemoveDialog{},	-- erst anschalten wenn man ihn überhaupt ansprechen soll vom tutorial her
	},
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p78\n3325_Joshua.txt


	

	OnBeginDialog{
		Conditions = {
			QuestState{QuestId = 475 , State = StateActive},
		},
		Actions = {
			Say{Tag = "joshua001", String = "Tahira! Die anderen haben Dich also gefunden!"},
			Answer{Tag = "joshua001PC", String = "Ja, sie sind wohlauf! Hast Du herausfinden können, wo die Rune ist, Joshua?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(QuestState{QuestId = 475 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "joshua002", String = "Im Lager der Orks! Ich glaube, ihr Anführer trägt sie bei sich!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "joshua003", String = "Sieh Dich vor, diese Biester sind zäh! Du wirst Dich gut vorbereiten müssen!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "joshua004", String = "Wenn Du sie besiegt hast, dann bring die Rune zu mir! Ich werde sie Meister Rohen übergeben!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 476} , QuestBegin{QuestId = 477} , QuestSolve{QuestId = 475},
			EndDialog(),
		}}

	OnAnswer{5;
		Conditions = {
			ODER(QuestState{QuestId = 476 , State = StateActive} , QuestState{QuestId = 477 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "joshua005", String = "Du musst den Anführer der Orks erledigen! Bring die Rune zu mir, sobald Du sie gefunden hast!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(ODER(QuestState{QuestId = 476 , State = StateActive} , QuestState{QuestId = 477 , State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{7;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3240}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{7;
		Conditions = {
			PlayerHasItem{ItemId = 3240},
		},
		Actions = {
			Say{Tag = "joshua006", String = "Bei Zarachs verfluchten Augen! Die Rune! Du hast es geschafft!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "joshua007", String = "Auch wenn ich den Anblick eines Runenkriegers nur schwer ertrage - niemand sonst hätte das je vollbringen können!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "joshua008", String = "Meister Rohen wird erleichtert sein!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 478} , QuestSolve{QuestId = 473} , TransferItem{TakeItem = 3240 , Amount = 1 , Flag = Take}, TransferXP{XP = 2222, Flag = Give},
			EndDialog(),
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "JoshTurorialOver"}),
		},
		Actions = {
			Say{Tag = "joshua010", String = "Es wird langsam Zeit für mich aufzubrechen! Es war gut, wieder an Deiner Seite zu kämpfen!"},
			Answer{Tag = "joshua010PC", String = "Komm, ich begleite Dich zum Portal!", AnswerId = 13},
		}}

	OnAnswer{11;
		Conditions = {
			IsGlobalFlagFalse{Name = "JoshTurorialOver"},
		},
		Actions = {
			Say{Tag = "joshua009", String = "Ich werde noch kurz meine Kräfte sammeln und dann aufbrechen!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "JoshTutorialGotoPortal"} , RemoveDialog{},
			EndDialog(),
		}}


	EndDefinition()
end