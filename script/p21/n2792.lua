-->INFO: flint
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--Dialogsteuerung
--Umschalter
OnToggleEvent
{
OnConditions = {
			IsNpcFlagTrue{Name = "HasMainquest"},
			},
OnActions = {
		SetDialogType{Type = MainQuest}
		},
OffConditions = {
			IsNpcFlagFalse{Name = "HasMainquest"},
			},
OffActions = {
		SetDialogType{Type = SideQuest}
		},
}
--initial
OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p21\n2792_flint.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagFlintKnown"},
		},
		Actions = {
			Say{Tag = "flint001", String = "Wer seid Ihr? Weist Euch aus!"},
			Answer{Tag = "flint001PC", String = "Ein Gesandter des Ordens! Was geht hier vor?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagFlintKnown"}),
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "flint004", String = "Ah, Ihr seid es!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint002", String = "Krieg zwischen den Armeen der roten Legion und den Briarw�lfen! Wir k�mpfen um die Vorherrschaft und die Wasserquellen in diesem Land! Seid Ihr nicht der, der den Gottwall befreit hat?"},
			Answer{Tag = "flint002PC", String = "Ja! Ich bin dort bereits Euren Leuten und den Briarw�lfen begegnet!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagFlintKnown"},
			Say{Tag = "flint003", String = "Dann f�hrt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! K�mpft an unsere Seite! Gemeinsam k�nnen wir die Briarw�lfe endg�ltig vernichten!"},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint005", String = "Man nennt es Farlorns Heim. Der Name stammt von dem Handelsposten der Freih�ndler. Er liegt an dem See in der Mitte des Landes!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint006", String = "Der See ist die letzte gro�e und best�ndige Wasserquelle in dieser Region! F�r uns allein w�rde das Wasser reichen. Doch seitdem die Briarw�lfe hier sind, wird jeder Tropfen mit Blut bezahlt!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint007", String = "Jetzt m�ssen wir k�mpfen, bis nur noch eine Gruppe �brig ist! Noch ist der Kampf unentschieden. Wir kontrollieren den Osten, die Briarw�lfe den Westen! Der Norden ist Drachenland, dorthin wagt sich niemand!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint008", String = "Ein paar Mal hatten wir die W�lfe schon weit zur�ckgeschlagen. Aber die Verteidigung ihres Hauptlagers ist einfach zu stark!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint009", String = "Ihr habt uns auf dem Gottwall einen gro�en Dienst erwiesen! Unser Kommandant wird Euch sicherlich sehen wollen! Eure Macht kann uns helfen, die W�lfe ein f�r alle mal zu vertreiben!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			 QuestBegin{QuestId = 273} , QuestBegin{QuestId = 274}  , QuestSolve{QuestId = 272} , 
				SetNpcFlagTrue{Name = "InfoTrader"} , RevealUnExplored{X = 265 , Y = 204 , Range  = 25} , RevealUnExplored{X = 105 , Y = 310 , Range  = 10},
			SetPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint010", String = "Kommandant Halicos ist in unserem Hauptquartier, s�d�stlich von hier!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			RevealUnExplored{X = 419 , Y = 213 , Range = 15} , 
					SetPlayerFlagFalse{Name = "Q272InfoGotoHalicos"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint011", String = "Es gibt eins unten im Tal, nahe dem Handelsposten! Ein h�ssliches Ding mit einer Orkstatue drauf!"},
			Answer{Tag = "flint011PC", String = "Eine Orkstatue...? Hm...", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "flint012PC", String = "Was w�rden Eure Leute tun, wenn ihnen pl�tzlich Orks zur Hilfe eilten?", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint013", String = "Sie w�rden es wahrscheinlich als Angriff verstehen und die Orks niedermachen. Alter Hass, versteht Ihr?"},
			Answer{Tag = "flint013PC", String = "Ja... so etwas hatte ich bef�rchtet! Dann werde ich meine Armeen von den Euren fernhalten m�ssen!", AnswerId = 16},
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
			SetNpcFlagTrue{Name = "MonumentsAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint014", String = "Folgt dem Weg ins Tal! Sein Handelsposten liegt in der fruchtbaren Senke in der Mitte des Landes!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint015", String = "Farlorn ist neutral. Ihr werdet dort auf keinerlei Schwierigkeiten sto�en! Es ist der letzte sichere Fleck in diesem Land..."},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "InfoTrader"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint016", String = "Ein windiges, kleines Wiesel! Es gibt niemanden hier in den D�sterlanden, der ihn nicht sucht!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint017", String = "Er hat sich unter Farlorns Fittichen verkrochen! Das ist allerdings schon eine Weile her. Fragt Farlorn am besten selbst nach ihm! Ich wette, dieses Wiesel hat sich schon l�ngst wieder aus dem Staub gemacht!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ArmunAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{26;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{26;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{26;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
		}}

	OnAnswer{26;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{26;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{26;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{26;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			QuestState{QuestId = 272 , State = StateActive},
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das f�r ein Land?", AnswerId = 3},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"},
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			IsNpcFlagFalse{Name = "MonumentsAsked"},
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"}),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas �ber einen Dieb namens Armun geh�rt?", AnswerId = 23},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(QuestState{QuestId = 272 , State = StateActive}),
			Negated(IsPlayerFlagTrue{Name = "Q272InfoGotoHalicos"}),
			Negated(IsNpcFlagFalse{Name = "MonumentsAsked"}),
			Negated(ODER(UND(QuestState{QuestId = 306 , State = StateActive} , IsNpcFlagTrue{Name = "InfoTrader"}) , IsNpcFlagTrue{Name = "InfoTrader"})),
			Negated(UND(QuestState{QuestId = 299 , State = StateActive} , IsNpcFlagFalse{Name = "ArmunAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end