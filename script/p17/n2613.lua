-->INFO: tamira
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
SpawnOnlyWhen
{
	X = _X , Y = _Y ,
	Conditions = 
	{
		FigureDead{NpcId = 2569},
		IsGlobalFlagTrue {Name = "LetztesCamp1"}, 
		IsGlobalFlagTrue {Name = "LetztesCamp2"}, 
	}
}

OnIdleGoHome{WalkMode = Run, X = 140, Y = 323, Direction = 0}



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
-- Source: C:\project\main\mission\dialoge\p17\n2613_tamira.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagTamiraKnown"},
		},
		Actions = {
			Say{Tag = "tamira001", String = "Wir haben Euch beobachtet, als Ihr den Wall heraufgekommen seid! Wer seid Ihr? Und was f�hrt Euch hierher?"},
			Answer{Tag = "tamira001PC", String = "Ich bin auf dem Weg nach Norden, Frau...?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagTamiraKnown"}),
			IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"},
			QuestState{QuestId = 250 , State = StateActive},
		},
		Actions = {
			Say{Tag = "tamira004", String = "Gr��e, Runenkrieger!"},
			OfferAnswer{Tag = "tamira004PC", String = "K�nnt Ihr mich unterst�tzen?", AnswerId = 3},
			OfferAnswer{Tag = "tamira006PC", String = "K�nnt Ihr noch mehr Rohstoffe entbehren?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagTamiraKnown"}),
			IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"},
			Negated(QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "tamira004", String = "Gr��e, Runenkrieger!"},
			OfferAnswer{Tag = "tamira004PC", String = "K�nnt Ihr mich unterst�tzen?", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagTamiraKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"}),
			QuestState{QuestId = 250 , State = StateActive},
		},
		Actions = {
			Say{Tag = "tamira004", String = "Gr��e, Runenkrieger!"},
			OfferAnswer{Tag = "tamira006PC", String = "K�nnt Ihr noch mehr Rohstoffe entbehren?", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagTamiraKnown"}),
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"}),
			Negated(QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "tamira004", String = "Gr��e, Runenkrieger!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tamira002", String = "Verzeiht, ich bin Tamira! Ich besitze den gr��ten Hof hier auf dem Wall! Warum habt Ihr die S�ldner angegriffen? Wir haben Euch nicht um Eure Hilfe gebeten! Nun werden sie sich an uns r�chen!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"},
			QuestState{QuestId = 250 , State = StateActive},
		},
		Actions = {
			SetRewardFlagTrue{ Name = "AufDemWall4Village4"},
			SetNpcFlagTrue{Name = "FlagTamiraKnown"},
			Say{Tag = "tamira003", String = "Ihr m�sst beenden, was Ihr begonnen habt! Nur wenn keiner von ihnen mehr zu ihrem Nest in Farlorns Heim zur�ckkehrt, sind wir in Sicherheit!"},
			OfferAnswer{Tag = "tamira004PC", String = "K�nnt Ihr mich unterst�tzen?", AnswerId = 3},
			OfferAnswer{Tag = "tamira006PC", String = "K�nnt Ihr noch mehr Rohstoffe entbehren?", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"},
			Negated(QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			SetRewardFlagTrue{ Name = "AufDemWall4Village4"},
			SetNpcFlagTrue{Name = "FlagTamiraKnown"},
			Say{Tag = "tamira003", String = "Ihr m�sst beenden, was Ihr begonnen habt! Nur wenn keiner von ihnen mehr zu ihrem Nest in Farlorns Heim zur�ckkehrt, sind wir in Sicherheit!"},
			OfferAnswer{Tag = "tamira004PC", String = "K�nnt Ihr mich unterst�tzen?", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"}),
			QuestState{QuestId = 250 , State = StateActive},
		},
		Actions = {
			SetRewardFlagTrue{ Name = "AufDemWall4Village4"},
			SetNpcFlagTrue{Name = "FlagTamiraKnown"},
			Say{Tag = "tamira003", String = "Ihr m�sst beenden, was Ihr begonnen habt! Nur wenn keiner von ihnen mehr zu ihrem Nest in Farlorns Heim zur�ckkehrt, sind wir in Sicherheit!"},
			OfferAnswer{Tag = "tamira006PC", String = "K�nnt Ihr noch mehr Rohstoffe entbehren?", AnswerId = 7},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"}),
			Negated(QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			SetRewardFlagTrue{ Name = "AufDemWall4Village4"},
			SetNpcFlagTrue{Name = "FlagTamiraKnown"},
			Say{Tag = "tamira003", String = "Ihr m�sst beenden, was Ihr begonnen habt! Nur wenn keiner von ihnen mehr zu ihrem Nest in Farlorns Heim zur�ckkehrt, sind wir in Sicherheit!"},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tamira005", String = "Was meint Ihr? Mit Harken und Schaufeln?"},
			Answer{Tag = "tamira005PC", String = "Nein, mit Holz und Eisen...", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tamira006", String = "Erst m�sst Ihr uns von dieser S�ldnerplage befreien! Und denkt daran: unser Land ist karg und arm! Erwartet also nicht zuviel!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			TransferResource{Resource = GoodBoard , Side = SideLight, Amount = 850, Flag = Give},
					TransferResource{Resource = GoodStone , Side = SideLight, Amount = 450, Flag = Give},
					TransferResource{Resource = GoodIron , Side = SideLight, Amount = 850, Flag = Give},
					TransferResource{Resource = GoodFood , Side = SideLight, Amount = 550, Flag = Give},
					TransferResource{Resource = GoodMithril , Side = SideLight, Amount = 550, Flag = Give},
					SetPlayerFlagTrue{Name = "Q248RessourcesMainGivenOnce"} , SetGlobalFlagFalse{Name = "Q248WaresMainOk"},
					SetGlobalTimeStamp{Name = "Q248OMainResTimer"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"},
			QuestState{QuestId = 250 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tamira004PC", String = "K�nnt Ihr mich unterst�tzen?", AnswerId = 3},
			OfferAnswer{Tag = "tamira006PC", String = "K�nnt Ihr noch mehr Rohstoffe entbehren?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"},
			Negated(QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tamira004PC", String = "K�nnt Ihr mich unterst�tzen?", AnswerId = 3},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"}),
			QuestState{QuestId = 250 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tamira006PC", String = "K�nnt Ihr noch mehr Rohstoffe entbehren?", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"}),
			Negated(QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q248WaresMainOk"},
		},
		Actions = {
			Say{Tag = "tamira007", String = "Ich werde sehen, was ich tun kann! Ich hoffe, Euer Kampf hier dauert nicht mehr allzu lange!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q248WaresMainOk"}),
		},
		Actions = {
			Say{Tag = "tamira008", String = "Seht zu, dass Ihr erst einmal ohne uns zurecht kommt! Wir m�ssen erst die Sch�den an unseren H�usern reparieren!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			TransferResource{Resource = GoodBoard , Side = SideLight, Amount = 850, Flag = Give},
					TransferResource{Resource = GoodStone , Side = SideLight, Amount = 450, Flag = Give},
					TransferResource{Resource = GoodIron , Side = SideLight, Amount = 850, Flag = Give},
					TransferResource{Resource = GoodFood , Side = SideLight, Amount = 550, Flag = Give},
					TransferResource{Resource = GoodMithril , Side = SideLight, Amount = 550, Flag = Give},
					SetPlayerFlagTrue{Name = "Q248RessourcesMainGivenOnce"} , SetGlobalFlagFalse{Name = "Q248WaresMainOk"},
					SetGlobalTimeStamp{Name = "Q248OMainResTimer"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"},
			QuestState{QuestId = 250 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tamira004PC", String = "K�nnt Ihr mich unterst�tzen?", AnswerId = 3},
			OfferAnswer{Tag = "tamira006PC", String = "K�nnt Ihr noch mehr Rohstoffe entbehren?", AnswerId = 7},
		}}

	OnAnswer{9;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"},
			Negated(QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tamira004PC", String = "K�nnt Ihr mich unterst�tzen?", AnswerId = 3},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"}),
			QuestState{QuestId = 250 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tamira006PC", String = "K�nnt Ihr noch mehr Rohstoffe entbehren?", AnswerId = 7},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"}),
			Negated(QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"},
			QuestState{QuestId = 250 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tamira004PC", String = "K�nnt Ihr mich unterst�tzen?", AnswerId = 3},
			OfferAnswer{Tag = "tamira006PC", String = "K�nnt Ihr noch mehr Rohstoffe entbehren?", AnswerId = 7},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"},
			Negated(QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tamira004PC", String = "K�nnt Ihr mich unterst�tzen?", AnswerId = 3},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"}),
			QuestState{QuestId = 250 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tamira006PC", String = "K�nnt Ihr noch mehr Rohstoffe entbehren?", AnswerId = 7},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "Q248RessourcesMainGivenOnce"}),
			Negated(QuestState{QuestId = 250 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end