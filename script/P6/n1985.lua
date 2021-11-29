-->INFO: Bryal
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

-- Ritter Quest aktiv
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 103, State = StateActive}
			},
Actions = {
		SetNpcFlagFalse{Name = "HasMainquest"},
		}
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p6\n1985_Bryal.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagBryalKnown"},
		},
		Actions = {
			Say{Tag = "bryal001", String = "Wer seid Ihr?"},
			Answer{Tag = "bryal001PC", String = "Ein Bote des Ordens! Ich muss Rohen sprechen! Rasch!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBryalKnown"}),
			UND(QuestState{QuestId = 103 , State = StateUnknown} , IsNpcFlagFalse{Name ="WildlandAsked"}),
		},
		Actions = {
			Say{Tag = "bryal003", String = "Ah, Freund!"},
			OfferAnswer{Tag = "bryal003PC", String = "Was ist geschehen?", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBryalKnown"}),
			Negated(UND(QuestState{QuestId = 103 , State = StateUnknown} , IsNpcFlagFalse{Name ="WildlandAsked"})),
		},
		Actions = {
			Say{Tag = "bryal003", String = "Ah, Freund!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bryal002", String = "Das ist leider unmöglich!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			UND(QuestState{QuestId = 103 , State = StateUnknown} , IsNpcFlagFalse{Name ="WildlandAsked"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBryalKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bryal003PC", String = "Was ist geschehen?", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(UND(QuestState{QuestId = 103 , State = StateUnknown} , IsNpcFlagFalse{Name ="WildlandAsked"})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBryalKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bryal004", String = "Vor einigen Tagen drangen wir bis an diesen Ort vor! Fast schien es, als würden sich Brannigans Truppen vor uns verstecken! Die wenigen Male, die wir auf sie trafen, ließen sie uns unbehelligt!"},
			Answer{Tag = "bryal004PC", String = "Wo ist Rohen?", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bryal005", String = "Als wir den Pass erreichten, griffen sie uns plötzlich mit aller Wucht an! Wir wurden von Rohen getrennt und mussten uns hierher zurückziehen! Wir glauben, dass er weiter nach Osten vorgestoßen ist!"},
			Answer{Tag = "bryal005PC", String = "Dann ist er noch am Leben?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bryal006", String = "Ja, davon gehen wir aus! Die Horden der Schwarzen Faust können kaum etwas gegen einen Zirkelmagier ausrichten! Aber Ihr solltet mit unserem Anführer sprechen, Meister Swanson!"},
			Answer{Tag = "bryal006PC", String = "Wo finde ich Meister Swanson?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 102} , SetNpcFlagTrue{Name ="WildlandAsked"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "bryal007", String = "Im Dorf nördlich von hier! Dort haben wir uns verschanzt!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			UND(QuestState{QuestId = 103 , State = StateUnknown} , IsNpcFlagFalse{Name ="WildlandAsked"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bryal003PC", String = "Was ist geschehen?", AnswerId = 3},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(QuestState{QuestId = 103 , State = StateUnknown} , IsNpcFlagFalse{Name ="WildlandAsked"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end