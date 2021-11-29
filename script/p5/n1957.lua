-->INFO: SergEinar
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OneTimeInitAction( RemoveDialog{} )

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 142, Y = 418, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 135, Y = 423, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 122, Y = 420, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 120, Y = 410, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 118, Y = 402, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 116, Y = 387, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 107, Y = 376, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 93, Y = 380, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 88, Y = 385, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 77, Y = 384, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Run}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Run}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Run}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Run}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Run}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Run}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Run}
AddControlPoint{Name = "009", Location = "Point009",WalkMode = Run}
AddControlPoint{Name = "010", Location = "Point010",WalkMode = Run}
--!EDS PATROL END


-- WICHTIG FUER DIE CUTSCENE IN UTRAN FESTE --------------------
Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "EinarDespawn", UpdateInterval = 5},
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "EinarDespawn"},			
	},
}

Respawn
{
	-- X = 302, Y = 166, WaitTime = 1,
	X = 297, Y = 166, WaitTime = 1,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "EinarRespawn", UpdateInterval = 5},
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "EinarRespawn"},	
	},
}
----------------------------------------------------------------


DailyJobParams
{
	Loop = FALSE,
	Conditions = {
		IsGlobalFlagTrue{Name = "Q87EinarRunToUtrans"},
	},
}

OnOneTimeEvent
{
Conditions = {
			FigureInRange{X = 77 , Y = 384 , Range = 2 , NpcId = self},
			},
Actions = {
			LookAtFigure{Target = Avatar, NpcId = self},
			}
}
OnToggleEvent
{
OnConditions = {
		Negated(FigureInRange{X = 77 , Y = 384 , Range = 2 , NpcId = self})
		}, 
OnActions = {
		RemoveDialog{NpcId = self}
		},
OffConditions = {
				FigureInRange{X = 77 , Y = 384 , Range = 2 , NpcId = self},
				}, 
OffActions = {
		EnableDialog{NpcId = self},
		SetDialogType{Type = SideQuest}
			},
}

Respawn
{
	WaitTime = 120, 
}









