-->INFO: Alyah
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions =
	{

	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_AlyahHomepoint"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8787"},		
	}
}


OnOneTimeEvent
{
	Conditions =
	{
	    IsGlobalFlagTrue {Name = "g_P204_AlyahDialogAn", UpdateInterval = 60},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_8787"},		
	}
}


OnIdleGoHome
{
X = _X, Y = _Y, Direction = East, Range = 0 , WalkRange = 0 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoNormal,
	Conditions =
	{
	    IsGlobalFlagTrue {Name = "g_P204_AlyahHomepoint", UpdateInterval = 60},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}

-- Cutscene starten, wenn Flink gefangen
OnOneTimeEvent
{
	Conditions =
	{
	   	PlayerUnitInRange {X = 165, Y = 196, Range = 10 , FigureType = Avatar , UpdateInterval = 60},
	    IsGlobalFlagTrue {Name = "g_P204_FlinkGehtZuAlyah"},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_CutsceneAlyahStart"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8787"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8791"},
	}
}

-- Dialog nach Cutscene wieder anschalten
OnOneTimeEvent
{
	Conditions =
	{
	    IsGlobalFlagTrue {Name = "g_P204_FlinkBeiAlyah", UpdateInterval = 60},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_8787"},
	}
}

-- Alyah rennt zum Tor nach Red Waste
OnIdleGoHome
{

	X = 325, Y = 166, WalkMode = Run, Direction = North,
	
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_AlyahZumTor", UpdateInterval = 60},
	},
	
	HomeActions = 
	{
		SetGlobalFlagFalse {Name = "g_P204_AlyahHomepoint"},
		SetGlobalFlagFalse {Name = "g_P204_AlyahZumTor"},
		SetGlobalFlagTrue {Name = "g_P204_AlyahAngekommen"},
	},
}

