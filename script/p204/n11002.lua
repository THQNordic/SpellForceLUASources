-->INFO: Puppenspieler
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalFlagFalse{Name = "g_P204_YrmirSidequestOn"},
	},
	OnActions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11002"},
	},
	OffConditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_YrmirSidequestOn"},
	},
	OffActions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11002"},
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n11002_Puppenspieler.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse {Name = "npc_P204_Known"},
		},
		Actions = {
			Say{Tag = "puppet_masterP204_001", String = "Willkommen beim Puppenspiel der blauen Rose,  Fremdling. Man nennt diesen bescheidenen Bürger den Puppenspieler."},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "npc_P204_Known"}),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_007", String = "Was kann dieser bescheidene Bürger für Euch tun?"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_002", String = "Möchtet Ihr eine Darbietung für Eure Kleinen? Unser Puppentheater beherrscht alle Märchen aus Fiara."},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_003", String = "Hm, nein, wohl nicht, Ihr seht nicht aus, wie jemand, der Kinder hat. Kann dieser bescheidene Bürger Euch dann vielleicht für ein paar handgefertigte Puppen interessieren?"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_004", String = "Manche von ihnen sind sogar magisch belebt! Sie haben zwar nicht gerade die Perfektion von Hadeko-Puppen, sind aber doch sehr unterhaltsam."},
			Answer{Tag = "puppet_masterP204_005PC", String = "Keine Puppen für mich, Freund.", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue {Name = "npc_P204_Known"},
			Say{Tag = "puppet_masterP204_006", String = "Was darf es denn dann sein?"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			Answer{Tag = "", String = "", AnswerId = 9},
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
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"}),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_008PC", String = "Ich habe gehört, Ihr seid ein gefährlicher Mann?", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										,
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_016PC", String = "Kann ich Eurer Assassinengilde beitreten??", AnswerId = 18},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  },
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_027PC", String = "Seth hat sein Geschenk bekommen.", AnswerId = 31},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			 UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  },
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_034PC", String = "Seth lebt ...", AnswerId = 39},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"},
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_043PC", String = "Was sind Hadeko-Puppen?", AnswerId = 48},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_048PC", String = "Zu diesem Hadeko-Spiel ...", AnswerId = 56},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse {Name = "npc_P204_KillerInfoGiven"}, IsGlobalFlagTrue{Name = "g_204_IshtarHintPuppetMaster"})),
			Negated(
										UND9
										{IsNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
										IsGlobalFlagFalse {Name = "g_P204_AvatarMemberKillerGuild"}
										}
										),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1020, State = StateSolved}
								  }),
			Negated( UND9{
								  QuestState {QuestId = 1023, State = StateActive},
								  QuestState {QuestId = 1022, State = StateSolved}
								  }),
			Negated(IsNpcFlagFalse {Name = "npc_P204_HadekoInfoGiven"}),
			Negated(
																UND9
																{
																IsNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
																ODER9
																	{
																	PlayerHasItem {ItemId = 7076 },
																	PlayerHasItem {ItemId = 7077 },
																	PlayerHasItem {ItemId = 7078 },
																	PlayerHasItem {ItemId = 7079 },
																	PlayerHasItem {ItemId = 7080 },
																	PlayerHasItem {ItemId = 7081 },
																	IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}
																	}
																}
																),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_009", String = "Ich? Seht diese schwachen, zarten Hände! Dieser bescheidene Bürger zupft die Schnüre von Puppen, er näht, er färbt ... aber könnte keine Waffe führen!"},
			Answer{Tag = "puppet_masterP204_010PC", String = "Ja, aber ist eine Nadel groß genug, kann sie tödlich sein ... und so manche Farbe ist sehr giftig ...", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_011", String = "Manchmal muss ein bescheidener Bürger schlimme Dinge tun, damit er sein Recht bekommt ..."},
			Answer{Tag = "puppet_masterP204_012PC", String = "Und manchmal kann ein bescheidener Bürger damit auch gutes Geld verdienen ...", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_013", String = "Vorausgesetzt ein bescheidener Bürger versteht sein Handwerk ... und hat fähige Freunde zur Hilfe..."},
			Answer{Tag = "puppet_masterP204_014PC", String = "Eine Assassinengilde! Ishtar hatte recht! Euer Puppenspiel ist eine Assassinengilde!", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_015", String = "Ssh, mäßigt Euch. Wir wollen doch die Nachbarn nicht unnötig aufregen, nicht wahr?"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue {Name = "npc_P204_KillerInfoGiven"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_017", String = "Ah, ein neuer Puppenspieler! Nun, fähig seht Ihr ja aus!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_018", String = "Aber bevor Ihr der blauen Rose beitreten könnt, müsst Ihr eine Prüfung ablegen. Ihr müsst eines Ihrer Mitglieder beschenken."},
			Answer{Tag = "puppet_masterP204_019PC", String = "Beschenken? Ihr meint töten, nicht wahr?", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_020", String = "Sagen wir, Ihr schenkt ihm einen schnellen Tod ... und diese schöne blaue Rose. Ihr Duft soll ihn auf der Fahrt ins Totenreich erheitern."},
			Answer{Tag = "puppet_masterP204_021PC", String = "Wer ist es?", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_022", String = "Sein Name ist Seth Dundred. Er hat seinen letzten Auftrag nicht ausgeführt und dieser bescheidene Bürger kann das leider nicht tolerieren."},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "puppet_masterP204_025PC", String = "Wo finde ich ihn?", AnswerId = 26},
		}}

	OnAnswer{22;
		Conditions = {
			IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "puppet_masterP204_023PC", String = "Seth? Das wird schwierig, er ist gut! Ich habe ihn schon einmal bei der Arbeit gesehen!", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_024", String = "Allein das Ihr ihn bei der Arbeit gesehen habt, bezeugt seinen Mangel an Talent. Bringt ihm sein Geschenk, Freund."},
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
			Answer{Tag = "puppet_masterP204_025PC", String = "Wo finde ich ihn?", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_026", String = "Er ist  im Basar zu finden. Hier, nehmt die blaue Rose für ihn und wenn Ihr Erfolg hattet, berichtet diesem bescheidenen Bürger."},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			 
								SetGlobalFlagTrue {Name = "g_P204_AvatarMemberKillerGuild"},
								QuestBegin{QuestId = 1018 },
								QuestBegin{QuestId = 1020 },
								TransferItem {GiveItem = 7318, Flag = Give}
								,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_028", String = "Sehr gut! Es wird den anderen Spielern eine Lehre sein. Allerdings gibt es ein paar Schwierigkeiten ..."},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_029", String = "Ihr seid ein Runenkrieger, alle Welt spricht von Euch. Ich kann Euch leider nicht in die blaue Rose aufnehmen."},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_030", String = "Ihr würdet einfach zuviel Wirbel erzeugen und am Ende bekäme dieser bescheidene Bürger noch Ärger wegen Euch."},
			Answer{Tag = "puppet_masterP204_031PC", String = "Ihr wolltet nur jemand haben, der Euch Seth aus dem Weg räumt, weil er zu gut für Euch ist!", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_032", String = "Nicht doch, so harte Worte. Grämt Euch nicht, Ihr sollt eine Belohnung bekommen."},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_033", String = "Nicht so verspannt, es ist nicht das, was Ihr denkt ... hier, nehmt dies. Nun lebt wohl."},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			 QuestSolve{QuestId = 1023 },
									  QuestSolve{QuestId = 1018 },
									  TransferItem {GiveItem = 3661, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_035", String = "Wie überaus ... uneffizient von Euch. Nun wird diesem bescheidenen Bürger nichts anders übrigbleiben ..."},
			Answer{Tag = "puppet_masterP204_036PC", String = "... aber ich habe seinen ursprünglichen Auftrag ausgeführt. Yrmir hat sein Geschenk erhalten.", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_037", String = "Ah, wie wundervoll! Endlich ist dieser Popanz aus dem Spiel! Und was wird aus Seth?"},
			Answer{Tag = "puppet_masterP204_038PC", String = "Seth wird nicht mehr für Euch arbeiten.", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_039", String = "Aber er lebt! Nun gut, dann sei es so, aber Ihr habt versagt! Ihr könnt der blauen Rose nicht beitreten, solcherlei Weichherzigkeit ist nicht akzeptabel!"},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_040", String = "Aber Ihr sollt wenigstens für den Auftrag entlohnt werden, den keiner meiner Spieler erfüllen konnte."},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_041", String = "Hier, unser Zeichen die blaue Rose, geschliffen aus Saphir. Sie ist sehr wertvoll, nur die Meister unter den Puppenspielern erhalten sie."},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			 QuestSolve{QuestId = 1023 },
									  QuestSolve{QuestId = 1018 },
									  TransferItem {GiveItem = 7319, Flag = Give},
			Say{Tag = "puppet_masterP204_042", String = "Nun wünscht Euch dieser bescheidene Bürger noch einen schönen Tag. Lebt wohl. Und ... empfehlt uns weiter."},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 46},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_044", String = "Hadeko ist ein Puppenspiel, das die mysteriösen Former selbst erfunden haben. Ein Spieler benötigt sechs Puppen, die auf eine Spielfeld gegen die eines anderen kämpfen."},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_045", String = "Das besondere an Hadeko ist, das seine Puppen magisch belebt sind und von unglaublicher Filigranität und Fertigungskunst. Man sagt es sind sogar einige bis heute erhalten geblieben."},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_046", String = "Es heisst, sogar ein richtiges Hadeko-Spielbrett, an dem man eine Partie wagen könnte, würde noch in der Stadt der Seelen existieren. Aber wer geht dort schon hin, der gesunden Geistes ist?"},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_047", String = "Solltet Ihr auf Euren Reisen eine Hadeko-Puppe finden, wäre dieser bescheidene Bürger hocherfreut, sie Euch abkaufen zu dürfen. Es sei denn, Ihr wollt selbst einmal Hadeko spielen."},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue {Name = "npc_P204_HadekoInfoGiven"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_049", String = "Ja?"},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{57;
		Conditions = {
			ODER9{
										PlayerHasItem {ItemId = 7076 },
										PlayerHasItem {ItemId = 7077 },
										PlayerHasItem {ItemId = 7078 },
										PlayerHasItem {ItemId = 7079 },
										PlayerHasItem {ItemId = 7080 },
										PlayerHasItem {ItemId = 7081 }
										},
			IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_050PC", String = "Ich möchte Euch eine Puppe verkaufen.", AnswerId = 58},
			OfferAnswer{Tag = "puppet_masterP204_070PC", String = "Ich möchte von Euch eine Puppe zurückkaufen.", AnswerId = 101},
		}}

	OnAnswer{57;
		Conditions = {
			ODER9{
										PlayerHasItem {ItemId = 7076 },
										PlayerHasItem {ItemId = 7077 },
										PlayerHasItem {ItemId = 7078 },
										PlayerHasItem {ItemId = 7079 },
										PlayerHasItem {ItemId = 7080 },
										PlayerHasItem {ItemId = 7081 }
										},
			Negated(IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_050PC", String = "Ich möchte Euch eine Puppe verkaufen.", AnswerId = 58},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(ODER9{
										PlayerHasItem {ItemId = 7076 },
										PlayerHasItem {ItemId = 7077 },
										PlayerHasItem {ItemId = 7078 },
										PlayerHasItem {ItemId = 7079 },
										PlayerHasItem {ItemId = 7080 },
										PlayerHasItem {ItemId = 7081 }
										}),
			IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_070PC", String = "Ich möchte von Euch eine Puppe zurückkaufen.", AnswerId = 101},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(ODER9{
										PlayerHasItem {ItemId = 7076 },
										PlayerHasItem {ItemId = 7077 },
										PlayerHasItem {ItemId = 7078 },
										PlayerHasItem {ItemId = 7079 },
										PlayerHasItem {ItemId = 7080 },
										PlayerHasItem {ItemId = 7081 }
										}),
			Negated(IsGlobalCounter {Name = "g_P204_HadekoPuppetsSold", Value = 1, Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 59},
		}}

	OnAnswer{59;
		Conditions = {
			Negated( Negated( QuestState {QuestId = 993 , State = StateSolved} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 68},
		}}

	OnAnswer{59;
		Conditions = {
			 Negated( QuestState {QuestId = 993 , State = StateSolved} ),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_051", String = "Die Puppen sind sehr selten. Seid Ihr sicher, dass Ihr nicht Euren eigenen Satz sammeln wollt?"},
			Answer{Tag = "", String = "", AnswerId = 60},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_052", String = "Vielleiht möchtet Ihr irgenwann einmal eine Hadeko-Partie spielen? Also überlegt es Euch gut, ob Ihr sie verkaufen wollt."},
			Answer{Tag = "", String = "", AnswerId = 61},
		}}

	OnAnswer{61;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "puppet_masterP204_053PC", String = "Ihr habt recht, ich überlege es mir noch einmal.", AnswerId = 62},
			OfferAnswer{Tag = "puppet_masterP204_054PC", String = "Nein, ich kann mit Puppen nichts anfangen!", AnswerId = 65},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 63},
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
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_055", String = "Wie Ihr meint."},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{66;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 67},
		}}

	OnAnswer{67;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 69},
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
			Say{Tag = "puppet_masterP204_056", String = "Für einen Trickster zahle ich 700 Goldstücke. Für Schatten, Mentor und Torwächter je 1000 Goldstücke."},
			Answer{Tag = "", String = "", AnswerId = 70},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			PlayerHasItem {ItemId = 7079 },
			PlayerHasItem {ItemId = 7078 },
			PlayerHasItem {ItemId = 7077 },
			PlayerHasItem {ItemId = 7080 },
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			PlayerHasItem {ItemId = 7079 },
			PlayerHasItem {ItemId = 7078 },
			PlayerHasItem {ItemId = 7077 },
			PlayerHasItem {ItemId = 7080 },
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			PlayerHasItem {ItemId = 7079 },
			PlayerHasItem {ItemId = 7078 },
			PlayerHasItem {ItemId = 7077 },
			Negated(PlayerHasItem {ItemId = 7080 }),
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			PlayerHasItem {ItemId = 7079 },
			PlayerHasItem {ItemId = 7078 },
			PlayerHasItem {ItemId = 7077 },
			Negated(PlayerHasItem {ItemId = 7080 }),
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			PlayerHasItem {ItemId = 7079 },
			PlayerHasItem {ItemId = 7078 },
			Negated(PlayerHasItem {ItemId = 7077 }),
			PlayerHasItem {ItemId = 7080 },
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			PlayerHasItem {ItemId = 7079 },
			PlayerHasItem {ItemId = 7078 },
			Negated(PlayerHasItem {ItemId = 7077 }),
			PlayerHasItem {ItemId = 7080 },
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			PlayerHasItem {ItemId = 7079 },
			PlayerHasItem {ItemId = 7078 },
			Negated(PlayerHasItem {ItemId = 7077 }),
			Negated(PlayerHasItem {ItemId = 7080 }),
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			PlayerHasItem {ItemId = 7079 },
			PlayerHasItem {ItemId = 7078 },
			Negated(PlayerHasItem {ItemId = 7077 }),
			Negated(PlayerHasItem {ItemId = 7080 }),
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			PlayerHasItem {ItemId = 7079 },
			Negated(PlayerHasItem {ItemId = 7078 }),
			PlayerHasItem {ItemId = 7077 },
			PlayerHasItem {ItemId = 7080 },
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			PlayerHasItem {ItemId = 7079 },
			Negated(PlayerHasItem {ItemId = 7078 }),
			PlayerHasItem {ItemId = 7077 },
			PlayerHasItem {ItemId = 7080 },
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			PlayerHasItem {ItemId = 7079 },
			Negated(PlayerHasItem {ItemId = 7078 }),
			PlayerHasItem {ItemId = 7077 },
			Negated(PlayerHasItem {ItemId = 7080 }),
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			PlayerHasItem {ItemId = 7079 },
			Negated(PlayerHasItem {ItemId = 7078 }),
			PlayerHasItem {ItemId = 7077 },
			Negated(PlayerHasItem {ItemId = 7080 }),
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			PlayerHasItem {ItemId = 7079 },
			Negated(PlayerHasItem {ItemId = 7078 }),
			Negated(PlayerHasItem {ItemId = 7077 }),
			PlayerHasItem {ItemId = 7080 },
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			PlayerHasItem {ItemId = 7079 },
			Negated(PlayerHasItem {ItemId = 7078 }),
			Negated(PlayerHasItem {ItemId = 7077 }),
			PlayerHasItem {ItemId = 7080 },
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			PlayerHasItem {ItemId = 7079 },
			Negated(PlayerHasItem {ItemId = 7078 }),
			Negated(PlayerHasItem {ItemId = 7077 }),
			Negated(PlayerHasItem {ItemId = 7080 }),
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			PlayerHasItem {ItemId = 7079 },
			Negated(PlayerHasItem {ItemId = 7078 }),
			Negated(PlayerHasItem {ItemId = 7077 }),
			Negated(PlayerHasItem {ItemId = 7080 }),
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			Negated(PlayerHasItem {ItemId = 7079 }),
			PlayerHasItem {ItemId = 7078 },
			PlayerHasItem {ItemId = 7077 },
			PlayerHasItem {ItemId = 7080 },
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			Negated(PlayerHasItem {ItemId = 7079 }),
			PlayerHasItem {ItemId = 7078 },
			PlayerHasItem {ItemId = 7077 },
			PlayerHasItem {ItemId = 7080 },
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			Negated(PlayerHasItem {ItemId = 7079 }),
			PlayerHasItem {ItemId = 7078 },
			PlayerHasItem {ItemId = 7077 },
			Negated(PlayerHasItem {ItemId = 7080 }),
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			Negated(PlayerHasItem {ItemId = 7079 }),
			PlayerHasItem {ItemId = 7078 },
			PlayerHasItem {ItemId = 7077 },
			Negated(PlayerHasItem {ItemId = 7080 }),
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			Negated(PlayerHasItem {ItemId = 7079 }),
			PlayerHasItem {ItemId = 7078 },
			Negated(PlayerHasItem {ItemId = 7077 }),
			PlayerHasItem {ItemId = 7080 },
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			Negated(PlayerHasItem {ItemId = 7079 }),
			PlayerHasItem {ItemId = 7078 },
			Negated(PlayerHasItem {ItemId = 7077 }),
			PlayerHasItem {ItemId = 7080 },
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			Negated(PlayerHasItem {ItemId = 7079 }),
			PlayerHasItem {ItemId = 7078 },
			Negated(PlayerHasItem {ItemId = 7077 }),
			Negated(PlayerHasItem {ItemId = 7080 }),
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			Negated(PlayerHasItem {ItemId = 7079 }),
			PlayerHasItem {ItemId = 7078 },
			Negated(PlayerHasItem {ItemId = 7077 }),
			Negated(PlayerHasItem {ItemId = 7080 }),
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			Negated(PlayerHasItem {ItemId = 7079 }),
			Negated(PlayerHasItem {ItemId = 7078 }),
			PlayerHasItem {ItemId = 7077 },
			PlayerHasItem {ItemId = 7080 },
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			Negated(PlayerHasItem {ItemId = 7079 }),
			Negated(PlayerHasItem {ItemId = 7078 }),
			PlayerHasItem {ItemId = 7077 },
			PlayerHasItem {ItemId = 7080 },
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			Negated(PlayerHasItem {ItemId = 7079 }),
			Negated(PlayerHasItem {ItemId = 7078 }),
			PlayerHasItem {ItemId = 7077 },
			Negated(PlayerHasItem {ItemId = 7080 }),
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			Negated(PlayerHasItem {ItemId = 7079 }),
			Negated(PlayerHasItem {ItemId = 7078 }),
			PlayerHasItem {ItemId = 7077 },
			Negated(PlayerHasItem {ItemId = 7080 }),
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			Negated(PlayerHasItem {ItemId = 7079 }),
			Negated(PlayerHasItem {ItemId = 7078 }),
			Negated(PlayerHasItem {ItemId = 7077 }),
			PlayerHasItem {ItemId = 7080 },
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			Negated(PlayerHasItem {ItemId = 7079 }),
			Negated(PlayerHasItem {ItemId = 7078 }),
			Negated(PlayerHasItem {ItemId = 7077 }),
			PlayerHasItem {ItemId = 7080 },
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			Negated(PlayerHasItem {ItemId = 7079 }),
			Negated(PlayerHasItem {ItemId = 7078 }),
			Negated(PlayerHasItem {ItemId = 7077 }),
			Negated(PlayerHasItem {ItemId = 7080 }),
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 7076 },
			Negated(PlayerHasItem {ItemId = 7079 }),
			Negated(PlayerHasItem {ItemId = 7078 }),
			Negated(PlayerHasItem {ItemId = 7077 }),
			Negated(PlayerHasItem {ItemId = 7080 }),
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_058PC", String = "Ich möchte diese Puppe des Helden verkaufen.", AnswerId = 71},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			PlayerHasItem {ItemId = 7079 },
			PlayerHasItem {ItemId = 7078 },
			PlayerHasItem {ItemId = 7077 },
			PlayerHasItem {ItemId = 7080 },
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			PlayerHasItem {ItemId = 7079 },
			PlayerHasItem {ItemId = 7078 },
			PlayerHasItem {ItemId = 7077 },
			PlayerHasItem {ItemId = 7080 },
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			PlayerHasItem {ItemId = 7079 },
			PlayerHasItem {ItemId = 7078 },
			PlayerHasItem {ItemId = 7077 },
			Negated(PlayerHasItem {ItemId = 7080 }),
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			PlayerHasItem {ItemId = 7079 },
			PlayerHasItem {ItemId = 7078 },
			PlayerHasItem {ItemId = 7077 },
			Negated(PlayerHasItem {ItemId = 7080 }),
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			PlayerHasItem {ItemId = 7079 },
			PlayerHasItem {ItemId = 7078 },
			Negated(PlayerHasItem {ItemId = 7077 }),
			PlayerHasItem {ItemId = 7080 },
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			PlayerHasItem {ItemId = 7079 },
			PlayerHasItem {ItemId = 7078 },
			Negated(PlayerHasItem {ItemId = 7077 }),
			PlayerHasItem {ItemId = 7080 },
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			PlayerHasItem {ItemId = 7079 },
			PlayerHasItem {ItemId = 7078 },
			Negated(PlayerHasItem {ItemId = 7077 }),
			Negated(PlayerHasItem {ItemId = 7080 }),
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			PlayerHasItem {ItemId = 7079 },
			PlayerHasItem {ItemId = 7078 },
			Negated(PlayerHasItem {ItemId = 7077 }),
			Negated(PlayerHasItem {ItemId = 7080 }),
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			PlayerHasItem {ItemId = 7079 },
			Negated(PlayerHasItem {ItemId = 7078 }),
			PlayerHasItem {ItemId = 7077 },
			PlayerHasItem {ItemId = 7080 },
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			PlayerHasItem {ItemId = 7079 },
			Negated(PlayerHasItem {ItemId = 7078 }),
			PlayerHasItem {ItemId = 7077 },
			PlayerHasItem {ItemId = 7080 },
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			PlayerHasItem {ItemId = 7079 },
			Negated(PlayerHasItem {ItemId = 7078 }),
			PlayerHasItem {ItemId = 7077 },
			Negated(PlayerHasItem {ItemId = 7080 }),
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			PlayerHasItem {ItemId = 7079 },
			Negated(PlayerHasItem {ItemId = 7078 }),
			PlayerHasItem {ItemId = 7077 },
			Negated(PlayerHasItem {ItemId = 7080 }),
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			PlayerHasItem {ItemId = 7079 },
			Negated(PlayerHasItem {ItemId = 7078 }),
			Negated(PlayerHasItem {ItemId = 7077 }),
			PlayerHasItem {ItemId = 7080 },
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			PlayerHasItem {ItemId = 7079 },
			Negated(PlayerHasItem {ItemId = 7078 }),
			Negated(PlayerHasItem {ItemId = 7077 }),
			PlayerHasItem {ItemId = 7080 },
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			PlayerHasItem {ItemId = 7079 },
			Negated(PlayerHasItem {ItemId = 7078 }),
			Negated(PlayerHasItem {ItemId = 7077 }),
			Negated(PlayerHasItem {ItemId = 7080 }),
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			PlayerHasItem {ItemId = 7079 },
			Negated(PlayerHasItem {ItemId = 7078 }),
			Negated(PlayerHasItem {ItemId = 7077 }),
			Negated(PlayerHasItem {ItemId = 7080 }),
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_060PC", String = "Ich möchte diese Puppe des Tricksters verkaufen.", AnswerId = 76},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			Negated(PlayerHasItem {ItemId = 7079 }),
			PlayerHasItem {ItemId = 7078 },
			PlayerHasItem {ItemId = 7077 },
			PlayerHasItem {ItemId = 7080 },
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			Negated(PlayerHasItem {ItemId = 7079 }),
			PlayerHasItem {ItemId = 7078 },
			PlayerHasItem {ItemId = 7077 },
			PlayerHasItem {ItemId = 7080 },
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			Negated(PlayerHasItem {ItemId = 7079 }),
			PlayerHasItem {ItemId = 7078 },
			PlayerHasItem {ItemId = 7077 },
			Negated(PlayerHasItem {ItemId = 7080 }),
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			Negated(PlayerHasItem {ItemId = 7079 }),
			PlayerHasItem {ItemId = 7078 },
			PlayerHasItem {ItemId = 7077 },
			Negated(PlayerHasItem {ItemId = 7080 }),
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			Negated(PlayerHasItem {ItemId = 7079 }),
			PlayerHasItem {ItemId = 7078 },
			Negated(PlayerHasItem {ItemId = 7077 }),
			PlayerHasItem {ItemId = 7080 },
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			Negated(PlayerHasItem {ItemId = 7079 }),
			PlayerHasItem {ItemId = 7078 },
			Negated(PlayerHasItem {ItemId = 7077 }),
			PlayerHasItem {ItemId = 7080 },
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			Negated(PlayerHasItem {ItemId = 7079 }),
			PlayerHasItem {ItemId = 7078 },
			Negated(PlayerHasItem {ItemId = 7077 }),
			Negated(PlayerHasItem {ItemId = 7080 }),
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			Negated(PlayerHasItem {ItemId = 7079 }),
			PlayerHasItem {ItemId = 7078 },
			Negated(PlayerHasItem {ItemId = 7077 }),
			Negated(PlayerHasItem {ItemId = 7080 }),
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_062PC", String = "Ich möchte diese Puppe des Torwächters verkaufen.", AnswerId = 81},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			Negated(PlayerHasItem {ItemId = 7079 }),
			Negated(PlayerHasItem {ItemId = 7078 }),
			PlayerHasItem {ItemId = 7077 },
			PlayerHasItem {ItemId = 7080 },
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			Negated(PlayerHasItem {ItemId = 7079 }),
			Negated(PlayerHasItem {ItemId = 7078 }),
			PlayerHasItem {ItemId = 7077 },
			PlayerHasItem {ItemId = 7080 },
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			Negated(PlayerHasItem {ItemId = 7079 }),
			Negated(PlayerHasItem {ItemId = 7078 }),
			PlayerHasItem {ItemId = 7077 },
			Negated(PlayerHasItem {ItemId = 7080 }),
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			Negated(PlayerHasItem {ItemId = 7079 }),
			Negated(PlayerHasItem {ItemId = 7078 }),
			PlayerHasItem {ItemId = 7077 },
			Negated(PlayerHasItem {ItemId = 7080 }),
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_064PC", String = "Ich möchte diese Puppe des Schatten verkaufen.", AnswerId = 86},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			Negated(PlayerHasItem {ItemId = 7079 }),
			Negated(PlayerHasItem {ItemId = 7078 }),
			Negated(PlayerHasItem {ItemId = 7077 }),
			PlayerHasItem {ItemId = 7080 },
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			Negated(PlayerHasItem {ItemId = 7079 }),
			Negated(PlayerHasItem {ItemId = 7078 }),
			Negated(PlayerHasItem {ItemId = 7077 }),
			PlayerHasItem {ItemId = 7080 },
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_066PC", String = "Ich möchte diese Puppe des Mentors verkaufen.", AnswerId = 91},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			Negated(PlayerHasItem {ItemId = 7079 }),
			Negated(PlayerHasItem {ItemId = 7078 }),
			Negated(PlayerHasItem {ItemId = 7077 }),
			Negated(PlayerHasItem {ItemId = 7080 }),
			PlayerHasItem {ItemId = 7081 },
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_068PC", String = "Ich möchte diese Puppe des Erzmagiers verkaufen.", AnswerId = 96},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7076 }),
			Negated(PlayerHasItem {ItemId = 7079 }),
			Negated(PlayerHasItem {ItemId = 7078 }),
			Negated(PlayerHasItem {ItemId = 7077 }),
			Negated(PlayerHasItem {ItemId = 7080 }),
			Negated(PlayerHasItem {ItemId = 7081 }),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_057", String = "Für einen Helden 1500 und für einen Erzmagier 2500 Goldstücke."},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_059", String = "Aber gern, hier habt Ihr 1500 Goldstücke."},
			Answer{Tag = "", String = "", AnswerId = 72},
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			
									TransferItem {TakeItem = 7076, Flag = Take},
									TransferMoney {Gold = 1500, Flag = Give},
									IncreaseGlobalCounter {Name = "g_P204_HadekoPuppetsSold"},
									IncreaseNpcCounter{Name ="npc_P204_BoughtHero"}
									,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 73},
		}}

	OnAnswer{73;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 74},
		}}

	OnAnswer{74;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 75},
		}}

	OnAnswer{75;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{76;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_061", String = "Natürlich, hier, 700 Goldstücke."},
			Answer{Tag = "", String = "", AnswerId = 77},
		}}

	OnAnswer{77;
		Conditions = {
		},
		Actions = {
			
									TransferItem {TakeItem = 7079, Flag = Take},
									TransferMoney {Gold = 700, Flag = Give},
									IncreaseGlobalCounter {Name = "g_P204_HadekoPuppetsSold"},
									IncreaseNpcCounter{Name ="npc_P204_BoughtTrickster"}
									,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 78},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 79},
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
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{81;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_063", String = "Hier habt Ihr 1000 Goldstücke."},
			Answer{Tag = "", String = "", AnswerId = 82},
		}}

	OnAnswer{82;
		Conditions = {
		},
		Actions = {
			
									TransferItem {TakeItem = 7078, Flag = Take},
									TransferMoney {Gold = 1000, Flag = Give},
									IncreaseGlobalCounter {Name = "g_P204_HadekoPuppetsSold"},
									IncreaseNpcCounter{Name ="npc_P204_BoughtDoorkeeper"}
									,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 83},
		}}

	OnAnswer{83;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 84},
		}}

	OnAnswer{84;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 85},
		}}

	OnAnswer{85;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{86;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_065", String = "Das wären dann 1000 Goldstücke für Euch."},
			Answer{Tag = "", String = "", AnswerId = 87},
		}}

	OnAnswer{87;
		Conditions = {
		},
		Actions = {
			
									TransferItem {TakeItem = 7077, Flag = Take},
									TransferMoney {Gold = 1000, Flag = Give},
									IncreaseGlobalCounter {Name = "g_P204_HadekoPuppetsSold"},
									IncreaseNpcCounter{Name ="npc_P204_BoughtShadow"}
									,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 88},
		}}

	OnAnswer{88;
		Conditions = {
		},
		Actions = {
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
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{91;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_067", String = "Wie Ihr wollt, hier, 1000 Goldstücke."},
			Answer{Tag = "", String = "", AnswerId = 92},
		}}

	OnAnswer{92;
		Conditions = {
		},
		Actions = {
			
									TransferItem {TakeItem = 7080, Flag = Take},
									TransferMoney {Gold = 1000, Flag = Give},
									IncreaseGlobalCounter {Name = "g_P204_HadekoPuppetsSold"},
									IncreaseNpcCounter{Name ="npc_P204_BoughtMentor"}
									,
			Say{Tag = "", String = ""},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{96;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_069", String = "Ah, diese ist besonders selten! Ich zahle gerne 2500 Goldstücke!"},
			Answer{Tag = "", String = "", AnswerId = 97},
		}}

	OnAnswer{97;
		Conditions = {
		},
		Actions = {
			
									TransferItem {TakeItem = 7081, Flag = Take},
									TransferMoney {Gold = 2500, Flag = Give},
									IncreaseGlobalCounter {Name = "g_P204_HadekoPuppetsSold"},
									IncreaseNpcCounter{Name ="npc_P204_BoughtArchmage"}
									,
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
			Answer{Tag = "", String = "", AnswerId = 100},
		}}

	OnAnswer{100;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{101;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_071", String = "Hm, nun, ich verkaufe sie nur ungern wieder, aber weil Ihr es seid ... Billig wird es aber nicht, das kann ich Euch versprechen."},
			Answer{Tag = "", String = "", AnswerId = 102},
		}}

	OnAnswer{102;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_072", String = "Für einen Trickster verlange ich 1500 Goldstücke. Für Schatten, Mentor und Torwächter je 2000 Goldstücke."},
			Answer{Tag = "", String = "", AnswerId = 103},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_074PC", String = "Ich möchte die Puppe des Helden zurückkaufen.", AnswerId = 104},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_076PC", String = "Ich möchte die Puppe des Tricksters zurückkaufen.", AnswerId = 109},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_078PC", String = "Ich möchte die Puppe des Torwächters zurückkaufen.", AnswerId = 114},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_080PC", String = "Ich möchte die Puppe des Schatten zurückkaufen.", AnswerId = 119},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									,
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_083PC", String = "Ich möchte die Puppe des Mentors zurückkaufen.", AnswerId = 125},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									,
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
			OfferAnswer{Tag = "puppet_masterP204_085PC", String = "Ich möchte die Puppe des Erzmagiers zurückkaufen.", AnswerId = 130},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtHero", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 3000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtTrickster", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 1500}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtDoorkeeper", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtShadow", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtMentor", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 2000}
									}
									),
			Negated(
								UND9{
									IsNpcCounter{Name = "npc_P204_BoughtArchmage", Value = 1, Operator = IsGreaterOrEqual},
									PlayerHasMoney{Gold = 5000}
									}
									),
		},
		Actions = {
			Say{Tag = "puppet_masterP204_073", String = "Für einen Helden 3000 und für einen Erzmagier 5000 Goldstücke."},
		}}

	OnAnswer{104;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_075", String = "Hier, nehmt ihn zurück."},
			Answer{Tag = "", String = "", AnswerId = 105},
		}}

	OnAnswer{105;
		Conditions = {
		},
		Actions = {
			
									TransferItem {GiveItem = 7076, Flag = Give},
									TransferMoney {Gold = 3000, Flag = Take},
									DecreaseGlobalCounter {Name = "g_P204_HadekoPuppetsSold"},
									DecreaseNpcCounter{Name ="npc_P204_BoughtHero"}
									,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 106},
		}}

	OnAnswer{106;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 107},
		}}

	OnAnswer{107;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 108},
		}}

	OnAnswer{108;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{109;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_077", String = "Hier, möge er Euch Glück bringen."},
			Answer{Tag = "", String = "", AnswerId = 110},
		}}

	OnAnswer{110;
		Conditions = {
		},
		Actions = {
			
									TransferItem {GiveItem = 7079, Flag = Give},
									TransferMoney {Gold = 1500, Flag = Take},
									DecreaseGlobalCounter {Name = "g_P204_HadekoPuppetsSold"},
									DecreaseNpcCounter{Name ="npc_P204_BoughtTrickster"}
									,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 111},
		}}

	OnAnswer{111;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 112},
		}}

	OnAnswer{112;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 113},
		}}

	OnAnswer{113;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{114;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_079", String = "Natürlich, hier."},
			Answer{Tag = "", String = "", AnswerId = 115},
		}}

	OnAnswer{115;
		Conditions = {
		},
		Actions = {
			
									TransferItem {GiveItem = 7078, Flag = Give},
									TransferMoney {Gold = 2000, Flag = Take},
									DecreaseGlobalCounter {Name = "g_P204_HadekoPuppetsSold"},
									DecreaseNpcCounter{Name ="npc_P204_BoughtDoorkeeper"}
									,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 116},
		}}

	OnAnswer{116;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 117},
		}}

	OnAnswer{117;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{118;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{119;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_081", String = "Hoppla, er ist weg!"},
			Answer{Tag = "", String = "", AnswerId = 120},
		}}

	OnAnswer{120;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_082", String = "Nein, ich spaße nur, hier ist er."},
			Answer{Tag = "", String = "", AnswerId = 121},
		}}

	OnAnswer{121;
		Conditions = {
		},
		Actions = {
			
									TransferItem {GiveItem = 7077, Flag = Give},
									TransferMoney {Gold = 2000, Flag = Take},
									DecreaseGlobalCounter {Name = "g_P204_HadekoPuppetsSold"},
									DecreaseNpcCounter{Name ="npc_P204_BoughtShadow"}
									,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 122},
		}}

	OnAnswer{122;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 123},
		}}

	OnAnswer{123;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 124},
		}}

	OnAnswer{124;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{125;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_084", String = "Ja, wer hätte die nicht gerne. Hier."},
			Answer{Tag = "", String = "", AnswerId = 126},
		}}

	OnAnswer{126;
		Conditions = {
		},
		Actions = {
			
									TransferItem {GiveItem = 7080, Flag = Give},
									TransferMoney {Gold = 2000, Flag = Take},
									DecreaseGlobalCounter {Name = "g_P204_HadekoPuppetsSold"},
									DecreaseNpcCounter{Name ="npc_P204_BoughtMentor"}
									,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 127},
		}}

	OnAnswer{127;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 128},
		}}

	OnAnswer{128;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 129},
		}}

	OnAnswer{129;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{130;
		Conditions = {
		},
		Actions = {
			Say{Tag = "puppet_masterP204_086", String = "Ach, Abschied tut weh. Aber das Gold wird mir Trost spenden."},
			Answer{Tag = "", String = "", AnswerId = 131},
		}}

	OnAnswer{131;
		Conditions = {
		},
		Actions = {
			
									TransferItem {GiveItem = 7081, Flag = Give},
									TransferMoney {Gold = 5000, Flag = Take},
									DecreaseGlobalCounter {Name = "g_P204_HadekoPuppetsSold"},
									DecreaseNpcCounter{Name ="npc_P204_BoughtArchmage"}
									,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 132},
		}}

	OnAnswer{132;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 133},
		}}

	OnAnswer{133;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 134},
		}}

	OnAnswer{134;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}


	EndDefinition()
end