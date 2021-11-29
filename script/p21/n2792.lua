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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint002", String = "Krieg zwischen den Armeen der roten Legion und den Briarwölfen! Wir kämpfen um die Vorherrschaft und die Wasserquellen in diesem Land! Seid Ihr nicht der, der den Gottwall befreit hat?"},
			Answer{Tag = "flint002PC", String = "Ja! Ich bin dort bereits Euren Leuten und den Briarwölfen begegnet!", AnswerId = 2},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint003", String = "Dann führt Euren Kampf fort! Es gibt Runenmonumente in diesem Land! Kämpft an unsere Seite! Gemeinsam können wir die Briarwölfe endgültig vernichten!"},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint005", String = "Man nennt es Farlorns Heim. Der Name stammt von dem Handelsposten der Freihändler. Er liegt an dem See in der Mitte des Landes!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint006", String = "Der See ist die letzte große und beständige Wasserquelle in dieser Region! Für uns allein würde das Wasser reichen. Doch seitdem die Briarwölfe hier sind, wird jeder Tropfen mit Blut bezahlt!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint007", String = "Jetzt müssen wir kämpfen, bis nur noch eine Gruppe übrig ist! Noch ist der Kampf unentschieden. Wir kontrollieren den Osten, die Briarwölfe den Westen! Der Norden ist Drachenland, dorthin wagt sich niemand!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint008", String = "Ein paar Mal hatten wir die Wölfe schon weit zurückgeschlagen. Aber die Verteidigung ihres Hauptlagers ist einfach zu stark!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint009", String = "Ihr habt uns auf dem Gottwall einen großen Dienst erwiesen! Unser Kommandant wird Euch sicherlich sehen wollen! Eure Macht kann uns helfen, die Wölfe ein für alle mal zu vertreiben!"},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint010", String = "Kommandant Halicos ist in unserem Hauptquartier, südöstlich von hier!"},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint011", String = "Es gibt eins unten im Tal, nahe dem Handelsposten! Ein hässliches Ding mit einer Orkstatue drauf!"},
			Answer{Tag = "flint011PC", String = "Eine Orkstatue...? Hm...", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "flint012PC", String = "Was würden Eure Leute tun, wenn ihnen plötzlich Orks zur Hilfe eilten?", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint013", String = "Sie würden es wahrscheinlich als Angriff verstehen und die Orks niedermachen. Alter Hass, versteht Ihr?"},
			Answer{Tag = "flint013PC", String = "Ja... so etwas hatte ich befürchtet! Dann werde ich meine Armeen von den Euren fernhalten müssen!", AnswerId = 16},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint015", String = "Farlorn ist neutral. Ihr werdet dort auf keinerlei Schwierigkeiten stoßen! Es ist der letzte sichere Fleck in diesem Land..."},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			Say{Tag = "flint016", String = "Ein windiges, kleines Wiesel! Es gibt niemanden hier in den Düsterlanden, der ihn nicht sucht!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flint017", String = "Er hat sich unter Farlorns Fittichen verkrochen! Das ist allerdings schon eine Weile her. Fragt Farlorn am besten selbst nach ihm! Ich wette, dieses Wiesel hat sich schon längst wieder aus dem Staub gemacht!"},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint009PC", String = "Wo finde ich Euren Kommandanten?", AnswerId = 10},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint010PC", String = "Gibt es hier Runenmonumente?", AnswerId = 13},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint013PCa", String = "Wo finde ich Farlorn?", AnswerId = 19},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint004PC", String = "Was ist das für ein Land?", AnswerId = 3},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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
			OfferAnswer{Tag = "flint015PC", String = "Habt Ihr etwas über einen Dieb namens Armun gehört?", AnswerId = 23},
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