-->INFO: CraftswomanNiamh
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_10961"},				
	}
}

OnIdleGoHome
{
	X = _X, Y = _Y, Direction = South, Range = 0, WalkMode = Walk , GotoMode = GotoNormal,
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n10961_CraftswomanNiamh.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			 IsNpcFlagFalse{ Name = "npc_P204_Known"},
		},
		Actions = {
			Say{Tag = "niamhP204_001", String = "Was starrt Ihr denn so? Ja, es gibt auch Frauen, die schmieden können! Ich bin Niamh, eine Waffenschmiedin und eine Gute dazu!"},
			Answer{Tag = "niamhP204_002PC", String = "Ich bewunderte nur Eure Arbeit. Seid gegrüßt, Niamh, verkauft Ihr auch Waffen?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated( IsNpcFlagFalse{ Name = "npc_P204_Known"}),
		},
		Actions = {
			Say{Tag = "niamhP204_008", String = "Ihr seid es wieder, seid gegrüßt!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "niamhP204_003", String = "Ich mache nur besondere Anfertigungen, guter Freund. Gewöhnliche Waffen findet Ihr auf dem Basar."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 1002, State = StateActive}) ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "niamhP204_007PC", String = "Kennt Ihr Tario, aus der Onyxbucht? Er hat mir diese Gegenstände gegeben und gesagt, ich solle damit zu Euch gehen.", AnswerId = 8},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 1002, State = StateActive}) ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			 SetNpcFlagTrue{ Name = "npc_P204_Known"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "niamhP204_004", String = "Danke, ich werde mich dort umsehen."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "niamhP204_005PC", String = "Seid Ihr Niamh, die Handwerkerin?", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "niamhP204_006", String = "Ja, das bin ich!"},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			 SetNpcFlagTrue{ Name = "npc_P204_Known"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
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
			 IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ,
			UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			 PlayerHasItem{ItemId = 7066} ,
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_009PC", String = "Könnt Ihr diesen zerbrochenen Stab und diesen Schild reparieren?", AnswerId = 15},
			OfferAnswer{Tag = "niamhP204_019PC", String = "Bitte repariert mir nun den Stab.", AnswerId = 27},
			OfferAnswer{Tag = "niamhP204_032PC", String = "Bitte repariert mir nun den Schild.", AnswerId = 57},
			OfferAnswer{Tag = "niamhP204_042PC", String = "Ich habe eine Zerbitenträne gefunden!", AnswerId = 86},
			OfferAnswer{Tag = "niamhP204_044PC", String = "Bitte gebt mir die Zerbitentränen zurück, die Ihr noch nicht verarbeitet habt.", AnswerId = 92},
		}}

	OnAnswer{14;
		Conditions = {
			 IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ,
			UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			 PlayerHasItem{ItemId = 7066} ,
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_009PC", String = "Könnt Ihr diesen zerbrochenen Stab und diesen Schild reparieren?", AnswerId = 15},
			OfferAnswer{Tag = "niamhP204_019PC", String = "Bitte repariert mir nun den Stab.", AnswerId = 27},
			OfferAnswer{Tag = "niamhP204_032PC", String = "Bitte repariert mir nun den Schild.", AnswerId = 57},
			OfferAnswer{Tag = "niamhP204_042PC", String = "Ich habe eine Zerbitenträne gefunden!", AnswerId = 86},
		}}

	OnAnswer{14;
		Conditions = {
			 IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ,
			UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			Negated( PlayerHasItem{ItemId = 7066} ),
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_009PC", String = "Könnt Ihr diesen zerbrochenen Stab und diesen Schild reparieren?", AnswerId = 15},
			OfferAnswer{Tag = "niamhP204_019PC", String = "Bitte repariert mir nun den Stab.", AnswerId = 27},
			OfferAnswer{Tag = "niamhP204_032PC", String = "Bitte repariert mir nun den Schild.", AnswerId = 57},
			OfferAnswer{Tag = "niamhP204_044PC", String = "Bitte gebt mir die Zerbitentränen zurück, die Ihr noch nicht verarbeitet habt.", AnswerId = 92},
		}}

	OnAnswer{14;
		Conditions = {
			 IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ,
			UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			Negated( PlayerHasItem{ItemId = 7066} ),
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_009PC", String = "Könnt Ihr diesen zerbrochenen Stab und diesen Schild reparieren?", AnswerId = 15},
			OfferAnswer{Tag = "niamhP204_019PC", String = "Bitte repariert mir nun den Stab.", AnswerId = 27},
			OfferAnswer{Tag = "niamhP204_032PC", String = "Bitte repariert mir nun den Schild.", AnswerId = 57},
		}}

	OnAnswer{14;
		Conditions = {
			 IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ,
			UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			Negated( 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			 PlayerHasItem{ItemId = 7066} ,
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_009PC", String = "Könnt Ihr diesen zerbrochenen Stab und diesen Schild reparieren?", AnswerId = 15},
			OfferAnswer{Tag = "niamhP204_019PC", String = "Bitte repariert mir nun den Stab.", AnswerId = 27},
			OfferAnswer{Tag = "niamhP204_042PC", String = "Ich habe eine Zerbitenträne gefunden!", AnswerId = 86},
			OfferAnswer{Tag = "niamhP204_044PC", String = "Bitte gebt mir die Zerbitentränen zurück, die Ihr noch nicht verarbeitet habt.", AnswerId = 92},
		}}

	OnAnswer{14;
		Conditions = {
			 IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ,
			UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			Negated( 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			 PlayerHasItem{ItemId = 7066} ,
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_009PC", String = "Könnt Ihr diesen zerbrochenen Stab und diesen Schild reparieren?", AnswerId = 15},
			OfferAnswer{Tag = "niamhP204_019PC", String = "Bitte repariert mir nun den Stab.", AnswerId = 27},
			OfferAnswer{Tag = "niamhP204_042PC", String = "Ich habe eine Zerbitenträne gefunden!", AnswerId = 86},
		}}

	OnAnswer{14;
		Conditions = {
			 IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ,
			UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			Negated( 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			Negated( PlayerHasItem{ItemId = 7066} ),
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_009PC", String = "Könnt Ihr diesen zerbrochenen Stab und diesen Schild reparieren?", AnswerId = 15},
			OfferAnswer{Tag = "niamhP204_019PC", String = "Bitte repariert mir nun den Stab.", AnswerId = 27},
			OfferAnswer{Tag = "niamhP204_044PC", String = "Bitte gebt mir die Zerbitentränen zurück, die Ihr noch nicht verarbeitet habt.", AnswerId = 92},
		}}

	OnAnswer{14;
		Conditions = {
			 IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ,
			UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			Negated( 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			Negated( PlayerHasItem{ItemId = 7066} ),
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_009PC", String = "Könnt Ihr diesen zerbrochenen Stab und diesen Schild reparieren?", AnswerId = 15},
			OfferAnswer{Tag = "niamhP204_019PC", String = "Bitte repariert mir nun den Stab.", AnswerId = 27},
		}}

	OnAnswer{14;
		Conditions = {
			 IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ,
			Negated(UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			 PlayerHasItem{ItemId = 7066} ,
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_009PC", String = "Könnt Ihr diesen zerbrochenen Stab und diesen Schild reparieren?", AnswerId = 15},
			OfferAnswer{Tag = "niamhP204_032PC", String = "Bitte repariert mir nun den Schild.", AnswerId = 57},
			OfferAnswer{Tag = "niamhP204_042PC", String = "Ich habe eine Zerbitenträne gefunden!", AnswerId = 86},
			OfferAnswer{Tag = "niamhP204_044PC", String = "Bitte gebt mir die Zerbitentränen zurück, die Ihr noch nicht verarbeitet habt.", AnswerId = 92},
		}}

	OnAnswer{14;
		Conditions = {
			 IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ,
			Negated(UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			 PlayerHasItem{ItemId = 7066} ,
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_009PC", String = "Könnt Ihr diesen zerbrochenen Stab und diesen Schild reparieren?", AnswerId = 15},
			OfferAnswer{Tag = "niamhP204_032PC", String = "Bitte repariert mir nun den Schild.", AnswerId = 57},
			OfferAnswer{Tag = "niamhP204_042PC", String = "Ich habe eine Zerbitenträne gefunden!", AnswerId = 86},
		}}

	OnAnswer{14;
		Conditions = {
			 IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ,
			Negated(UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			Negated( PlayerHasItem{ItemId = 7066} ),
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_009PC", String = "Könnt Ihr diesen zerbrochenen Stab und diesen Schild reparieren?", AnswerId = 15},
			OfferAnswer{Tag = "niamhP204_032PC", String = "Bitte repariert mir nun den Schild.", AnswerId = 57},
			OfferAnswer{Tag = "niamhP204_044PC", String = "Bitte gebt mir die Zerbitentränen zurück, die Ihr noch nicht verarbeitet habt.", AnswerId = 92},
		}}

	OnAnswer{14;
		Conditions = {
			 IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ,
			Negated(UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			Negated( PlayerHasItem{ItemId = 7066} ),
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_009PC", String = "Könnt Ihr diesen zerbrochenen Stab und diesen Schild reparieren?", AnswerId = 15},
			OfferAnswer{Tag = "niamhP204_032PC", String = "Bitte repariert mir nun den Schild.", AnswerId = 57},
		}}

	OnAnswer{14;
		Conditions = {
			 IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ,
			Negated(UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			Negated( 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			 PlayerHasItem{ItemId = 7066} ,
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_009PC", String = "Könnt Ihr diesen zerbrochenen Stab und diesen Schild reparieren?", AnswerId = 15},
			OfferAnswer{Tag = "niamhP204_042PC", String = "Ich habe eine Zerbitenträne gefunden!", AnswerId = 86},
			OfferAnswer{Tag = "niamhP204_044PC", String = "Bitte gebt mir die Zerbitentränen zurück, die Ihr noch nicht verarbeitet habt.", AnswerId = 92},
		}}

	OnAnswer{14;
		Conditions = {
			 IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ,
			Negated(UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			Negated( 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			 PlayerHasItem{ItemId = 7066} ,
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_009PC", String = "Könnt Ihr diesen zerbrochenen Stab und diesen Schild reparieren?", AnswerId = 15},
			OfferAnswer{Tag = "niamhP204_042PC", String = "Ich habe eine Zerbitenträne gefunden!", AnswerId = 86},
		}}

	OnAnswer{14;
		Conditions = {
			 IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ,
			Negated(UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			Negated( 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			Negated( PlayerHasItem{ItemId = 7066} ),
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_009PC", String = "Könnt Ihr diesen zerbrochenen Stab und diesen Schild reparieren?", AnswerId = 15},
			OfferAnswer{Tag = "niamhP204_044PC", String = "Bitte gebt mir die Zerbitentränen zurück, die Ihr noch nicht verarbeitet habt.", AnswerId = 92},
		}}

	OnAnswer{14;
		Conditions = {
			 IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ,
			Negated(UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			Negated( 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			Negated( PlayerHasItem{ItemId = 7066} ),
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_009PC", String = "Könnt Ihr diesen zerbrochenen Stab und diesen Schild reparieren?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated( IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ),
			UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			 PlayerHasItem{ItemId = 7066} ,
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_019PC", String = "Bitte repariert mir nun den Stab.", AnswerId = 27},
			OfferAnswer{Tag = "niamhP204_032PC", String = "Bitte repariert mir nun den Schild.", AnswerId = 57},
			OfferAnswer{Tag = "niamhP204_042PC", String = "Ich habe eine Zerbitenträne gefunden!", AnswerId = 86},
			OfferAnswer{Tag = "niamhP204_044PC", String = "Bitte gebt mir die Zerbitentränen zurück, die Ihr noch nicht verarbeitet habt.", AnswerId = 92},
		}}

	OnAnswer{14;
		Conditions = {
			Negated( IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ),
			UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			 PlayerHasItem{ItemId = 7066} ,
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_019PC", String = "Bitte repariert mir nun den Stab.", AnswerId = 27},
			OfferAnswer{Tag = "niamhP204_032PC", String = "Bitte repariert mir nun den Schild.", AnswerId = 57},
			OfferAnswer{Tag = "niamhP204_042PC", String = "Ich habe eine Zerbitenträne gefunden!", AnswerId = 86},
		}}

	OnAnswer{14;
		Conditions = {
			Negated( IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ),
			UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			Negated( PlayerHasItem{ItemId = 7066} ),
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_019PC", String = "Bitte repariert mir nun den Stab.", AnswerId = 27},
			OfferAnswer{Tag = "niamhP204_032PC", String = "Bitte repariert mir nun den Schild.", AnswerId = 57},
			OfferAnswer{Tag = "niamhP204_044PC", String = "Bitte gebt mir die Zerbitentränen zurück, die Ihr noch nicht verarbeitet habt.", AnswerId = 92},
		}}

	OnAnswer{14;
		Conditions = {
			Negated( IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ),
			UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			Negated( PlayerHasItem{ItemId = 7066} ),
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_019PC", String = "Bitte repariert mir nun den Stab.", AnswerId = 27},
			OfferAnswer{Tag = "niamhP204_032PC", String = "Bitte repariert mir nun den Schild.", AnswerId = 57},
		}}

	OnAnswer{14;
		Conditions = {
			Negated( IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ),
			UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			Negated( 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			 PlayerHasItem{ItemId = 7066} ,
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_019PC", String = "Bitte repariert mir nun den Stab.", AnswerId = 27},
			OfferAnswer{Tag = "niamhP204_042PC", String = "Ich habe eine Zerbitenträne gefunden!", AnswerId = 86},
			OfferAnswer{Tag = "niamhP204_044PC", String = "Bitte gebt mir die Zerbitentränen zurück, die Ihr noch nicht verarbeitet habt.", AnswerId = 92},
		}}

	OnAnswer{14;
		Conditions = {
			Negated( IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ),
			UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			Negated( 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			 PlayerHasItem{ItemId = 7066} ,
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_019PC", String = "Bitte repariert mir nun den Stab.", AnswerId = 27},
			OfferAnswer{Tag = "niamhP204_042PC", String = "Ich habe eine Zerbitenträne gefunden!", AnswerId = 86},
		}}

	OnAnswer{14;
		Conditions = {
			Negated( IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ),
			UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			Negated( 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			Negated( PlayerHasItem{ItemId = 7066} ),
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_019PC", String = "Bitte repariert mir nun den Stab.", AnswerId = 27},
			OfferAnswer{Tag = "niamhP204_044PC", String = "Bitte gebt mir die Zerbitentränen zurück, die Ihr noch nicht verarbeitet habt.", AnswerId = 92},
		}}

	OnAnswer{14;
		Conditions = {
			Negated( IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ),
			UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			Negated( 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			Negated( PlayerHasItem{ItemId = 7066} ),
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_019PC", String = "Bitte repariert mir nun den Stab.", AnswerId = 27},
		}}

	OnAnswer{14;
		Conditions = {
			Negated( IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ),
			Negated(UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			 PlayerHasItem{ItemId = 7066} ,
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_032PC", String = "Bitte repariert mir nun den Schild.", AnswerId = 57},
			OfferAnswer{Tag = "niamhP204_042PC", String = "Ich habe eine Zerbitenträne gefunden!", AnswerId = 86},
			OfferAnswer{Tag = "niamhP204_044PC", String = "Bitte gebt mir die Zerbitentränen zurück, die Ihr noch nicht verarbeitet habt.", AnswerId = 92},
		}}

	OnAnswer{14;
		Conditions = {
			Negated( IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ),
			Negated(UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			 PlayerHasItem{ItemId = 7066} ,
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_032PC", String = "Bitte repariert mir nun den Schild.", AnswerId = 57},
			OfferAnswer{Tag = "niamhP204_042PC", String = "Ich habe eine Zerbitenträne gefunden!", AnswerId = 86},
		}}

	OnAnswer{14;
		Conditions = {
			Negated( IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ),
			Negated(UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			Negated( PlayerHasItem{ItemId = 7066} ),
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_032PC", String = "Bitte repariert mir nun den Schild.", AnswerId = 57},
			OfferAnswer{Tag = "niamhP204_044PC", String = "Bitte gebt mir die Zerbitentränen zurück, die Ihr noch nicht verarbeitet habt.", AnswerId = 92},
		}}

	OnAnswer{14;
		Conditions = {
			Negated( IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ),
			Negated(UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ,
			Negated( PlayerHasItem{ItemId = 7066} ),
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_032PC", String = "Bitte repariert mir nun den Schild.", AnswerId = 57},
		}}

	OnAnswer{14;
		Conditions = {
			Negated( IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ),
			Negated(UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			Negated( 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			 PlayerHasItem{ItemId = 7066} ,
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_042PC", String = "Ich habe eine Zerbitenträne gefunden!", AnswerId = 86},
			OfferAnswer{Tag = "niamhP204_044PC", String = "Bitte gebt mir die Zerbitentränen zurück, die Ihr noch nicht verarbeitet habt.", AnswerId = 92},
		}}

	OnAnswer{14;
		Conditions = {
			Negated( IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ),
			Negated(UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			Negated( 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			 PlayerHasItem{ItemId = 7066} ,
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_042PC", String = "Ich habe eine Zerbitenträne gefunden!", AnswerId = 86},
		}}

	OnAnswer{14;
		Conditions = {
			Negated( IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ),
			Negated(UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			Negated( 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			Negated( PlayerHasItem{ItemId = 7066} ),
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_044PC", String = "Bitte gebt mir die Zerbitentränen zurück, die Ihr noch nicht verarbeitet habt.", AnswerId = 92},
		}}

	OnAnswer{14;
		Conditions = {
			Negated( IsGlobalFlagFalse{ Name = "g_P204_NiamhGemInfoGiven"} ),
			Negated(UND9{
							PlayerHasItem{ItemId = 7306},
							IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			Negated( 
							UND9{
								PlayerHasItem{ItemId = 7307},
								IsGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"}
								} ),
			Negated( PlayerHasItem{ItemId = 7066} ),
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "niamhP204_010", String = "Lasst einmal sehen ... ein Kampfstab und ein Magierschild ... hm."},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "niamhP204_011", String = "Hm, hervorragende Arbeit ... beide haben diese drei Mulden, als sollte dort irgend etwas eingesetzt werden. Hm, das müssen Zerbitenwaffen sein!"},
			Answer{Tag = "niamhP204_012PC", String = "Zerbitenwaffen?", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "niamhP204_013", String = "Glaubt Ihr mir etwa nicht? Die Zerbitenwaffen wurden mit magischen Edelsteinen verstärkt! Die drei Mulde in den Waffen sind für diese Edelsteine gemacht!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "niamhP204_014", String = "Erst wenn drei dieser Edelsteine, die wir Zerbitentränen nennen, dort eingesetzt werden, erlangt die Waffe ihre volle Stärke!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "niamhP204_015", String = "Ich kann diese Gegenstände für Euch wieder nutzbar machen, aber ohne die Zerbitentränen sind sie nicht besser als das gewöhnliche Zeug, das Ihr im Basar bekommt!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "niamhP204_016", String = "Wenn Ihr aber Zerbitentränen habt und wir sie bei der Reparatur mit einarbeiten können, dann erhaltet Ihr machtvollere Gegenstände! Je mehr der Tränen wir einsetzen, um so besser werden sie!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "niamhP204_017", String = "Ihr habt die Wahl! Entweder ich repariere Euch nun die Waffen oder Ihr sucht zunächst nach ein paar Zerbitentränen."},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "niamhP204_018", String = "Ich kann sie leider nicht nachträglich einsetzen, man kann also jeden Gegenstand nur einmal bearbeiten, danach bleibt er für immer so."},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{ Name = "g_P204_NiamhGemInfoGiven"} ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
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
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 0, Operator = IsEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{28;
		Conditions = {
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 0, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "niamhP204_020", String = "Ihr habt mir noch keine Zerbitentränen gebracht! Soll ich den Stab dennoch reparieren?"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_021PC", String = "Ja.", AnswerId = 30},
			OfferAnswer{Tag = "niamhP204_023PC", String = "Nein, ich suche noch weiter.", AnswerId = 33},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			 QuestSolve{QuestId = 1003},
						   TransferItem {GiveItem = 4452, Flag = Give},
						   TransferItem {TakeItem = 7306, Flag = Take} ,
			Say{Tag = "niamhP204_022", String = "Nun, gut, wie Ihr wollt. Hier! Ist nicht gerade eine Wunderwaffe, aber ich habe schon Schlechteres gesehen."},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{36;
		Conditions = {
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "niamhP204_024", String = "Ihr habt mir erst eine Zerbitenträne gebracht. Soll ich den Stab nun reparieren und diese eine Träne darin einsetzen?"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_021PC", String = "Ja.", AnswerId = 38},
			OfferAnswer{Tag = "niamhP204_023PC", String = "Nein, ich suche noch weiter.", AnswerId = 41},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			
						  QuestSolve{QuestId = 1003},
						  TransferItem {GiveItem = 4453, Flag = Give},
						  TransferItem {TakeItem = 7306, Flag = Take},
						  DecreaseGlobalCounter{Name = "npc_P204_GemsGivenToNiamh"}
						   ,
			Say{Tag = "niamhP204_025", String = "Wohlan denn, er gehört Euch. Ganz ansehlich, das gute Stück."},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{44;
		Conditions = {
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "niamhP204_026", String = "Ihr habt mir erst zwei Zerbitentränen gebracht. Soll ich den Stab nun reparieren und diese zwei Tränen darin einsetzen?"},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_021PC", String = "Ja.", AnswerId = 46},
			OfferAnswer{Tag = "niamhP204_023PC", String = "Nein, ich suche noch weiter.", AnswerId = 49},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
		},
		Actions = {
			
						  QuestSolve{QuestId = 1003},
						  TransferItem {GiveItem = 4454, Flag = Give},
						  TransferItem {TakeItem = 7306, Flag = Take},
						  DecreaseGlobalCounter{Name = "npc_P204_GemsGivenToNiamh"},
						  DecreaseGlobalCounter{Name = "npc_P204_GemsGivenToNiamh"}
						   ,
			Say{Tag = "niamhP204_027", String = "Hier, nehmt ihn. Ein gute Waffe!"},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{52;
		Conditions = {
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 3, Operator = IsGreaterOrEqual} ,
		},
		Actions = {
			Say{Tag = "niamhP204_028", String = "Ihr habt mir genug Zerbitentränen für alle drei Mulden gebracht! Ich repariere nun den Stab und sezte drei Tränen ein!"},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 3, Operator = IsGreaterOrEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			
						  QuestSolve{QuestId = 1003},
						  TransferItem {GiveItem = 4455, Flag = Give},
						  TransferItem {TakeItem = 7306, Flag = Take},
						  DecreaseGlobalCounter{Name = "npc_P204_GemsGivenToNiamh"},
						  DecreaseGlobalCounter{Name = "npc_P204_GemsGivenToNiamh"},
						  DecreaseGlobalCounter{Name = "npc_P204_GemsGivenToNiamh"}
						 ,
			Say{Tag = "niamhP204_029", String = "So, hier ist er! Wartet, ich möchte ihn nur noch für einen Moment in den Händen halten ... wundervoll, man kann richtig fühlen, wie die magische Kraft durch ihn fließt!"},
			Answer{Tag = "niamhP204_030PC", String = "Ich danke Euch, Niamh. Kann ich ihn jetzt haben?", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "niamhP204_031", String = "Oh! Ja! Ja, natürlich, hier! Möge er Euch gute Dienste leisten! Was für eine Waffe!"},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 58},
		}}

	OnAnswer{58;
		Conditions = {
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 0, Operator = IsEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{58;
		Conditions = {
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 0, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "niamhP204_033", String = "Ihr habt mir noch keine Zerbitentränen gebracht! Soll ich den Schild dennoch reparieren?"},
			Answer{Tag = "", String = "", AnswerId = 59},
		}}

	OnAnswer{59;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_021PC", String = "Ja.", AnswerId = 60},
			OfferAnswer{Tag = "niamhP204_023PC", String = "Nein, ich suche noch weiter.", AnswerId = 63},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 61},
		}}

	OnAnswer{61;
		Conditions = {
		},
		Actions = {
			 QuestSolve{QuestId = 1004},
							TransferItem {GiveItem = 4445, Flag = Give},
							TransferItem {TakeItem = 7307, Flag = Take} ,
			Say{Tag = "niamhP204_034", String = "Wenn Ihr meint. Hier, nehmt! Ein, zwei Schläge wird er schon aushalten."},
			Answer{Tag = "", String = "", AnswerId = 62},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 64},
		}}

	OnAnswer{64;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{66;
		Conditions = {
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 74},
		}}

	OnAnswer{66;
		Conditions = {
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsEqual} ,
		},
		Actions = {
			Say{Tag = "niamhP204_035", String = "Ihr habt mir erst eine Zerbitenträne gebracht. Soll ich den Schild nun reparieren und diese eine Träne darin einsetzen?"},
			Answer{Tag = "", String = "", AnswerId = 67},
		}}

	OnAnswer{67;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_021PC", String = "Ja.", AnswerId = 68},
			OfferAnswer{Tag = "niamhP204_023PC", String = "Nein, ich suche noch weiter.", AnswerId = 71},
		}}

	OnAnswer{68;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 69},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			
						  QuestSolve{QuestId = 1004},
						  TransferItem {GiveItem = 4446, Flag = Give},
						  TransferItem {TakeItem = 7307, Flag = Take},
						  DecreaseGlobalCounter{Name = "npc_P204_GemsGivenToNiamh"}
						   ,
			Say{Tag = "niamhP204_036", String = "Hier ist er! Ein feines Werkstück, gut ausgewogen! Aber nichts, womit man enen Zirkelmagier herausfordern sollte."},
			Answer{Tag = "", String = "", AnswerId = 70},
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 72},
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 73},
		}}

	OnAnswer{73;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{74;
		Conditions = {
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 82},
		}}

	OnAnswer{74;
		Conditions = {
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "niamhP204_037", String = "Ihr habt mir erst zwei Zerbitentränen gebracht. Soll ich den Schild nun reparieren und diese beiden Tränen darin einsetzen?"},
			Answer{Tag = "", String = "", AnswerId = 75},
		}}

	OnAnswer{75;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "niamhP204_021PC", String = "Ja.", AnswerId = 76},
			OfferAnswer{Tag = "niamhP204_023PC", String = "Nein, ich suche noch weiter.", AnswerId = 79},
		}}

	OnAnswer{76;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 77},
		}}

	OnAnswer{77;
		Conditions = {
		},
		Actions = {
			
						  QuestSolve{QuestId = 1004},
						  TransferItem {GiveItem = 4447, Flag = Give},
						  TransferItem {TakeItem = 7307, Flag = Take},
						  DecreaseGlobalCounter{Name = "npc_P204_GemsGivenToNiamh"},
						  DecreaseGlobalCounter{Name = "npc_P204_GemsGivenToNiamh"}
						   ,
			Say{Tag = "niamhP204_038", String = "Also dann, hier, nehmt! Kein schlechtes Stück, leicht aber doch stabil! Genau das richtige für einen Zauberer!"},
			Answer{Tag = "", String = "", AnswerId = 78},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{79;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 80},
		}}

	OnAnswer{80;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 81},
		}}

	OnAnswer{81;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{82;
		Conditions = {
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 3, Operator = IsGreaterOrEqual} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 85},
		}}

	OnAnswer{82;
		Conditions = {
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 3, Operator = IsGreaterOrEqual} ,
		},
		Actions = {
			Say{Tag = "niamhP204_039", String = "Ihr habt mir genug Zerbitentränen für alle drei Mulden gebracht! Ich repariere nun den Schild und setze drei Tränen darin ein!."},
			Answer{Tag = "", String = "", AnswerId = 83},
		}}

	OnAnswer{83;
		Conditions = {
		},
		Actions = {
			
						  QuestSolve{QuestId = 1004},
						  TransferItem {GiveItem = 4448, Flag = Give},
						  TransferItem {TakeItem = 7307, Flag = Take},
						  DecreaseGlobalCounter{Name = "npc_P204_GemsGivenToNiamh"},
						  DecreaseGlobalCounter{Name = "npc_P204_GemsGivenToNiamh"},
						  DecreaseGlobalCounter{Name = "npc_P204_GemsGivenToNiamh"}
						 ,
			Say{Tag = "niamhP204_040", String = "Ah! Wundervoll! Jetzt spürt man in ihm die ganze Macht der Zerbiten! Nur wenige können solch einen Schild Ihr eigen nennen! Ihr solltet stolz sein, Freund!"},
			Answer{Tag = "", String = "", AnswerId = 84},
		}}

	OnAnswer{84;
		Conditions = {
		},
		Actions = {
			Say{Tag = "niamhP204_041", String = "Viel Glück damit! und empfehlt mich weiter."},
		}}

	OnAnswer{84;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{85;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{85;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{86;
		Conditions = {
		},
		Actions = {
			Say{Tag = "niamhP204_043", String = "Ich nehme sie an mich und werde sie für Euch aufbewahren. Sobald ihr mir dann den Auftrag gebt, den Stab oder den Schild zu reparieren, werde ich sie verarbeiten."},
			Answer{Tag = "", String = "", AnswerId = 87},
		}}

	OnAnswer{87;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 88},
		}}

	OnAnswer{88;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 7066, Flag = Take},
							IncreaseGlobalCounter{Name = "npc_P204_GemsGivenToNiamh"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 89},
		}}

	OnAnswer{89;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 90},
		}}

	OnAnswer{90;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 91},
		}}

	OnAnswer{91;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{92;
		Conditions = {
		},
		Actions = {
			Say{Tag = "niamhP204_045", String = "Gut, hier habt Ihr sie."},
			Answer{Tag = "", String = "", AnswerId = 93},
		}}

	OnAnswer{93;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 94},
		}}

	OnAnswer{94;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 95},
		}}

	OnAnswer{95;
		Conditions = {
			IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 96},
		}}

	OnAnswer{95;
		Conditions = {
			Negated(IsGlobalCounter{Name = "npc_P204_GemsGivenToNiamh", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 100},
		}}

	OnAnswer{96;
		Conditions = {
		},
		Actions = {
			
						  DecreaseGlobalCounter{Name = "npc_P204_GemsGivenToNiamh"},
						  TransferItem {GiveItem = 7066, Flag = Give}
						,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 97},
		}}

	OnAnswer{97;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 98},
		}}

	OnAnswer{98;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 99},
		}}

	OnAnswer{99;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 94},
		}}

	OnAnswer{100;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{100;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end