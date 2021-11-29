-->INFO: Shain
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 0}
--!EDS ONIDLEGOHOME END








--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p27\n4200_Shain.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagShainKnown"},
		},
		Actions = {
			Say{Tag = "shainNW001", String = "Wir haben Euch schon eine Weile beobachtet! Was für eine Mission treibt einen Lichtgläubigen so tief hinter die Reihen der Eisernen?"},
			Answer{Tag = "shainNW001PC", String = "Wir hatten die Eisernen bereits bis an die Grenzen der Gottmark zurückgeschlagen! Jetzt brauche ich Eure Hilfe, um den endgültigen Sieg zu erringen!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagShainKnown"}),
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "shainNW004", String = "Was ist noch, Lichtgläubiger?"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainNW002", String = "Den Sieg? Ihr seid ein Narr! Gegen die Eisernen gibt es keinen Sieg! Wir kämpfen bereits seit vielen Monden gegen sie! Nichts, nichts kann sie aufhalten!"},
			Answer{Tag = "shainNW002PC", String = "Sind das die Worte eines Kriegsherrn?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagShainKnown"},
			Say{Tag = "shainNW003", String = "Ihr wagt es...? Kein Volk auf dieser Welt kommt den Dunkelelfen an Tapferkeit gleich!"},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainNW005", String = "Selbst wenn ich das glauben würde..."},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainNW006", String = "Die Verteidigung der Stadt erfordert all unsere Kraft! Unsere Ariavorräte sind beinahe erschöpft! Und ohne das Silberwasser werden unsere Abwehranlagen bald schweigen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainNW007", String = "Die Eisernen haben fast alle Ariabrunnen zerstört! Ein Ausbruch aus der Stadt ist sinnlos!"},
			Answer{Tag = "shainNW007PC", String = "Es muss einen Weg geben! Kann man noch auf andere Weise Aria gewinnen?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainNW008", String = "Nur der hohe Archon kennt die Wege des Silberwassers! Aber die Kithar haben ihn entführt - und mit ihm seine Weisheit und Macht!"},
			Answer{Tag = "shainNW008PC", String = "Aria kommt an vielen Orten und in vielen Formen vor! Ihr müsst mit Euren Regeln und Traditionen brechen! Zieht jede Möglichkeit in Betracht!", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainNW009", String = "Nun... es gibt Kreaturen hier in den Sümpfen! Man nennt sie Irrwische! Sie schürfen in der Erde nach den seltenen Ariakristallen! Unsere Ahnen machten früher Jagd auf sie, um an die kostbaren Kristalle zu gelangen!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainNW010", String = "Vielleicht gelingt es Euch, einige Irrwische zu fangen, ehe es die Eisernen tun! Bringt mir ihre Ariakristalle! Sieben von ihnen sollten unsere Verteidigung fürs Erste stärken! Dann werde ich Euch Soldaten geben!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 536} , QuestSolve{QuestId = 535} , SetNpcFlagTrue{Name = "QuestionArchon"},
					SetRewardFlagTrue{ Name = "NachUrgath1Elfensiedlung"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainNW011", String = "Gebt sie mir und Ihr sollt einen Trupp meiner Männer erhalten!"},
			Answer{Tag = "shainNW011PC", String = "Nehmt!", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainNW012", String = "Gut, die Leute erwarten Euch vor der Stadt!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 537} , QuestSolve{QuestId = 536} , SetGlobalFlagTrue{Name = "Q537AssembleMen"},
					TransferItem{TakeItem = 3458 , Amount = 7 , Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainNW013", String = "Eines für das andere! Bringt mir drei weitere Kristalle und ich will noch einige meiner Leute freistellen!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ThreeCrystals"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainNW014", String = "Im Lager der Kithar, der Löwenmenschen aus Urgath! Sie haben ihn gefangen genommen, als er einen Angriff gegen die Eisernen führte!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainNW015", String = "Nur er kann der Magie der Eisernen entgegentreten!"},
			Answer{Tag = "shainNW015PC", String = "Wo befindet sich das Lager der Kithar?", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainNW016", String = "Östlich des Sumpfes! Ihr werdet ihnen begegnen, sobald Ihr das Monumentfeld erreicht! Sie sind sehr angriffslustig! Ihr werdet ihre Krallen bald zu spüren bekommen..."},
			Answer{Tag = "shainNW016PC", String = "Ich werde sehen, ob ich Euren Archon finden kann!", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "QuestionArchon"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState{QuestId = 535 , State = StateActive},
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW004PC", String = "Beweist mir Eure Tapferkeit! Gebt mir einige Eurer besten Soldaten! Ich werde sie anführen - und siegreich sein!", AnswerId = 3},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7}),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW010PC", String = "Ich habe sieben der Kristalle!", AnswerId = 11},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive})),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW012PC", String = "Ich brauche noch mehr von Euren Leuten!", AnswerId = 15},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			IsNpcFlagTrue{Name = "QuestionArchon"},
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW013PC", String = "Wo ist Euer Archon?", AnswerId = 18},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "shainNW017PC", String = "Hier sind noch einmal drei Kristalle.", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState{QuestId = 535 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 536 , State = StateActive} , 
				PlayerHasItem{ItemId = 3458 , Amount = 7})),
			Negated(UND(IsNpcFlagFalse{Name = "ThreeCrystals"} ,
					UND(IsGlobalFlagTrue{Name = "Q537MenDead"} , QuestState{QuestId = 537 , State = StateActive}))),
			Negated(IsNpcFlagTrue{Name = "QuestionArchon"}),
			Negated(UND(IsNpcFlagTrue{Name = "ThreeCrystals"} , PlayerHasItem{ItemId = 3458 , Amount = 3})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "shainNW018", String = "Gut, so soll es sein. Ich werde Euch noch einmal einige Männer zu Verfügung stellen."},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q537AssembleMen"} , SetNpcFlagFalse{Name = "ThreeCrystals"},
					TransferItem{TakeItem = 3458 , Amount = 3 , Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end