-->INFO: Sick_Hermit
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

REM = [[

OnOneTimeEvent
{
Conditions = {
		IsGlobalFlagTrue{Name = "PreviewVersion"}
			},
Actions = {
		RemoveDialog{}
		}
}
]]


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p63\n2865_Sick_Hermit.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagSickHermitKnown"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FlagSickHermitKnown"}),
		},
		Actions = {
			Say{Tag = "sickHermit003", String = "Ein Wanderer... in dieser Wildnis...?"},
			Answer{Tag = "sickHermit003PC", String = "Ihr seht schwach aus!", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q358HermitToldAboutHisLife"}),
		},
		Actions = {
			Say{Tag = "sickHermit002", String = "Der Trank? Habt Ihr den Trank?"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q358HermitToldAboutHisLife"},
		},
		Actions = {
			Say{Tag = "sickHermit001", String = "Habt Ihr sie gefunden? Habt Ihr mein Haar? Ihr Götter, erlöst mich!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			PlayerHasItem{ItemId = 2903},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sickHermit014PC", String = "Hier, nehmt Eure Locke zurück! Ihr seid frei!", AnswerId = 17},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2903}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
			PlayerHasItem{ItemId = 2900},
			PlayerHasItem{ItemId = 2901},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sickHermit007PCa", String = "Ich habe den Zirfartrank!", AnswerId = 9},
			OfferAnswer{Tag = "sickHermit010", String = "Nehmt diesen schmerzlindernden Trank!", AnswerId = 12},
		}}

	OnAnswer{3;
		Conditions = {
			PlayerHasItem{ItemId = 2900},
			Negated(PlayerHasItem{ItemId = 2901}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sickHermit007PCa", String = "Ich habe den Zirfartrank!", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2900}),
			PlayerHasItem{ItemId = 2901},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sickHermit010", String = "Nehmt diesen schmerzlindernden Trank!", AnswerId = 12},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2900}),
			Negated(PlayerHasItem{ItemId = 2901}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sickHermit004", String = "Schwach, ja... Schwäche wohnt in meinen Gliedern seit jenem Tag... als diese Krankheit mich niederschlug..."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sickHermit005", String = "Möge Euch niemals etwas Ähnliches widerfahren... nichts kann meine Qualen lindern..."},
			Answer{Tag = "sickHermit005PC", String = "Ihr meint, Euer Leiden ist unheilbar?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sickHermit006", String = "Nun, der Zirfartrank... er kann diese... Krankheit heilen! Doch er ist selten und kostbar... Shan Muir, die Heilerin von Liannon... sie könnte ihn brauen... aber sie... ach...!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sickHermit007", String = "Vielleicht könnt Ihr mir helfen? Bittet Shan Muir um einen Zirfartrank! Euch wird sie anhören!"},
			Answer{Tag = "sickHermit007PC", String = "Ich werde sehen, was ich tun kann!", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			PlayerHasItem{ItemId = 2900},
			PlayerHasItem{ItemId = 2901},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSickHermitKnown"},
					 QuestBegin{QuestId = 358},
					 QuestBegin{QuestId = 359},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sickHermit007PCa", String = "Ich habe den Zirfartrank!", AnswerId = 9},
			OfferAnswer{Tag = "sickHermit010", String = "Nehmt diesen schmerzlindernden Trank!", AnswerId = 12},
		}}

	OnAnswer{8;
		Conditions = {
			PlayerHasItem{ItemId = 2900},
			Negated(PlayerHasItem{ItemId = 2901}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSickHermitKnown"},
					 QuestBegin{QuestId = 358},
					 QuestBegin{QuestId = 359},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sickHermit007PCa", String = "Ich habe den Zirfartrank!", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2900}),
			PlayerHasItem{ItemId = 2901},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSickHermitKnown"},
					 QuestBegin{QuestId = 358},
					 QuestBegin{QuestId = 359},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sickHermit010", String = "Nehmt diesen schmerzlindernden Trank!", AnswerId = 12},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2900}),
			Negated(PlayerHasItem{ItemId = 2901}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagSickHermitKnown"},
					 QuestBegin{QuestId = 358},
					 QuestBegin{QuestId = 359},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sickHermit008", String = "Sprecht Ihr die Wahrheit...? Tatsächlich! Rasch... gebt ihn mir! Ahhhh... meine Kräfte kehren zurück!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 365},
 						   QuestBegin{QuestId = 366},
 						   TransferItem{TakeItem = 2900 , GiveItem = 0 , Flag = Take},
 						   SetRewardFlagTrue{ Name = "SickHermit1Zirfar"},
 						   RemoveDialog{NpcId = self},
 						   ChangeRace{Race = 150 , NpcId = self},
 						   EndDialog{},
			Say{Tag = "sickHermit009", String = "Ihr habt mir einen großen Dienst erwiesen, fremder Wanderer! Als Dank schenke ich Euch auch einen besonders raschen Tod!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sickHermit011", String = "Nein... nein, geht weg damit! Das wird meine Qualen nur hinauszögern! Ihr versteht nicht...! Niemand versteht mich! Ich muss..."},
			Answer{Tag = "sickHermit011PC", String = "Was müsst Ihr? Was ist mit Euch?", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sickHermit012", String = "Man sagt, ich sei ein Mörder! Vielleicht bin ich das, doch ich bin es nicht aus freien Stücken! Einst verfiel ich dem Bann einer Dryade! Ein grausamer Zauber, wunderschön... und doch kalt und verzehrend wie der Frost! Sie schenkte mir Stunden..."},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sickHermit013", String = "Ich kann es nicht beschreiben... Doch eines Nachts stahl sie mir eine Locke meines Haars! Seither bindet uns ein Pakt! Ihr Hass brennt in meiner Brust! Männer sind Rivalen, Frauen fordern ihre Schönheit heraus... alle müssen sterben, alle!"},
			Answer{Tag = "sickHermit013PC", String = "Ich werde Euch von Eurem Bann befreien! Wo ist der Hain dieser Dryade?", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sickHermit014", String = "Im Wald von Eloni, nahe einem Teich! Dort traf ich sie das erste Mal! Aber seht Euch vor - sie weiß, was ich weiß... sie wird Euch erwarten!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
			PlayerHasItem{ItemId = 2903},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "Q358HermitToldAboutHisLife"},
						  TransferItem{TakeItem = 2901 , GiveItem = 0 , Flag = Take},
						  QuestSolve{QuestId = 360},
						  QuestBegin{QuestId = 367},
						  QuestBegin{QuestId = 368},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "sickHermit014PC", String = "Hier, nehmt Eure Locke zurück! Ihr seid frei!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 2903}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "Q358HermitToldAboutHisLife"},
						  TransferItem{TakeItem = 2901 , GiveItem = 0 , Flag = Take},
						  QuestSolve{QuestId = 360},
						  QuestBegin{QuestId = 367},
						  QuestBegin{QuestId = 368},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sickHermit015", String = "Ich danke Euch! Sie ist fort! Ihr Ruf... sie ist weg! Endlich Stille... bis auf..."},
			Answer{Tag = "sickHermit015PC", String = "...die Stimmen derer, die Ihr ihretwegen getötet habt!", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sickHermit016", String = "Sie werden mich verfolgen, bis an mein Lebensende!"},
			Answer{Tag = "sickHermit016PC", String = "Am Ende bezahlen wir immer für das, was wir tun - ob in diesem Leben oder im nächsten!", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 369},
					QuestSolve{QuestId = 367},
					QuestSolve{QuestId = 358},
					TransferItem{TakeItem = 2903 , GiveItem = 0 , Flag = Take},
					SetRewardFlagTrue{ Name = "SickHermit2Locke"},
					RemoveDialog{NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end