-- Effekt und Despawn beim Portal
OnOneTimeEvent
{
	Conditions = 
	{
	   	FigureInRange {X = 362, Y = 169, Range = 0, NpcId = self, UpdateInterval = 60},
	},
	
	Actions =
	{
		SetEffect {Effect = "DeMaterialize", NpcId = 8787, Length = 5000},	
	}
}

Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
	   IsGlobalTimeElapsed{Name = "c_P205_CounterAlyahDespawnt", Seconds = 4, UpdateInterval = 10}, 
	}
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n8787_Alyah.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P205_DryadengartenSolved"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 76},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_InfoUriasGegeben"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 70},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_InfoUriasGegeben"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState {QuestId = 895, State = StateActive}),
		},
		Actions = {
			Say{Tag = "alyahP204_067", String = "Seid Ihr nun soweit? Die Zeit wird knapp!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState {QuestId = 895, State = StateActive},
		},
		Actions = {
			Say{Tag = "alyahP204_001", String = "Bereit für den Aufbruch?"},
			Answer{Tag = "alyahP204_002PC", String = "Ja! Er wird uns begleiten. Wir müssen später auch noch einmal zur schwarzen Küste zurück, aber das hat Zeit.", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_003", String = "Herrje, da haben wir ja einen echten Helden dabei. Nun denn, seid Ihr bereit für den Aufbruch?"},
			OfferAnswer{Tag = "alyahP204_004PC", String = "Ich bin bereit, lasst uns gehen!", AnswerId = 4},
			OfferAnswer{Tag = "alyahP204_007PC", String = "Wartet noch, ich habe noch einige Dinge zu erledigen.", AnswerId = 7},
			OfferAnswer{Tag = "alyahP204_009PC", String = "Ich hätte erst noch einige Fragen.", AnswerId = 8},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_005", String = "Gut. Der Weg nach Kathai führt durch die rote Wüste, dort müssen wir zuerst hin."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_006", String = "Das Portal liegt im Südosten der Stadt. Trefft uns dort! Aber beeilt Euch!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_AlyahZumTor"}, SetGlobalFlagTrue {Name = "g_P204_UriasZumTor"}, SetGlobalFlagTrue {Name = "g_P204_HaranZumTor"}, QuestSolve {QuestId = 896}, QuestBegin {QuestId = 1058},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_008", String = "Dann kommt wieder, wenn Ihr soweit seid! Aber sputet Euch, die Stadt wird mit jeder Minute ungemütlicher für uns!"},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "alyahP204_010", String = "Lasst hören!"},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_012", String = "Er kannte mich schon, als ich noch klein war und im Palast gespielt habe. Für ihn bleibe ich immer eine Prinzessin, egal wie ich mich kleide."},
			Answer{Tag = "alyahP204_013PC", String = "IHR seid eine Tochter des Kaisers?", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_014", String = "Seine einzige! Tochter von Magnus Arias und Kaira Faran."},
			Answer{Tag = "alyahP204_015PC", String = "Was treibt Euch denn vom Palast in die Gosse?", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_016", String = "Mein Vater, was sonst?"},
			Answer{Tag = "alyahP204_017PC", String = "Ihr mögt euch nicht?", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_018", String = "Er ist ... nun, sagen wir, mich zu zeugen war einer seiner lichteren Momente."},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_019", String = "Er hat Mutter verstossen, wegen dieser Dryade, die er so unendlich begehrt, dieser Narr! Irgendwann wusste er noch nicht einmal mehr Mutters Namen!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_020", String = "Das hat Mutter vollends gebrochen. In der Nacht als sie starb, floh ich aus dem Palast!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_021", String = "Ich werde nicht ihr Schicksal erleiden, kein Mann wird mein Herz brechen, das schwöre ich! Eher schneide ich ihm das seine heraus!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_022", String = "So wie das meines Vaters, wenn er mir je gegenüber treten sollte!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_023", String = "Lasst Euch gesagt sein, es gibt keine Ehre unter Männern! Nur Gier und Prahlerei, sonst nichts!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_024", String = "Es gibt keine Helden mehr, nur noch Gräber!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "AlyahPrincessTold"} , SetNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_026", String = "Nun, sagen wir mal, ein beruflicher Wettstreit. Er ist der Kommandant der Wachen, ich die Königin der Diebe!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_027", String = "Aber wir respektieren uns. Von allen Männern hier, ist er noch der Brauchbarste!"},
			Answer{Tag = "alyahP204_028PC", String = "Und der Grund, warum Ihr nicht schon längst im Kerker sitzt, verbirgt sich hinter dem Wort 'Bruder' nicht wahr?", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_029", String = "Nichts da, ich kann ihm jederzeit entwischen, er macht sich nur nicht mehr die Mühe mich zu fangen!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_030", String = "Ich nenne ihn Bruder, weil er das Ergebnis einer durchzechten Nacht meines Vaters und einer gutgläubigen Dienerin ist. Ein Bastard. ohne Rechte und ohne Erbanspruch."},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_031", String = "Mein Vater hat ihn in die Gladiatorenschule gesteckt. Von da aus hat er sich bis zu den Stadtwachen hochgedient!"},
			Answer{Tag = "alyahP204_032PC", String = "Wenn weder er noch Ihr den Kasierthron erbt, wer bekommt ihn dann?", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_033", String = "Niemand! Mein Vater ist so vernarrt in diese Dryade, das er keine Frauen aus Fleisch und Blut mehr begehrt!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_034", String = "Er wird keinen Erben mehr bekommen, das Geschlecht der Arias endet mit dieser Generation!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_035", String = "Dann werden die Generäle und Händler wie die Wölfe über Empyria herfallen! Aber sollen sie doch, besser so, als das es von Wahnsinnigen regiert wird!"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "AlyahPrincessTold2"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_037", String = "Weil er der Kaiser ist? Weil er tut, was er will?"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_038", String = "Vor allem weil jemand seiner kostbaren Dryade zu Nahe gekommen ist! Nichts hasst er mehr!"},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_039", String = "Aber ich glaube, da steckt auch sein neuer Berater dahinter, eine rätselhafte Figur mit einer Maske! Seine Einflüsterungen haben mienen Vater endgültig verrückt gemacht!"},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_040", String = "Er will meinem Vater angeblich etwas von den alten Mächten des Zirkels beibringen! Und dieser Dummkopf glaubt ihm das auch noch!"},
			Answer{Tag = "alyahP204_041PC", String = "Zirkelkräfte? Ihr meint, das Allfeuer beherrschen?", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_042", String = "Das ist natürlich Unsinn, selbst wenn der Maskierte ein Zirkelmagier wäre, er würde bestimmt nicht seine Macht mit meinem Vater teilen!"},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_043", String = "Ausserdem hat sich der Maskierte schon länger nicht mehr hier blicken lassen!"},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_044", String = "Wahrscheinlich spürt er die Bedrohung durch die Untoten, von denen Haran berichtet hat ... oder er steckt sogar selbst dahinter!"},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "alyahP204_047PC", String = "Dieses falsche Aas, Hokan Ashir! Wenn ichd aran denke, dass ich beinahe seinetwegen die Dryade erschlagen hätte!", AnswerId = 45},
		}}

	OnAnswer{40;
		Conditions = {
			IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "alyahP204_045PC", String = "Das muss Hokan Ashir sein! Die Dryade hat mir erzählt, das er hier seine Finger im Spiel hat!", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "alyahP204_046PC", String = "Ja, warum sollte er Empyria erobern, wenn er es kampflos geschenkt bekommt!", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_048", String = "Ihr wolltet sie töten?"},
			Answer{Tag = "alyahP204_049PC", String = "Ja, Hokan wollte mich dazu zwingen! Er hat mich benutzt wie Euren Vater. Aber das ist jetzt vorbei!", AnswerId = 46},
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
			SetNpcFlagTrue{Name = "AlyahHuntedTold"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{49;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_051", String = "Ein Gebiet weit südlich von hier, nahe der Dunkelwehrberge."},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_052", String = "Das Volk, das dort lebt, nennt man auch die Kinder des Windes. Früher waren sie Nomaden, als es noch Land genug gab, auf dem sich das Herumziehen gelohnt hätte."},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_053", String = "Jetzt sind sie ein Volk von Kriegern und das lange Leben an der Grenze zum Dschungel hat sie hart gemacht. Aber ihre Herzen sind immer noch frei, sie werden Euch gefallen!"},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{53;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_054", String = "Früher waren sie wertvolle Verbündete, immerhin sind sie einer der größten Kriegerstämme Xus! Aber mein Vater, in seiner unendlichen Weisheit, hat das Bündnis volkommen zerstört!"},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_055", String = "Wenigstens haben die Männer dort noch ein wenig Feuer im Blut! Ich freue mich dahin zurück zu kehren! Ich hoffe Jenquai hat noch nicht geheiratet!"},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "AlyahKathaiTold"}, SetNpcFlagTrue{Name = "AlyahKathaiTold2"},
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
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_057", String = "Ich habe sie gesehen, als ich in Kathai war. Sie ist so etwas wie eine Schamanin, oder ... besser gesagt schon fast so etwas wie eine Göttin."},
			Answer{Tag = "alyahP204_058PC", String = "Eine Göttin?", AnswerId = 59},
		}}

	OnAnswer{59;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_059", String = "Versteht das nicht falsch, sie ist sterblich wie ich, aber ihr Leben wärt sehr, sehr lange. Die Überlieferungen, die von Uru zu Uru weitergegeben werden, sind so alt wie das Menschengeschlecht."},
			Answer{Tag = "", String = "", AnswerId = 60},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_060", String = "Und sie weiss viel, sehr viel. Vielleicht sehen ihre Augen auch weiter, als die der Dryade."},
			Answer{Tag = "", String = "", AnswerId = 61},
		}}

	OnAnswer{61;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_061", String = "Und sie kennt die alten Geheimnisse des dunklen Dschungels im Süden!"},
			Answer{Tag = "alyahP204_062PC", String = "Was für ein Dschungel?", AnswerId = 62},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_063", String = "Die Wüsten von Xu reichen nur bis zu den Dunkelwehrbergen. Dahinter beginnt der Dschungel, ein dunkles Land, das noch nicht einmal die Magier des Zirkels ganz ergründen konnten!"},
			Answer{Tag = "", String = "", AnswerId = 63},
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_064", String = "Dort hat der abtrünnige Wächtergott Zarach die dunklen Rassen geschaffen! Irgendwo im schwarzen Herz des Dschungels liegt sein alter Tempel!"},
			Answer{Tag = "", String = "", AnswerId = 64},
		}}

	OnAnswer{64;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_065", String = "Man sagt, dieser Ort ist von so abgrundtiefer Grausamkeit, dass ihn selbst die Götter fürchten!"},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_066", String = "Menschlich gesprochen also kein Ort wo man gerne hin wollte. Zumindest ich nicht!"},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{66;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "AlyahKathaiTold2"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 67},
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
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcFlagFalse{Name = "AlyahPrincessTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_011PC", String = "Warum nannte der Botschafter Euch Prinzessin?", AnswerId = 9, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			IsNpcFlagTrue{Name = "AlyahPrincessTold2"},
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_025PC", String = "Was verbindet Euch mit Ishtar?", AnswerId = 22, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			IsNpcFlagFalse{Name = "AlyahHuntedTold"},
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_036PC", String = "Warum lässt uns der Kaiser jagen?", AnswerId = 33, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			IsNpcFlagFalse{Name = "AlyahKathaiTold"},
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_050PC", String = "Was wisst Ihr über Kathai?", AnswerId = 50, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			IsNpcFlagTrue{Name = "AlyahKathaiTold2"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_056PC", String = "Kennt Ihr die Uru?", AnswerId = 58, Color = ColorDarkOrange},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "AlyahPrincessTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahPrincessTold2"}),
			Negated(IsNpcFlagFalse{Name = "AlyahHuntedTold"}),
			Negated(IsNpcFlagFalse{Name = "AlyahKathaiTold"}),
			Negated(IsNpcFlagTrue{Name = "AlyahKathaiTold2"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name= "g_nP201_PhoenixSteinSpieler"}),
		},
		Actions = {
			Say{Tag = "alyahP204_068", String = "Werdet ihr uns nach Kathai begleiten?"},
			Answer{Tag = "alyahP204_069PC", String = "Ich wäre Euch dankbar, wenn Ihr mich mitnehmen könntet. Soweit ich weiß, lebt die Uru dort.", AnswerId = 73},
		}}

	OnAnswer{70;
		Conditions = {
			IsGlobalFlagTrue{Name= "g_nP201_PhoenixSteinSpieler"},
		},
		Actions = {
			Say{Tag = "alyahP204_068", String = "Werdet ihr uns nach Kathai begleiten?"},
			Answer{Tag = "alyahP204_069PC", String = "Ich wäre Euch dankbar, wenn Ihr mich mitnehmen könntet. Soweit ich weiß, lebt die Uru dort.", AnswerId = 71},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_070", String = "Trifft sich ja wunderbar! Aber sprecht noch einmal mit Urias. Ich glaube, er hat noch irgend etwas auf dem Herzen."},
			Answer{Tag = "alyahP204_071PC", String = "Gut, ich bin gleich zurück.", AnswerId = 72},
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_InfoUriasGegeben"}, SetGlobalFlagTrue {Name = "g_P204_UriasNebenquest"}, QuestBegin {QuestId = 890}, QuestBegin {QuestId = 1057},
			SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_8791"}, SetGlobalFlagTrue{Name = "g_P204_UriasNebenquest"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{73;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_072", String = "Es gibt hier noch jemanden, der Euch gerne kennen lernen möchte. Sein Name ist Urias."},
			Answer{Tag = "alyahP204_073PC", String = "Urias ... der Name stand in dem Brief von Darius. Was wünscht er?", AnswerId = 74},
		}}

	OnAnswer{74;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_074", String = "Fragt ihn selbst, es ist der Kerl in der roten Rüstung dort. Ich glaube, er will uns begleiten."},
			Answer{Tag = "alyahP204_075PC", String = "Ich werde mit ihm sprechen, wartet hier.", AnswerId = 75},
		}}

	OnAnswer{75;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_InfoUriasGegeben"}, SetGlobalFlagTrue {Name = "g_P204_UriasNebenquest"}, QuestBegin {QuestId = 890}, QuestBegin {QuestId = 1057},
			SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_8791"}, SetGlobalFlagTrue{Name = "g_P204_UriasNebenquest"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{75;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{76;
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagAlyahKnown"},
		},
		Actions = {
			Say{Tag = "alyahP204_076", String = "Na sowas, da spazieren mir doch glatt einhundert Goldstücke in die Arme!"},
			Answer{Tag = "", String = "", AnswerId = 77},
		}}

	OnAnswer{76;
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagAlyahKnown"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 84},
		}}

	OnAnswer{77;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name= "g_nP201_PhoenixSteinSpieler"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "alyahP204_078PC", String = "Ein Griff nach meinem Beutel und Ihr verblutet im Schlamm ... zusammen mit dem Hänfling da, wenn er sein Schwert nicht ruhig hält!", AnswerId = 79},
		}}

	OnAnswer{77;
		Conditions = {
			IsGlobalFlagTrue{Name= "g_nP201_PhoenixSteinSpieler"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "alyahP204_077PC", String = "Bei mir ist nichts zu holen, Alyah!", AnswerId = 79},
		}}

	OnAnswer{79;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_079", String = "Nur ruhig, Krieger, Eure Börse könnt Ihr behalten! Aber bei Eurem Kopf bin ich da nicht so sicher! Irgend jemand bietet viel Geld dafür!"},
			Answer{Tag = "", String = "", AnswerId = 80},
		}}

	OnAnswer{80;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_080", String = "Nun, ich bin keine Menschenjägerin, ich verdiene mein Geld mit ehrlichem Diebstahl! Vor mir habt Ihr nichts zu befürchten. Was wollt Ihr?"},
			Answer{Tag = "", String = "", AnswerId = 81},
		}}

	OnAnswer{81;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagAlyahKnown"},
			SetGlobalFlagTrue {Name = "g_P204_SpielerWarBeiAlyah"}, QuestSolve {QuestId = 812},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 82},
		}}

	OnAnswer{82;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 83},
		}}

	OnAnswer{83;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_096PC", String = "Ihr könnt mich in den Palastgarten bringen?", AnswerId = 100},
		}}

	OnAnswer{84;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P204_GehInDenPalastgarten"},
		},
		Actions = {
			Say{Tag = "alyahP204_081", String = "Nun los, der Palast wartet auf Euch! Euch wird schon was einfallen, um an den Wachen vorbeizukommen!"},
			Answer{Tag = "", String = "", AnswerId = 85},
		}}

	OnAnswer{84;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P204_GehInDenPalastgarten"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 87},
		}}

	OnAnswer{85;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 86},
		}}

	OnAnswer{86;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{86;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{87;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_AlyahAuftragEmpyria"},
		},
		Actions = {
			Say{Tag = "alyahP204_082", String = "Wie ich sehe, war die Sache mit Flink keine echte Herausforderung für Euch ..."},
			Answer{Tag = "", String = "", AnswerId = 88},
		}}

	OnAnswer{87;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_AlyahAuftragEmpyria"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "alyahP204_096PC", String = "Ihr könnt mich in den Palastgarten bringen?", AnswerId = 100},
		}}

	OnAnswer{88;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_083", String = "Aber jetzt habe ich eine, die Euch etwas mehr ins Schwitzen bringen sollte ..."},
			Answer{Tag = "", String = "", AnswerId = 89},
		}}

	OnAnswer{89;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_nP201_PhoenixSteinSpieler"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "alyahP204_085PC", String = "Lasst Eure Spielchen! Der Weg zum Palast, so war die Abmachung!", AnswerId = 91},
		}}

	OnAnswer{89;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_nP201_PhoenixSteinSpieler"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "alyahP204_084PC", String = "Denkt an unseren Handel, Alyah, Ihr wolltet mir den Zugang zum Palast verschaffen.", AnswerId = 91},
		}}

	OnAnswer{91;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_086", String = "Genau darum geht es ja, Freund ... Es gibt keinen einfachen Weg dort hinein!"},
			Answer{Tag = "", String = "", AnswerId = 92},
		}}

	OnAnswer{92;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_087", String = "Denkt Ihr, ich mache Schnipp wie ein Zirkelmagier und Ihr steht im Palastgarten?"},
			Answer{Tag = "", String = "", AnswerId = 93},
		}}

	OnAnswer{93;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_088", String = "Es gibt drei Tore in die Oberstadt und noch einmal zwei Tore in den Palastbereich. Es sind einfache Tore, mit ein paar Dietrichen bekommt man sie auf."},
			Answer{Tag = "", String = "", AnswerId = 94},
		}}

	OnAnswer{94;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_089", String = "Aber an jedem Tor gibt es Wachen! Sie werden Euch die Tore nicht öffnen und solltet ihr versuchen sie aufzubrechen, machen sie Euch einen Kopf kürzer!"},
			Answer{Tag = "", String = "", AnswerId = 95},
		}}

	OnAnswer{95;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_090", String = "Ihr habt zwei Möglichkeiten: Entweder ihr erschlagt die Wachen, was ich Euch nicht raten würde, oder Ihr versucht sie irgendwie von den Toren wegzulocken."},
			Answer{Tag = "alyahP204_091PC", String = "Wie soll ich das anstellen?", AnswerId = 96},
		}}

	OnAnswer{96;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_092", String = "Euch wird schon was einfallen! Schaut Euch in der Umgebung der Tore um, fragt ein paar Leute ... die Wachen sind gelangweilt, mit ein paar Tricks habt Ihr sie leicht abgelenkt."},
			Answer{Tag = "", String = "", AnswerId = 97},
		}}

	OnAnswer{97;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_093", String = "Sind sie erst einmal fortgelockt, verwendet diese Dietriche, um die Tore zu öffnen. Tut es aber nur, wenn die Wachen abgelenkt sind, ansonsten habt Ihr sie am Hals!"},
			Answer{Tag = "alyahP204_094PC", String = "Gut, wo muss ich entlang?", AnswerId = 98},
		}}

	OnAnswer{98;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_095", String = "Haltet Euch immer aufwärts, durch den Bazaar und dann in den Palast. Der Palastgarten ist im westlichen Flügel. Viel Glück!"},
			Answer{Tag = "", String = "", AnswerId = 99},
		}}

	OnAnswer{99;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P204_GehInDenPalastgarten"},
						SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_9023"},
						SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8830"},
						SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_10582"},
						QuestBegin {QuestId = 939},
						QuestBegin {QuestId = 946}, 
						QuestBegin {QuestId = 947}, 
						QuestBegin {QuestId = 948},
						QuestSolve {QuestId = 951},
			SetGlobalFlagTrue {Name = "g_P204_StadtwachenDialog"}, TransferItem {GiveItem = 4630, Flag = Give}, QuestSolve {QuestId = 811},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{99;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{100;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_097", String = "Holla, immer langsam! Es kann sein, das ich weiß, wie man in den Palast kommt .."},
			Answer{Tag = "alyahP204_98PC", String = "Dann nennt Euren Preis!", AnswerId = 101},
		}}

	OnAnswer{101;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_99", String = "... aber nur unter der Bedinung, das Ihr mir helft jemanden zu finden. Gold kann ich selber stehlen, aber gute Leute sind schwer zu kriegen!"},
			Answer{Tag = "", String = "", AnswerId = 102},
		}}

	OnAnswer{102;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_100", String = "Es gibt in der Unterstadt einen Dieb ... der mir keine Anteile zahlt und frech vor meiner Nase raubt, was rechtmäßig ich hätte stehlen sollen!"},
			Answer{Tag = "", String = "", AnswerId = 103},
		}}

	OnAnswer{103;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_101", String = "Sein Name ist Flink McWinter! Geht ihn suchen und sorgt dafür, dass er mir meine Anteile zahlt! Meine Leute kennt er alle und er ist schnell zu Fuß, der kleine Bastard!"},
			Answer{Tag = "alyahP204_102PC", String = "Flink ... ja ich kann mir vorstellen, das Ihr mit ihm Ärger habt. Wie komme ich in die Unterstadt?", AnswerId = 104},
		}}

	OnAnswer{104;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyahP204_103", String = "Die Unterstadt ist kein Problem! Sagt dem Wachmann beim Tor Ihr habt eine Lieferung von Alyah. Ich bezahle ihn gut, der wird schon spuren!"},
			Answer{Tag = "", String = "", AnswerId = 105},
		}}

	OnAnswer{105;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_UriasHaltAn"}, QuestBegin {QuestId = 811}, QuestBegin {QuestId = 813},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 106},
		}}

	OnAnswer{106;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end