--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p5\n1957_SergEinar.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "EinarSpokenTo"},
		},
		Actions = {
			Say{Tag = "einarShiel001", String = "Bei den verfluchten Augen Zarachs! Was für ein Ritt! Das war ein verdammt gutes Stück Arbeit, Freund! Ohne Euch wären wir verloren gewesen!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "EinarSpokenTo"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "einarShiel005", String = "Gut Euch zu sehen, Freund."},
			OfferAnswer{Tag = "einarShiel005PC", String = "Wessen Kopf ist das hier?", AnswerId = 5},
			OfferAnswer{Tag = "einarShiel009PC", String = "Die fünf Brüder sind wieder vereint - im Jenseits!", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "EinarSpokenTo"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "einarShiel005", String = "Gut Euch zu sehen, Freund."},
			OfferAnswer{Tag = "einarShiel005PC", String = "Wessen Kopf ist das hier?", AnswerId = 5},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "EinarSpokenTo"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "einarShiel005", String = "Gut Euch zu sehen, Freund."},
			OfferAnswer{Tag = "einarShiel009PC", String = "Die fünf Brüder sind wieder vereint - im Jenseits!", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "EinarSpokenTo"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "einarShiel005", String = "Gut Euch zu sehen, Freund."},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "einarShiel002", String = "Wer hätte gedacht, dass uns ausgerechnet ein Runenkrieger die Hoffnung zurückgeben würde!"},
			Answer{Tag = "einarShiel002PC", String = "Unsere Wege trennen sich hier, Einar! Ich muss weiter, tiefer ins Wildland! Rohen hat noch immer einen großen Vorsprung!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "einarShiel003", String = "Ihr werdet die Unterstützung meiner Leute brauchen, um die Monumente freizukämpfen!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "einarShiel004", String = "Sprecht mit Hauptmann Bahir! Er hat hier das Kommando! Ein zäher, misstrauischer Bursche! Lasst Euch nicht von ihm abweisen! Viel Glück!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "EinarSpokenTo"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "einarShiel005PC", String = "Wessen Kopf ist das hier?", AnswerId = 5},
			OfferAnswer{Tag = "einarShiel009PC", String = "Die fünf Brüder sind wieder vereint - im Jenseits!", AnswerId = 11},
		}}

	OnAnswer{4;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "EinarSpokenTo"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "einarShiel005PC", String = "Wessen Kopf ist das hier?", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			SetNpcFlagTrue{Name = "EinarSpokenTo"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "einarShiel009PC", String = "Die fünf Brüder sind wieder vereint - im Jenseits!", AnswerId = 11},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "EinarSpokenTo"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "einarShiel006", String = "Dies war einer der Twonks! Fünf Brüder, die Brannigan dienen! Verdammt gefährliche Burschen!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "einarShiel007", String = "Ein hohe Belohnung wurde für den ausgesetzt, der sie alle fünf zur Strecke bringt!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "einarShiel008", String = "Darmor ist ein gefährlicher Krieger, er führt die Kampfaxt wie kein zweiter! Sergil mag schwächer sein, doch er ist verflucht clever! Achtet auf seinen vergifteten Dolch! Brandel dagegen benutzt stets eine Armbrust!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "einarShiel009", String = "Ragnar ist ein Schwarzmagier, und Elijah beherrscht die Eismagie!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 463 },
				 QuestBegin{QuestId = 454 },
				 QuestBegin{QuestId = 455 },
				 QuestBegin{QuestId = 456 },
				 QuestBegin{QuestId = 457 },
				 QuestBegin{QuestId = 458 },
				 QuestBegin{QuestId = 459 },
				 SetPlayerFlagFalse{Name = "Q453PlayerGotFirstHead"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "einarShiel005PC", String = "Wessen Kopf ist das hier?", AnswerId = 5},
			OfferAnswer{Tag = "einarShiel009PC", String = "Die fünf Brüder sind wieder vereint - im Jenseits!", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "einarShiel005PC", String = "Wessen Kopf ist das hier?", AnswerId = 5},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "einarShiel009PC", String = "Die fünf Brüder sind wieder vereint - im Jenseits!", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "einarShiel010", String = "Bei den Seelen des Mor Duine! Der Lord Kommandant wird hocherfreut sein! Ihr habt Brannigan einen empfindlichen Schlag versetzt!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "einarShiel011", String = "Ich werde Euch diese blutige Last abnehmen! Hier, nehmt diese Belohnung für Eure Tapferkeit."},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			TransferMoney{Silver = 8, Flag = Give},       
					TransferItem{TakeItem = 3202 , Flag = Take},     
					QuestSolve{QuestId = 454},                       
					TransferItem{TakeItem = 3203 , Flag = Take},     
					QuestSolve{QuestId = 457},                       
					TransferItem{TakeItem = 3204 , Flag = Take},     
					QuestSolve{QuestId = 458},                       
					TransferItem{TakeItem = 3205 , Flag = Take},     
					QuestSolve{QuestId = 456},     
					TransferItem{TakeItem = 3206 , Flag = Take}, 
					QuestSolve{QuestId = 455},               
					QuestSolve{QuestId = 459},
					QuestSolve{QuestId = 463},                      
					QuestSolve{QuestId = 453},
					SetPlayerFlagFalse{Name = "Q453PlayerGotFirstHead"},              
					SetPlayerFlagFalse{Name = "Q453PlayerGotAllHeads"},
					SetRewardFlagTrue{ Name = "Kopfjagd6Complete"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "einarShiel005PC", String = "Wessen Kopf ist das hier?", AnswerId = 5},
			OfferAnswer{Tag = "einarShiel009PC", String = "Die fünf Brüder sind wieder vereint - im Jenseits!", AnswerId = 11},
		}}

	OnAnswer{14;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "einarShiel005PC", String = "Wessen Kopf ist das hier?", AnswerId = 5},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "einarShiel009PC", String = "Die fünf Brüder sind wieder vereint - im Jenseits!", AnswerId = 11},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"}),
			Negated(IsPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end