-->INFO: Lorderic
-->INFO: Lordrim
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2}
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
-- Source: C:\project\main\mission\dialoge\p10\n2182_Lorderic.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "Q124SkarvigOKGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q124SkarvigOKGiven"}),
		},
		Actions = {
			Say{Tag = "lorderic022", String = "Hmrpf..."},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagLordericKnown"}),
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "lorderic004", String = "Grüße!"},
		}}

	OnAnswer{1;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagLordericKnown"},
		},
		Actions = {
			Say{Tag = "lorderic001", String = "Ah, Ihr müsst der Runendiener sein, von dem Skarvig berichtet hat?"},
			Answer{Tag = "lorderic001PC", String = "Aye! Seid gegrüßt!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lorderic002", String = "Willkommen! Ich bin Lorderic Svartlar! Ich braue das hiesige Bier... und andere Dinge!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagLordericKnown"},
			Say{Tag = "lorderic003", String = "Falls es Euch also dürstet - bei mir seid Ihr richtig!"},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lorderic005", String = "Nun, ich habe mich mit Kräuterzusätzen versucht - und dabei die Kräfte gewisser Pflanzen entdeckt!"},
			Answer{Tag = "lorderic005PC", String = "Ein Zwerg, der Kräuter sammelt und Tränke braut? Das klingt ungewöhnlich...", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lorderic006", String = "Ich weiß, ich weiß! Doch es hat sich als durchaus nützlich erwiesen! Und die Leute wissen es zu schätzen!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "LordrimAksedForBrew"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lorderic007", String = "Hmm... Das ist Essenz des Beißwurz! Sie wirkt giftig, wenn sie in offene Wunden gerät! Nicht gerade ein besonders starkes Gift! Aber es hält recht lange an! Deshalb eignet es sich recht gut, um..."},
			Answer{Tag = "lorderic007PC", String = "...eine Waffe zu vergiften?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lorderic008", String = "Das habt ihr gesagt! Es müsste noch eingedickt werden, damit es auf der Waffe hält!"},
			Answer{Tag = "lorderic008PC", String = "Könnt Ihr so etwas?", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lorderic009", String = "Können schon... aber wir Zwerge sind Krieger, keine Meuchelmörder! Für so etwas solltet Ihr in eine große Menschenstadt gehen, wie Graufurt!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			QuestBegin{QuestId = 179} , QuestBegin{QuestId = 180},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lorderic010", String = "Vom Heiltrank zum Gift fehlt nicht viel, falls Ihr das meint! Was habt Ihr vor?"},
			Answer{Tag = "lorderic010PC", String = "Nun, ich dachte da an einen gewissen Riesen! Ein Gift könnte ihn lähmen. Dann wäre es ein Leichtes, ihn zu bezwingen!", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lorderic011", String = "Hörgr? Ein solches Monstrum zu vergiften ist nicht eben einfach! Nicht ohne ihm gleich fässerweise Gift einzuflößen!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lorderic012", String = "Aber ich wüsste da vielleicht ein Mittel, das wirken könnte... zumindest würde es ihn eine zeitlang schwächen... man nennt es den Grünen Schlaf!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 151} , SetNpcFlagTrue{Name = "GreenSleepAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{16;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lorderic013", String = "Dazu benötige ich einige Zutaten! So etwas hat ein Zwerg nicht mal eben auf Lager!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lorderic014", String = "Ich brauche Beißfarn und Weberkraut, die sollten nicht allzu schwer zu finden sein! Dazu noch Silberwind und Schwarzhalm! Die wachsen nur weit oben, in den Ostbergen!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lorderic015", String = "Die wichtigste Ingredienz aber ist ein Gift, das von den Spinnen in der Kaltmark gewonnen wird! Man nennt es das Gift der Dunkelläufer!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lorderic016", String = "Bringt mir diese Zutaten und Ihr sollt Euer Gift bekommen!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 152} , QuestBegin{QuestId = 153} , 
						QuestBegin{QuestId = 154} , QuestBegin{QuestId = 155} , 
						QuestBegin{QuestId = 177} , SetNpcFlagFalse{Name = "GreenSleepAsked"},
						QuestSolve{QuestId = 150},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lorderic017", String = "Sehr gut, ich habe schon alles vorbereitet! Geduldet Euch einen Moment..."},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lorderic018", String = "So, hier habt Ihr das Gift! Aber wenn Ihr es ihm verabreichen wollt, dann braucht Ihr einen Köder! Er muss es schlucken!"},
			Answer{Tag = "lorderic018PC", String = "Verdammt, daran habe ich noch gar nicht gedacht... Schlucken sagt Ihr?", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lorderic019", String = "Ja, es ist schließlich kein Schwertgift! Wie wäre es, wenn Ihr etwas Rindfleisch mit dem Gift behandelt... Riesen sind dumm und gefrässig! Blutiges Fleisch weckt ihre Gier!"},
			Answer{Tag = "lorderic019PC", String = "Und wie bringe ich das Fleisch zu ihm?", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lorderic020", String = "Ihr müsst Euch nachts an ihn heranschleichen! Hängt das Fleisch an seinen Gürtel! Es muss leise und schnell gehen, sonst bemerkt er Euch!"},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "lorderic021", String = "Sobald er erwacht, wird er das vergiftet Fleisch fressen! Dann ist er leichte Beute für Eure Klinge!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 178} , QuestSolve{QuestId = 151} , QuestBegin{QuestId = 156} , TransferItem{GiveItem = 2487 , Amount = 1 , Flag = Give} , 
				TransferItem{TakeItem = 2477 , Amount = 1 , Flag = Take} , 
				TransferItem{TakeItem = 2478 , Amount = 1 , Flag = Take} , 
				TransferItem{TakeItem = 2479 , Amount = 1 , Flag = Take} , 
				TransferItem{TakeItem = 2480 , Amount = 1 , Flag = Take} , 
				TransferItem{TakeItem = 2510 , Amount = 1 , Flag = Take},
				SetRewardFlagTrue{ Name = "JeGroesser1"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			IsNpcFlagFalse{Name = "LordrimAksedForBrew"},
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic004PC", String = "Ihr braut noch mehr als Bier?", AnswerId = 4},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"},
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic006PC", String = "Dann erkennt Ihr vielleicht diese Substanz hier?", AnswerId = 8},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			QuestState{QuestId = 151 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic009PC", String = "Hmm... fertigt Ihr auch... düstere Gebräue?", AnswerId = 12},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"}),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic012PC", String = "Fertigt mir den Grünen Schlaf!", AnswerId = 17},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			QuestState{QuestId = 178 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "lorderic016PC", String = "Hier sind die Zutaten!", AnswerId = 23},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "LordrimAksedForBrew"}),
			Negated(IsPlayerFlagTrue{Name = "Q179HasEssenceandNotQuest"}),
			Negated(QuestState{QuestId = 151 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 151 , State = StateActive} , IsNpcFlagTrue{Name = "GreenSleepAsked"})),
			Negated(QuestState{QuestId = 178 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end