-->INFO: Seth
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


KillOnDominate{NpcId = self}


OnOneTimeEvent
{
	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11175"},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		QuestState{QuestId = 1020, State = StateActive},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11175"}
	}
}


OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 3,
	Conditions =
	{
		Negated(IsNpcFlagTrue{Name = "npc_202_GoHomeAndDespawn"}),
	},
}


OnIdleGoHome
{
	WalkMode = Run, X = 169, Y = 261, Direction = 3,
	Conditions =
	{
		IsNpcFlagTrue{Name = "npc_202_GoHomeAndDespawn"},
	},
	HomeActions =
	{
		SetNpcFlagTrue{Name = "npc_202_Despawn"},
	},
}

Despawn
{
	Conditions =
	{
		IsNpcFlagTrue{Name = "npc_202_Despawn"},
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n11175_Seth.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagTrue{Name = "Known"},
		},
		Actions = {
			Say{Tag = "sethP204_001", String = "Ach, verdammter Husten ..."},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "Known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{4;
		Conditions = {
			IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"},
		},
		Actions = {
			Say{Tag = "sethP204_002", String = "Na, wenn das nicht der Runenkrieger ist! Wie ist es Euch ergangen, seit unserem kleinen Meisterstück in Farlorns Heim? (Hustet)"},
			Answer{Tag = "sethP204_003PC", String = "Ich habe bessere Zeiten gesehen. Aber Ihr wohl auch?", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"}),
		},
		Actions = {
			Say{Tag = "sethP204_005", String = "Lasst mich zufrieden! (Hustet)"},
			Answer{Tag = "sethP204_006PC", String = "Ihr seid Seth Dundred?", AnswerId = 8},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_004", String = "Ach, das ist nichts! (Hustet)"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "sethP204_008PC", String = "Seth, ich habe ein Geschenk für Euch ...", AnswerId = 11},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_007", String = "Hört Ihr nicht, Ihr sollt mich zufrieden lassen!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			QuestBegin{QuestId = 1019},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "sethP204_008PC", String = "Seth, ich habe ein Geschenk für Euch ...", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_009", String = "Nein! Ihr arbeitet für diesen Puppenspieler!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_010", String = "Ich kann diesen verdammten Auftrag nicht durchführen! Bitte! Veschont mich! Ich will nicht gegen einen Runenkrieger kämpfen!"},
			Answer{Tag = "", String = "", AnswerId = 13},
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
			QuestState{QuestId = 1020, State = StateActive},
			QuestState{QuestId = 1020, State = StateActive},
			UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_011PC", String = "Tut mir leid, Seth, Ihr müsst sterben.", AnswerId = 15},
			OfferAnswer{Tag = "sethP204_013PC", String = "Warum könnt Ihr den Auftrag nicht ausführen?", AnswerId = 20},
			OfferAnswer{Tag = "sethP204_026PC", String = "Yrmir hat sein Geschenk bekommen!", AnswerId = 35},
			OfferAnswer{Tag = "sethP204_032PC", String = "Jetzt solltet Ihr Euren Husten behandeln lassen!", AnswerId = 41},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 1020, State = StateActive},
			QuestState{QuestId = 1020, State = StateActive},
			UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_011PC", String = "Tut mir leid, Seth, Ihr müsst sterben.", AnswerId = 15},
			OfferAnswer{Tag = "sethP204_013PC", String = "Warum könnt Ihr den Auftrag nicht ausführen?", AnswerId = 20},
			OfferAnswer{Tag = "sethP204_026PC", String = "Yrmir hat sein Geschenk bekommen!", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 1020, State = StateActive},
			QuestState{QuestId = 1020, State = StateActive},
			Negated(UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_011PC", String = "Tut mir leid, Seth, Ihr müsst sterben.", AnswerId = 15},
			OfferAnswer{Tag = "sethP204_013PC", String = "Warum könnt Ihr den Auftrag nicht ausführen?", AnswerId = 20},
			OfferAnswer{Tag = "sethP204_032PC", String = "Jetzt solltet Ihr Euren Husten behandeln lassen!", AnswerId = 41},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 1020, State = StateActive},
			QuestState{QuestId = 1020, State = StateActive},
			Negated(UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_011PC", String = "Tut mir leid, Seth, Ihr müsst sterben.", AnswerId = 15},
			OfferAnswer{Tag = "sethP204_013PC", String = "Warum könnt Ihr den Auftrag nicht ausführen?", AnswerId = 20},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 1020, State = StateActive},
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_011PC", String = "Tut mir leid, Seth, Ihr müsst sterben.", AnswerId = 15},
			OfferAnswer{Tag = "sethP204_026PC", String = "Yrmir hat sein Geschenk bekommen!", AnswerId = 35},
			OfferAnswer{Tag = "sethP204_032PC", String = "Jetzt solltet Ihr Euren Husten behandeln lassen!", AnswerId = 41},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 1020, State = StateActive},
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_011PC", String = "Tut mir leid, Seth, Ihr müsst sterben.", AnswerId = 15},
			OfferAnswer{Tag = "sethP204_026PC", String = "Yrmir hat sein Geschenk bekommen!", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 1020, State = StateActive},
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			Negated(UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_011PC", String = "Tut mir leid, Seth, Ihr müsst sterben.", AnswerId = 15},
			OfferAnswer{Tag = "sethP204_032PC", String = "Jetzt solltet Ihr Euren Husten behandeln lassen!", AnswerId = 41},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 1020, State = StateActive},
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			Negated(UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_011PC", String = "Tut mir leid, Seth, Ihr müsst sterben.", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			QuestState{QuestId = 1020, State = StateActive},
			UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_013PC", String = "Warum könnt Ihr den Auftrag nicht ausführen?", AnswerId = 20},
			OfferAnswer{Tag = "sethP204_026PC", String = "Yrmir hat sein Geschenk bekommen!", AnswerId = 35},
			OfferAnswer{Tag = "sethP204_032PC", String = "Jetzt solltet Ihr Euren Husten behandeln lassen!", AnswerId = 41},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			QuestState{QuestId = 1020, State = StateActive},
			UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_013PC", String = "Warum könnt Ihr den Auftrag nicht ausführen?", AnswerId = 20},
			OfferAnswer{Tag = "sethP204_026PC", String = "Yrmir hat sein Geschenk bekommen!", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			QuestState{QuestId = 1020, State = StateActive},
			Negated(UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_013PC", String = "Warum könnt Ihr den Auftrag nicht ausführen?", AnswerId = 20},
			OfferAnswer{Tag = "sethP204_032PC", String = "Jetzt solltet Ihr Euren Husten behandeln lassen!", AnswerId = 41},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			QuestState{QuestId = 1020, State = StateActive},
			Negated(UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_013PC", String = "Warum könnt Ihr den Auftrag nicht ausführen?", AnswerId = 20},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_026PC", String = "Yrmir hat sein Geschenk bekommen!", AnswerId = 35},
			OfferAnswer{Tag = "sethP204_032PC", String = "Jetzt solltet Ihr Euren Husten behandeln lassen!", AnswerId = 41},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_026PC", String = "Yrmir hat sein Geschenk bekommen!", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			Negated(UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_032PC", String = "Jetzt solltet Ihr Euren Husten behandeln lassen!", AnswerId = 41},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			Negated(UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_012", String = "Verdammt! (Hustet) Dann sei es drum! Jetzt oder in ein paar Jahren, ist doch gleich! Kommt her!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			ChangeRace{Race = 121, NpcId = self},
					   QuestSolve{QuestId = 1019},
			RemoveDialog{NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_014", String = "Ich soll diesen verdammten General Yrmir aus dem Weg räumen! Das ist völlig unmöglich! Er wird ständig von Palastwachen eskortiert!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_015", String = "Und ich bin nicht eben in guter Form (hustet)... ein verdammter Briarwolf hat mir mit seiner Armbrust ein Loch in die Brust geschossen, seitdem habe ich diesen verdammten Husten!"},
			Answer{Tag = "sethP204_016PC", String = "Stimmt, mit diesem Husten schleicht es sich nicht eben gut.", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_017", String = "Ja! ich hatte einfach Pech versteht Ihr! Kann doch jedem mal passieren! Ich dachte die Wärme hier würde den Husten lindern ... und ich wollte nur ein paar Goldstücke verdienen ..."},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_018", String = "Und dann gleich so ein Auftrag! Verdammtes Pech! (Hustet)"},
			OfferAnswer{Tag = "sethP204_019PC", String = "Ja, verdammtes Pech. Zeit zu sterben, Seth!", AnswerId = 24},
			OfferAnswer{Tag = "sethP204_020PC", String = "Kann Ich Euch helfen?", AnswerId = 28},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_021", String = "Vielleicht lässt mich der Puppenspieler am Leben ...(hustet) wenn jemand den Auftrag ausführt! Ihr müsst Yrmir töten und Eure blaue Rose bei der Leiche lassen!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_022", String = "Yrmir ist oben in der Garnison im Ostflügel des Palastes! Es wird nicht leicht, es sind ständig Wachen bei ihm! Und ich meine keine gelangweilten Nichtskönner, das sind Elitekämpfer!"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_023", String = "Aber zu aller erst müsst Ihr einen Weg in die Garnison finden! Nutzt die Deckungen, die sich bieten, (hustet) auch wenn es nicht viele sind!"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_024", String = "Hier, mit diesem Schlüssel werdet Ihr das Tor öffnen können."},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_025", String = "Das ist ein Auftrag für einen Meisterassassinen! Oder für einen Wahnsinnigen! Viel Glück, ich warte hier auf Euch!"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			QuestChangeState{QuestId = 1020, State = StateUnsolvable},
							QuestSolve{QuestId = 1019},
							QuestBegin{QuestId = 1021},
							SetGlobalFlagTrue{Name = "g_P204_YrmirRespawn"}
							,
			TransferItem{GiveItem = 7325 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_027", String = "Ich weiß nicht ob Ihr nun verdammt gut oder verdammt wahnsinnig seid! Aber Ihr habt es geschafft!"},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_028", String = "Das vergesse ich Euch nie! Und ich glaube die Leute hier sind auch froh, diesen Bluthund Yrmir endlich los zu sein!"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_029", String = "Geht zurück zum Puppenspieler! Berichtet ihm! Vielleicht hebt er den Blutbann gegen mich auf!"},
			Answer{Tag = "sethP204_030PC", String = "Ihr solltet trotzdem von hier verschwinden.", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_031", String = "Da könnt Ihr Gift drauf nehmen! (Hustet) Danke nochmal, Freund! ich wünschte ich könnte Euch entlohnen! Lebt wohl!"},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 1022},
										 QuestBegin{QuestId = 1023},
										 SetNpcFlagTrue{Name = "SethSolved"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[35]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_033", String = "Leider ist das mit einem Verband und ein paar Wadenwickeln nicht getan! Ich müsste (hustet) einen teuren Heiler aufsuchen!"},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
			PlayerHasMoney{Gold = 2000},
		},
		Actions = {
			Say{Tag = "sethP204_034", String = "Deswegen habe ich ja diesen verdammten Auftrag angenommen! Die Belohnung wären nämlich die 2000 Gold gewesen, die ich brauche!"},
			OfferAnswer{Tag = "sethP204_035PC", String = "Dann nehmt meine 2000 Gold und kuriert Euch aus!", AnswerId = 43},
			OfferAnswer{Tag = "sethP204_041PC", String = "Ich kann leider nicht helfen, ich habe keine 2000 Gold!", AnswerId = 47},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(PlayerHasMoney{Gold = 2000}),
		},
		Actions = {
			Say{Tag = "sethP204_034", String = "Deswegen habe ich ja diesen verdammten Auftrag angenommen! Die Belohnung wären nämlich die 2000 Gold gewesen, die ich brauche!"},
			OfferAnswer{Tag = "sethP204_041PC", String = "Ich kann leider nicht helfen, ich habe keine 2000 Gold!", AnswerId = 47},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_036", String = "Das ... kann ich nicht annehmen!"},
			Answer{Tag = "sethP204_037PC", String = "Nun nehmt es, bevor ich es mir anders überlege!", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_038", String = "So etwas hat noch nie jemand für mich getan! Ich ... ich ..."},
			Answer{Tag = "sethP204_039PC", String = "Nun geht schon, alter Haudegen!", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_040", String = "Danke, Runenkrieger! Mögen die Götter Euch schützen, an welche auch immer Ihr glaubt!"},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			TransferMoney{Gold = 2000, Flag = Take},
										SetRewardFlagTrue { Name = "SQSethHealed" },
										SetNpcFlagTrue{Name = "npc_202_GoHomeAndDespawn"},
			RemoveDialog{NpcId = self},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_042", String = "Macht Euch keine Gedanken, ich komme schon klar! (hustet)"},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_043", String = "Ich muss nur etwas ausruhen und nachdenken, mir fällt schon was ein! (hustet) ..."},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sethP204_044", String = "Verzeiht, worüber sprachen wir gerade?"},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
			QuestState{QuestId = 1020, State = StateActive},
			QuestState{QuestId = 1020, State = StateActive},
			UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_011PC", String = "Tut mir leid, Seth, Ihr müsst sterben.", AnswerId = 15},
			OfferAnswer{Tag = "sethP204_013PC", String = "Warum könnt Ihr den Auftrag nicht ausführen?", AnswerId = 20},
			OfferAnswer{Tag = "sethP204_026PC", String = "Yrmir hat sein Geschenk bekommen!", AnswerId = 35},
			OfferAnswer{Tag = "sethP204_032PC", String = "Jetzt solltet Ihr Euren Husten behandeln lassen!", AnswerId = 41},
		}}

	OnAnswer{52;
		Conditions = {
			QuestState{QuestId = 1020, State = StateActive},
			QuestState{QuestId = 1020, State = StateActive},
			UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_011PC", String = "Tut mir leid, Seth, Ihr müsst sterben.", AnswerId = 15},
			OfferAnswer{Tag = "sethP204_013PC", String = "Warum könnt Ihr den Auftrag nicht ausführen?", AnswerId = 20},
			OfferAnswer{Tag = "sethP204_026PC", String = "Yrmir hat sein Geschenk bekommen!", AnswerId = 35},
		}}

	OnAnswer{52;
		Conditions = {
			QuestState{QuestId = 1020, State = StateActive},
			QuestState{QuestId = 1020, State = StateActive},
			Negated(UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_011PC", String = "Tut mir leid, Seth, Ihr müsst sterben.", AnswerId = 15},
			OfferAnswer{Tag = "sethP204_013PC", String = "Warum könnt Ihr den Auftrag nicht ausführen?", AnswerId = 20},
			OfferAnswer{Tag = "sethP204_032PC", String = "Jetzt solltet Ihr Euren Husten behandeln lassen!", AnswerId = 41},
		}}

	OnAnswer{52;
		Conditions = {
			QuestState{QuestId = 1020, State = StateActive},
			QuestState{QuestId = 1020, State = StateActive},
			Negated(UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_011PC", String = "Tut mir leid, Seth, Ihr müsst sterben.", AnswerId = 15},
			OfferAnswer{Tag = "sethP204_013PC", String = "Warum könnt Ihr den Auftrag nicht ausführen?", AnswerId = 20},
		}}

	OnAnswer{52;
		Conditions = {
			QuestState{QuestId = 1020, State = StateActive},
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_011PC", String = "Tut mir leid, Seth, Ihr müsst sterben.", AnswerId = 15},
			OfferAnswer{Tag = "sethP204_026PC", String = "Yrmir hat sein Geschenk bekommen!", AnswerId = 35},
			OfferAnswer{Tag = "sethP204_032PC", String = "Jetzt solltet Ihr Euren Husten behandeln lassen!", AnswerId = 41},
		}}

	OnAnswer{52;
		Conditions = {
			QuestState{QuestId = 1020, State = StateActive},
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_011PC", String = "Tut mir leid, Seth, Ihr müsst sterben.", AnswerId = 15},
			OfferAnswer{Tag = "sethP204_026PC", String = "Yrmir hat sein Geschenk bekommen!", AnswerId = 35},
		}}

	OnAnswer{52;
		Conditions = {
			QuestState{QuestId = 1020, State = StateActive},
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			Negated(UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_011PC", String = "Tut mir leid, Seth, Ihr müsst sterben.", AnswerId = 15},
			OfferAnswer{Tag = "sethP204_032PC", String = "Jetzt solltet Ihr Euren Husten behandeln lassen!", AnswerId = 41},
		}}

	OnAnswer{52;
		Conditions = {
			QuestState{QuestId = 1020, State = StateActive},
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			Negated(UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_011PC", String = "Tut mir leid, Seth, Ihr müsst sterben.", AnswerId = 15},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			QuestState{QuestId = 1020, State = StateActive},
			UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_013PC", String = "Warum könnt Ihr den Auftrag nicht ausführen?", AnswerId = 20},
			OfferAnswer{Tag = "sethP204_026PC", String = "Yrmir hat sein Geschenk bekommen!", AnswerId = 35},
			OfferAnswer{Tag = "sethP204_032PC", String = "Jetzt solltet Ihr Euren Husten behandeln lassen!", AnswerId = 41},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			QuestState{QuestId = 1020, State = StateActive},
			UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_013PC", String = "Warum könnt Ihr den Auftrag nicht ausführen?", AnswerId = 20},
			OfferAnswer{Tag = "sethP204_026PC", String = "Yrmir hat sein Geschenk bekommen!", AnswerId = 35},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			QuestState{QuestId = 1020, State = StateActive},
			Negated(UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_013PC", String = "Warum könnt Ihr den Auftrag nicht ausführen?", AnswerId = 20},
			OfferAnswer{Tag = "sethP204_032PC", String = "Jetzt solltet Ihr Euren Husten behandeln lassen!", AnswerId = 41},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			QuestState{QuestId = 1020, State = StateActive},
			Negated(UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_013PC", String = "Warum könnt Ihr den Auftrag nicht ausführen?", AnswerId = 20},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_026PC", String = "Yrmir hat sein Geschenk bekommen!", AnswerId = 35},
			OfferAnswer{Tag = "sethP204_032PC", String = "Jetzt solltet Ihr Euren Husten behandeln lassen!", AnswerId = 41},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} ),
			Negated(IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_026PC", String = "Yrmir hat sein Geschenk bekommen!", AnswerId = 35},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			Negated(UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sethP204_032PC", String = "Jetzt solltet Ihr Euren Husten behandeln lassen!", AnswerId = 41},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			Negated(QuestState{QuestId = 1020, State = StateActive}),
			Negated(UND( QuestState{QuestId = 1021, State = StateSolved}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[35]Abgeschaltet"} )),
			Negated(IsNpcFlagTrue{Name = "SethSolved" , UpdateInterval = 5}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end