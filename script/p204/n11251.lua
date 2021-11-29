-->INFO: Tuomi
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11251"}
	}
}


OnIdleGoHome
{
	X = 218, Y = 176, Direction = 4,
	Conditions =
	{
		IsNpcFlagTrue{Name = "npc_204_GoToBindpoint"}
	},
	HomeActions =
	{
		SetNpcFlagFalse{Name = "npc_204_GoToBindpoint"},
		SetEffect {Effect ="DeMaterialize", TargetType = Figure, NpcId = Self},
		SetNpcFlagTrue{Name = "Despawn"},
		SetNpcTimeStamp{Name = "npc_Despawn"}
	},
}


Despawn
{
	Conditions =
	{
		IsNpcFlagTrue{Name = "Despawn"},
		IsNpcTimeElapsed{Name = "npc_Despawn", Seconds = 3}
	},
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n11251_Tuomi.txt


	

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
			IsNpcFlagFalse {Name = "known"},
		},
		Actions = {
			Say{Tag = "tuomiP204_001", String = "Kommt her! Lasst Euch ansehen ... Ja! Ihr müsst es sein!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
		},
		Actions = {
			Say{Tag = "tuomiP204_004", String = "Ihr seid zurückgekommen. Nun, was bringt Ihr mir?"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_002", String = "Der Ring hat mir Euer Gesicht gezeigt! Ihr tragt die Rune! Ihr seid der Vorbestimmte!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_003", String = "Ja, der Ring weiß alles! Er lügt nie! Er kennt Euren Weg! Und er hat mir Euch gezeigt! Und die Rune, die Ihr führt!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse {Name = "known"},
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_005PC", String = "Von welcher Rune sprecht Ihr?", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ,
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_018PC", String = "Ich habe eine Zerbitenträne gefunden.", AnswerId = 25},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					,
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_022PC", String = "Ich habe den Stab des blutenden Auges gefunden.", AnswerId = 32},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   },
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_030PC", String = "Ich habe die Robe des blutenden Auges gefunden.", AnswerId = 49},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_033PC", String = "Ich habe den Helm des blutenden Auges gefunden.", AnswerId = 58},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}},
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_036PC", String = "Ich habe den Schild des blutenden Auges gefunden.", AnswerId = 67},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			IsNpcFlagTrue {Name = "known"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "tuomiP204_038PC", String = "Ich möchte die Suche aufgeben.", AnswerId = 76},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "known"}),
			Negated(
									UND9
									{
									IsNpcFlagTrue {Name = "known"},
									PlayerHasItem {ItemId = 7066, Equipment = EquipmentAll },
									IsNpcFlagFalse{Name ="npc_P204_TearInfoGiven"}
									}
								 ),
			Negated(UND9
					{
					PlayerHasItem {ItemId = 4646, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}
					}
					),
			Negated(UND9
				   {
				   PlayerHasItem {ItemId = 4644, Equipment = EquipmentAll },
				   IsNpcFlagTrue {Name = "known"}
				   }),
			Negated(UND9{
					PlayerHasItem {ItemId = 4645, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(UND9{
					PlayerHasItem {ItemId = 4647, Equipment = EquipmentAll },
					IsNpcFlagTrue {Name = "known"}}),
			Negated(IsNpcFlagTrue {Name = "known"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_006", String = "Die Rune von Anktahr! Der, den man auch den Lichkönig nennt! Sie ist in Eurem Besitz!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_007", String = "Aber wisst Ihr auch, was Ihr da habt? Nein, bestimmt nicht!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_008", String = "Einst war Anktahr ein Mensch, ein mächtiger und weiser Zauberer!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_009", String = "Er war der Oberste der Zerbiten, ein Zaubererorden, der uns lange Zeit vor den Mächten des Dschungels geschützt hat!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_010", String = "Aber sie wurden von Hokan Ashir verraten und alle ermordet! Jetzt künden nur noch ihre verlassenen Gemäuer in den Dunkelwehrbergen von ihrer einstigen Größe!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_011", String = "Anktahr war der Oberste der Zerbiten! Er hat es als einziger gewagt dem mächtigen Hokan Ashir gegenüber zu treten! Dafür hat Hokan ihn in einen Untoten verwandelt und an diese Rune gebunden!"},
			Answer{Tag = "tuomiP204_012PC", String = "Interessiert Euch die Rune, Frau?", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_013", String = "Eigentlich nicht die Rune ....vielmehr Ihr interessiert mich! ich sehe Euren Weg Runenkrieger! Und ich sehe Ihr werdet weit reisen, bis nach Süden über die Dunkelwehrberge!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_014", String = "Sucht dort nach der alten Festung der Zerbiten, die man die Uhrwerkhallen nennt! Viele alte und mächtige Gegenstände werdet Ihr dort finden ... die Euch von großem Nuzten sein können!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_015", String = "Doch behaltet nicht alle für Euch! Achtet auf das blutende Auge! Gegenstände die ein blutendes Auge tragen, die bringt zu mir! Es sind eine Robe, ein Helm, ein Stab und ein Schild!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_016", String = "Behaltet alle anderen Schätze der Zerbiten, doch diese bringt zu mir, ich bitte Euch! Ich werde Euch reich belohnen!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_017", String = "Und wenn Ihr in die Uhrwerkahllen reist, dann vergesst die Rune Anktahrs nicht! Beschwört ihn an jenem Ort! Wer weiss, vielleicht wird der Lichkönig sein altes Zuhause erkennen!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			
									SetNpcFlagTrue {Name = "known"},
									QuestBegin{ QuestId = 1033},
									QuestBegin{ QuestId = 1034},
									QuestBegin{ QuestId = 1035},
									QuestBegin{ QuestId = 1036},
									QuestBegin{ QuestId = 1037},
									QuestBegin{ QuestId = 1038},
									QuestBegin{ QuestId = 1039}
									,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_019", String = "Ach, diese Edelsteine gibt es doch zuhauf! Seht, ich habe selbst einen."},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_020", String = "Gewiss, sie gehörten den Zerbiten und ihnen wohnt eine gewisse Kraft inne ... Dennoch sind sie nicht das, wonach ich suche!"},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_021", String = "Ich schenke Euch sogar meine Zerbitenträne!. Hier, nehmt sie! Bringt mir nur die vier Gegenstände des blutenden Auges, ich bitte Euch!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			
						TransferItem{GiveItem = 7066 , Flag = Give},
						SetNpcFlagTrue{Name ="npc_P204_TearInfoGiven"}
						,
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
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 4646, Equipment = EquipmentAvatar}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{33;
		Conditions = {
			PlayerHasItem {ItemId = 4646, Equipment = EquipmentAvatar},
		},
		Actions = {
			Say{Tag = "tuomiP204_023", String = "Bitte legt ihn ab, damit ich ihn nehmen kann."},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{35;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 4646, Equipment = EquipmentHero}),
		},
		Actions = {
			Say{Tag = "tuomiP204_025", String = "Endlich, der Stab! Wie lange habe ich ihn gesucht. Hier, Eure Belohnung!"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{35;
		Conditions = {
			PlayerHasItem {ItemId = 4646, Equipment = EquipmentHero},
		},
		Actions = {
			Say{Tag = "tuomiP204_024", String = "Einer Eurer Gruppe trägt diesen Gegenstand. Bitte legt ihn ab, damit ich ihn nehmen kann."},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			
						TransferItem{TakeItem = 4646 , Flag = Take},
						TransferMoney{Gold = 500, Flag = Give},
						QuestSolve{ QuestId = 1036},
						SetGlobalFlagTrue{Name = "g_204_TuomiGotStaff"}
						,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 38},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
			
						UND9
						{
							QuestState{QuestId = 1036, State = StateSolved},
							QuestState{QuestId = 1037, State = StateSolved},
							QuestState{QuestId = 1038, State = StateSolved},
							QuestState{QuestId = 1039, State = StateSolved}
						}
					,
		},
		Actions = {
			Say{Tag = "tuomiP204_026", String = "Endlich habe ich alle fünf Gegenstände zusammen."},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(
						UND9
						{
							QuestState{QuestId = 1036, State = StateSolved},
							QuestState{QuestId = 1037, State = StateSolved},
							QuestState{QuestId = 1038, State = StateSolved},
							QuestState{QuestId = 1039, State = StateSolved}
						}
					),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_027", String = "Den Stab, den Schild, die Robe, den Helm - und den Ring, den mir meine Ahnen hinterlassen haben."},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_028", String = "Nun kann ich mein Schicksal erfüllen! Das innere Heilgtum der Uhrwerkhallen wird sich für mich öffnen!"},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_029", String = "Es ist Zeit für mich,  das Vermächtnis der Zerbiten anzutreten!"},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			
				 				QuestSolve{ QuestId = 1035},
								RemoveDialog{NpcId = self},
								QuestBegin{ QuestId = 1041 },
								SetNpcFlagTrue{Name = "npc_204_GoToBindpoint"}
								,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			EndDialog(),
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
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
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
			Negated(PlayerHasItem {ItemId = 4644, Equipment = EquipmentAvatar}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{50;
		Conditions = {
			PlayerHasItem {ItemId = 4644, Equipment = EquipmentAvatar},
		},
		Actions = {
			Say{Tag = "tuomiP204_031", String = "Bitte zieht sie aus, damit ich sie nehmen kann."},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{52;
		Conditions = {
			PlayerHasItem {ItemId = 4644, Equipment = EquipmentHero},
		},
		Actions = {
			Say{Tag = "tuomiP204_024", String = "Einer Eurer Gruppe trägt diesen Gegenstand. Bitte legt ihn ab, damit ich ihn nehmen kann."},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{52;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 4644, Equipment = EquipmentHero}),
		},
		Actions = {
			Say{Tag = "tuomiP204_032", String = "Wunderbar!! Nehmt Eure Belohnung, Ihr habt mir einen großen Dienst erwiesen!"},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			
						TransferItem{TakeItem = 4644 , Flag = Take},
						TransferMoney{Gold = 800, Flag = Give},
						QuestSolve{ QuestId = 1037},
						SetGlobalFlagTrue{Name = "g_204_TuomiGotRobe"}
						,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 39},
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
			PlayerHasItem {ItemId = 4645, Equipment = EquipmentAvatar},
		},
		Actions = {
			Say{Tag = "tuomiP204_034", String = "Bitte zieht ihn aus, damit ich ihn nehmen kann."},
			Answer{Tag = "", String = "", AnswerId = 60},
		}}

	OnAnswer{59;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 4645, Equipment = EquipmentAvatar}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 61},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{61;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 4645, Equipment = EquipmentHero}),
		},
		Actions = {
			Say{Tag = "tuomiP204_035", String = "Sehr gut! Hier habt Ihr Euren verdienten Lohn."},
			Answer{Tag = "", String = "", AnswerId = 63},
		}}

	OnAnswer{61;
		Conditions = {
			PlayerHasItem {ItemId = 4645, Equipment = EquipmentHero},
		},
		Actions = {
			Say{Tag = "tuomiP204_024", String = "Einer Eurer Gruppe trägt diesen Gegenstand. Bitte legt ihn ab, damit ich ihn nehmen kann."},
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
			
						TransferItem{TakeItem = 4645 , Flag = Take},
						TransferMoney{Gold = 300, Flag = Give},
						QuestSolve{ QuestId = 1038},
						SetGlobalFlagTrue{Name = "g_204_TuomiGotHelmet"}
						,
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
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{66;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{67;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 68},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 4647, Equipment = EquipmentAvatar}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 70},
		}}

	OnAnswer{68;
		Conditions = {
			PlayerHasItem {ItemId = 4647, Equipment = EquipmentAvatar},
		},
		Actions = {
			Say{Tag = "tuomiP204_023", String = "Bitte legt ihn ab, damit ich ihn nehmen kann."},
			Answer{Tag = "", String = "", AnswerId = 69},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{70;
		Conditions = {
			PlayerHasItem {ItemId = 4647, Equipment = EquipmentHero},
		},
		Actions = {
			Say{Tag = "tuomiP204_024", String = "Einer Eurer Gruppe trägt diesen Gegenstand. Bitte legt ihn ab, damit ich ihn nehmen kann."},
			Answer{Tag = "", String = "", AnswerId = 71},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 4647, Equipment = EquipmentHero}),
		},
		Actions = {
			Say{Tag = "tuomiP204_037", String = "Ihr habt ihn! Ihr seid wirklich der Versprochene! Nehmt dies, Ihr habt es mehr als verdient."},
			Answer{Tag = "", String = "", AnswerId = 72},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			
						TransferItem{TakeItem = 4647 , Flag = Take},
						TransferMoney{Gold = 650, Flag = Give},
						QuestSolve{ QuestId = 1039},
						SetGlobalFlagTrue{Name = "g_204_TuomiGotShield"}
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
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{76;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_039", String = "So? Ihr enttäuscht mich! Hat der Ring gelogen? Er hat mir gezeigt, dass Ihr die fehlenden Gegenstände finden würdet."},
			Answer{Tag = "", String = "", AnswerId = 77},
		}}

	OnAnswer{77;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_040", String = "Oder seid Ihr es etwa, der mich betrügt? Habt Ihr die Gegenstände etwa gefunden und wollt sie mir nicht geben?"},
			Answer{Tag = "tuomiP204_041PC", String = "Was ist das für ein Ring, von dem Ihr immerzu sprecht?", AnswerId = 78},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_042", String = "Das wüsstet Ihr wohl gern! Aber von mir erfahrt Ihr nichts mehr! Ihr wisst ohnehin zuviel!"},
			Answer{Tag = "tuomiP204_043PC", String = "Was ist auf einmal mit Euch?", AnswerId = 79},
		}}

	OnAnswer{79;
		Conditions = {
		},
		Actions = {
			Say{Tag = "tuomiP204_044", String = "Wenn Ihr mir nicht zeigen wollt, was Ihr in den Taschen habt, dann muss ich eben zu anderen Mitteln greifen!"},
			Answer{Tag = "", String = "", AnswerId = 80},
		}}

	OnAnswer{80;
		Conditions = {
		},
		Actions = {
			
				 QuestSolve{ QuestId = 1036},
				 QuestSolve{ QuestId = 1037},
				 QuestSolve{ QuestId = 1038},
				 QuestSolve{ QuestId = 1039},
				 QuestSolve{ QuestId = 1035},
				 QuestSolve{ QuestId = 1034},
				 QuestSolve{ QuestId = 1033},
				 RemoveDialog{NpcId = self},
				 ChangeRace {Race = 121, NpcId = self}
				 ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 81},
		}}

	OnAnswer{81;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{81;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end