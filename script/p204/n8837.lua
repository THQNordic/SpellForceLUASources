-->INFO: BasarwacheOst
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 8837},
		SetGlobalFlagTrue {Name = "g_P204_BasarwacheOstHomepoint"},		
	}
}


OnIdleGoHome
{
X = _X, Y = _Y, Direction = SouthEast, Range = 0 , WalkRange = 1 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_BasarwacheOstHomepoint", UpdateInterval = 10},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}


-- Wache wird agro, wenn Tor geöffnet wird und sie nicht abgelenkt wurde
OnOneTimeEvent
{
	Conditions =
	{
	   IsGlobalTimeElapsed{Name = "c_P204_CounterBasartorOst", Seconds = 2, UpdateInterval = 10}, 
	   IsGlobalFlagTrue {Name = "g_P204_BasartorOstOffen"},
	   IsGlobalFlagTrue {Name = "g_P204_BasartorOstBewacht"},
	   IsGlobalFlagFalse{Name = "g_P204_EmpyriaAlarmiert"},	   
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8837"},
		SetGlobalFlagTrue{Name = "g_P204_SuedtorAttacke"},
		Outcry { NpcId = 8837, Tag = "oca2soldierP204_001", String = "Was? Du wagst es? Na warte!" },
		ChangeRace{Race = 150, NpcId = self},
	}
}


--- Wache wird agro nach cutscene Alyah Dryade ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_EmpyriaAlarmiert"},
	},

	Actions =
	{
		ChangeRace{Race = 150, NpcId = self},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8837"},
	}
}


--- Wache wird lieb wenn Alyah Kaiserin ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_AlyahKaiserin"},
	},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
	}
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n8837_BasarwacheOst.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			PlayerHasItem {ItemId = 7217, Amount = 1},
		},
		Actions = {
			Say{Tag = "gatekeeper_istosP204_001", String = "Nun, wie steht es in der Arnea? So sprecht schon!"},
			Answer{Tag = "gatekeeper_istosP204_002PC", String = "Ich habe als Euer Champion gesiegt! Hier ist Euer Schuldschein!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7217, Amount = 1}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_istosP204_003", String = "Gute Arbeit, Runenkrieger. Nun huscht nur rasch durch das Tor, nicht das mein Sergeant uns bei dem Handel hier erspäht!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_istosP204_004", String = "Öffnet das Tor!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			QuestSolve {QuestId = 948}, SetGlobalFlagFalse {Name = "g_P204_BasartorOstBewacht"}, SetGlobalFlagTrue {Name = "g_P204_BasartorOstAufmachen"}, TransferItem {TakeItem = 7217, Flag = Take}, QuestSolve {QuestId = 881}, SetRewardFlagTrue {Name = "Tor3DurchTrickGeoeffnet"},SetGlobalTimeStamp{Name = "c_P204_CounterNasarSagtWas"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{4;
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagBasarwache_OstKnown"},
		},
		Actions = {
			Say{Tag = "gatekeeper_istosP204_005", String = "Nun, wie steht es in der Arnea?"},
			Answer{Tag = "gatekeeper_istosP204_006PC", String = "Kein Sieg bisher.", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FlagBasarwache_OstKnown"}),
		},
		Actions = {
			Say{Tag = "gatekeeper_istosP204_008", String = "Schau an, ein Runenkrieger!"},
			Answer{Tag = "gatekeeper_istosP204_009PC", String = "Und wenn schon. Lasst mich durch!", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_istosP204_007", String = "Dann bleibt dieses Tor für Euch verschlossen, Freund! Geht und siegt! Ihr seid doch ein Runenkrieger!"},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_istosP204_010", String = "Wir haben Befehl, Euch nicht in die oberen Stadtbereiche zu lassen! Die Geier wissen, wie Ihr es bis hierhin geschafft habt! Scheinbar seid Ihr nicht ungeschickt!"},
			Answer{Tag = "gatekeeper_istosP204_011PC", String = "Was führt Ihr im Schilde, Wachmann?", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_istosP204_012", String = "Sagen wir mal ich hatte etwas ... Pech. Meine Champions haben in der Arena immer verloren und jetzt schulde ich meinem Bruder eine Menge Gold."},
			Answer{Tag = "gatekeeper_istosP204_013PC", String = "Ihr wollt also Geld von mir?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_istosP204_014", String = "Nein, nein! So einfach ist das nicht! Ich habe mein Gesicht verloren! Ich brauche einen Champion, der für mich gewinnt! Das ist es! Ein Sieg! Das stellt mein Ansehen und meinen Geldbeutel wieder her!"},
			Answer{Tag = "gatekeeper_istosP204_015PC", String = "Ich soll also in der Arena für Euch antreten, dann lasst Ihr mich durch das Tor?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_istosP204_016", String = "Ihr sollt ind er Arena für mich siegen, Freund! Als Runenkreiger sollte das doch ein leichtes sein! Geht zu meinem Bruder, er steht Wache ind er Arena. Sagt ihm, ihr seid Jarods Champion!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_istosP204_017", String = "Seid Ihr siegreich, wird Euch mein Bruder meinen Schuldschein geben. Bringt den zu mir hierher, er soll mir als Beweis genügen!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBasarwache_OstKnown"},
			SetGlobalFlagTrue {Name = "g_P204_ArenawacheAufsuchen"}, QuestBegin {QuestId = 881},
			SetGlobalFlagTrue {Name = "g_P204_ArenaWacheKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end