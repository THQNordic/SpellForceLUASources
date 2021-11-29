-->INFO: jon
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X , Y = _Y ,
	Conditions = 
	{
		FigureDead{NpcId = 2566},
		IsGlobalFlagTrue {Name = "ZwergenCamp"}, 
	}
}

OnIdleGoHome{WalkMode = Run, X = 181, Y = 173, Direction = 0}

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
-- Source: C:\project\main\mission\dialoge\p17\n2614_jon.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagJonKnown"},
		},
		Actions = {
			Say{Tag = "jonGW001", String = "Ein Runenkrieger?! Verflucht! Das erklärt einiges! Schätze, wir schulden Euch Dank - und alles was dazugehört!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagJonKnown"}),
			UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672})),
			IsNpcFlagTrue{Name = "OfferWaresVone"},
		},
		Actions = {
			Say{Tag = "jonGW004", String = "Der Runenkrieger ist zurück! Grüße, Freund!"},
			OfferAnswer{Tag = "jonGW004PC", String = "Was genau habt Ihr mit anzubieten?", AnswerId = 3},
			OfferAnswer{Tag = "jonGW007PC", String = "Ich benötige Rohstoffe!", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagJonKnown"}),
			UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672})),
			Negated(IsNpcFlagTrue{Name = "OfferWaresVone"}),
		},
		Actions = {
			Say{Tag = "jonGW004", String = "Der Runenkrieger ist zurück! Grüße, Freund!"},
			OfferAnswer{Tag = "jonGW004PC", String = "Was genau habt Ihr mit anzubieten?", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagJonKnown"}),
			Negated(UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672}))),
			IsNpcFlagTrue{Name = "OfferWaresVone"},
		},
		Actions = {
			Say{Tag = "jonGW004", String = "Der Runenkrieger ist zurück! Grüße, Freund!"},
			OfferAnswer{Tag = "jonGW007PC", String = "Ich benötige Rohstoffe!", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagJonKnown"}),
			Negated(UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672}))),
			Negated(IsNpcFlagTrue{Name = "OfferWaresVone"}),
		},
		Actions = {
			Say{Tag = "jonGW004", String = "Der Runenkrieger ist zurück! Grüße, Freund!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jonGW002", String = "Ich bin John Goddard! Schmied und Schankwirt! Den Burschen habt Ihr aber ordentlich eingeheizt, was!"},
			Answer{Tag = "jonGW002PC", String = "Das waren nur Plünderer. Und bis zur Spitze des Walles ist es noch ein langer Weg!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672})),
			IsNpcFlagTrue{Name = "OfferWaresVone"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagJonKnown"},
			Say{Tag = "jonGW003", String = "Das stimmt! Da habt Ihr noch ein gehöriges Stück vor Euch! Vielleicht kann ich Euch und Euren Leuten etwas mehr anbieten, als nur Bier oder Hufeisen!"},
			OfferAnswer{Tag = "jonGW004PC", String = "Was genau habt Ihr mit anzubieten?", AnswerId = 3},
			OfferAnswer{Tag = "jonGW007PC", String = "Ich benötige Rohstoffe!", AnswerId = 8},
		}}

	OnAnswer{2;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672})),
			Negated(IsNpcFlagTrue{Name = "OfferWaresVone"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagJonKnown"},
			Say{Tag = "jonGW003", String = "Das stimmt! Da habt Ihr noch ein gehöriges Stück vor Euch! Vielleicht kann ich Euch und Euren Leuten etwas mehr anbieten, als nur Bier oder Hufeisen!"},
			OfferAnswer{Tag = "jonGW004PC", String = "Was genau habt Ihr mit anzubieten?", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672}))),
			IsNpcFlagTrue{Name = "OfferWaresVone"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagJonKnown"},
			Say{Tag = "jonGW003", String = "Das stimmt! Da habt Ihr noch ein gehöriges Stück vor Euch! Vielleicht kann ich Euch und Euren Leuten etwas mehr anbieten, als nur Bier oder Hufeisen!"},
			OfferAnswer{Tag = "jonGW007PC", String = "Ich benötige Rohstoffe!", AnswerId = 8},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672}))),
			Negated(IsNpcFlagTrue{Name = "OfferWaresVone"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagJonKnown"},
			Say{Tag = "jonGW003", String = "Das stimmt! Da habt Ihr noch ein gehöriges Stück vor Euch! Vielleicht kann ich Euch und Euren Leuten etwas mehr anbieten, als nur Bier oder Hufeisen!"},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jonGW005", String = "Nun, vielleicht ist Euch schon die verschlossene Ruine hinter unserem Dorf aufgefallen? Sie stammt noch aus der Zeit vor dem Krieg."},
			Answer{Tag = "jonGW005PC", String = "Sie machte auf mich den Eindruck zwergischer Herkunft!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jonGW006", String = "Verflucht richtig! Und dreimal dürft Ihr raten, wer den Schlüssel für das Tor von diesem Ding gefunden hat..."},
			Answer{Tag = "jonGW006PC", String = "Ein gewisser Schmied und Schankwirt, nehme ich an?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jonGW007", String = "So ist es! Und nun gehört der Schlüssel Euch! Hier habt Ihr ihn! Hoffe mal, Ihr findet darin was nützliches! Und wenn Ihr irgendwelche Waren benötigt, dann gebt mir Bescheid! Wir stehen in Eurer Schuld!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 2672 , Amount = 1 , Flag = Give} , 
			SetNpcFlagTrue{Name = "OfferWaresVone"} , 
			SetGlobalFlagTrue{Name = "Q248WaresVoneOk"},
			SetNpcFlagTrue{Name = "GiveKey"},
			SetRewardFlagTrue{ Name = "AufDemWall2Village2"},
			SetNpcFlagFalse{Name = "HasMainquest"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672})),
			IsNpcFlagTrue{Name = "OfferWaresVone"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonGW004PC", String = "Was genau habt Ihr mit anzubieten?", AnswerId = 3},
			OfferAnswer{Tag = "jonGW007PC", String = "Ich benötige Rohstoffe!", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672})),
			Negated(IsNpcFlagTrue{Name = "OfferWaresVone"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonGW004PC", String = "Was genau habt Ihr mit anzubieten?", AnswerId = 3},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672}))),
			IsNpcFlagTrue{Name = "OfferWaresVone"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonGW007PC", String = "Ich benötige Rohstoffe!", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672}))),
			Negated(IsNpcFlagTrue{Name = "OfferWaresVone"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q248WaresVoneOk"}),
		},
		Actions = {
			Say{Tag = "jonGW009", String = "Tut mir leid Freund! Zur Zeit können wir nichts entbehren! Ich muss erst mal sehen, wie viel wir für die Reparaturen hier noch brauchen! Kommt später noch einmal wieder!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{8;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q248WaresVoneOk"},
		},
		Actions = {
			Say{Tag = "jonGW008", String = "Aye, so soll es sein! Ich lasse ein paar Sachen in Euer Lager bringen!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672})),
			IsNpcFlagTrue{Name = "OfferWaresVone"},
		},
		Actions = {
			TransferResource{Resource = GoodStone , Side = SideLight, Amount = 500 , Flag = Give}, 
				TransferResource{Resource = GoodIron , Side = SideLight, Amount = 750 , Flag = Give}, 
				TransferResource{Resource = GoodMithril , Side = SideLight, Amount = 350 , Flag = Give}, 
				TransferResource{Resource = GoodFood , Side = SideLight, Amount = 350 , Flag = Give}, 
				SetPlayerFlagTrue{Name = "Q248RessourcesVoneGiven"} , SetGlobalFlagFalse{Name = "Q248WaresVoneOk"},
				SetGlobalTimeStamp{Name = "Q248OVoneTimer"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonGW004PC", String = "Was genau habt Ihr mit anzubieten?", AnswerId = 3},
			OfferAnswer{Tag = "jonGW007PC", String = "Ich benötige Rohstoffe!", AnswerId = 8},
		}}

	OnAnswer{9;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672})),
			Negated(IsNpcFlagTrue{Name = "OfferWaresVone"}),
		},
		Actions = {
			TransferResource{Resource = GoodStone , Side = SideLight, Amount = 500 , Flag = Give}, 
				TransferResource{Resource = GoodIron , Side = SideLight, Amount = 750 , Flag = Give}, 
				TransferResource{Resource = GoodMithril , Side = SideLight, Amount = 350 , Flag = Give}, 
				TransferResource{Resource = GoodFood , Side = SideLight, Amount = 350 , Flag = Give}, 
				SetPlayerFlagTrue{Name = "Q248RessourcesVoneGiven"} , SetGlobalFlagFalse{Name = "Q248WaresVoneOk"},
				SetGlobalTimeStamp{Name = "Q248OVoneTimer"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonGW004PC", String = "Was genau habt Ihr mit anzubieten?", AnswerId = 3},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672}))),
			IsNpcFlagTrue{Name = "OfferWaresVone"},
		},
		Actions = {
			TransferResource{Resource = GoodStone , Side = SideLight, Amount = 500 , Flag = Give}, 
				TransferResource{Resource = GoodIron , Side = SideLight, Amount = 750 , Flag = Give}, 
				TransferResource{Resource = GoodMithril , Side = SideLight, Amount = 350 , Flag = Give}, 
				TransferResource{Resource = GoodFood , Side = SideLight, Amount = 350 , Flag = Give}, 
				SetPlayerFlagTrue{Name = "Q248RessourcesVoneGiven"} , SetGlobalFlagFalse{Name = "Q248WaresVoneOk"},
				SetGlobalTimeStamp{Name = "Q248OVoneTimer"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonGW007PC", String = "Ich benötige Rohstoffe!", AnswerId = 8},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672}))),
			Negated(IsNpcFlagTrue{Name = "OfferWaresVone"}),
		},
		Actions = {
			TransferResource{Resource = GoodStone , Side = SideLight, Amount = 500 , Flag = Give}, 
				TransferResource{Resource = GoodIron , Side = SideLight, Amount = 750 , Flag = Give}, 
				TransferResource{Resource = GoodMithril , Side = SideLight, Amount = 350 , Flag = Give}, 
				TransferResource{Resource = GoodFood , Side = SideLight, Amount = 350 , Flag = Give}, 
				SetPlayerFlagTrue{Name = "Q248RessourcesVoneGiven"} , SetGlobalFlagFalse{Name = "Q248WaresVoneOk"},
				SetGlobalTimeStamp{Name = "Q248OVoneTimer"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672})),
			IsNpcFlagTrue{Name = "OfferWaresVone"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonGW004PC", String = "Was genau habt Ihr mit anzubieten?", AnswerId = 3},
			OfferAnswer{Tag = "jonGW007PC", String = "Ich benötige Rohstoffe!", AnswerId = 8},
		}}

	OnAnswer{10;
		Conditions = {
			UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672})),
			Negated(IsNpcFlagTrue{Name = "OfferWaresVone"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonGW004PC", String = "Was genau habt Ihr mit anzubieten?", AnswerId = 3},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672}))),
			IsNpcFlagTrue{Name = "OfferWaresVone"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jonGW007PC", String = "Ich benötige Rohstoffe!", AnswerId = 8},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(IsNpcFlagFalse{Name = "GiveKey"}, Negated(PlayerHasItem{ItemId = 2672}))),
			Negated(IsNpcFlagTrue{Name = "OfferWaresVone"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end