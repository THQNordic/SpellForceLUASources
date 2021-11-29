-->INFO: BasarwacheWest
-->INFO: Basarwache_West
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 8838},
		SetGlobalFlagTrue {Name = "g_P204_BasarwacheWestHomepoint"},			
	}
}


OnIdleGoHome
{
X = _X, Y = _Y, Direction = SouthWest, Range = 0 , WalkRange = 1 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_BasarwacheWestHomepoint", UpdateInterval = 10},
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
	   IsGlobalTimeElapsed{Name = "c_P204_CounterBasartorWest", Seconds = 2, UpdateInterval = 10}, 
	   IsGlobalFlagTrue {Name = "g_P204_BasartorWestOffen"},
	   IsGlobalFlagTrue {Name = "g_P204_BasartorWestBewacht"},
	   IsGlobalFlagFalse{Name = "g_P204_EmpyriaAlarmiert"},	   
       Negated(PlayerHasItemEquipped {ItemId = 4632, Amount = 1}),	   
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8838"},
		SetGlobalFlagTrue{Name = "g_P204_SuedtorAttacke"},
		Outcry { NpcId = 8838, Tag = "oca2soldierP204_001", String = "Was? Du wagst es? Na warte!" },
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
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8838"},
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
-- Source: C:\project\main\mission\dialoge\P204\n8838_BasarwacheWest.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			PlayerHasItemEquipped {ItemId = 4632, Amount = 1},
		},
		Actions = {
			Say{Tag = "gatekeeper_shamziroP204_001", String = "Guten Tag, Bruder, wohin des Wegs?"},
			Answer{Tag = "gatekeeper_shamziroP204_002PC", String = "Weisheit und Güte, Freund. Würdet Ihr das Tor öffnen? Ich habe einem armen Sünder Beistand zu geben.", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(PlayerHasItemEquipped {ItemId = 4632, Amount = 1}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_shamziroP204_003", String = "Beistand? Oh, der arme Kerl, ich hoffe Ihr rettet ihn vor dem Kerker, Bruder!"},
			Answer{Tag = "gatekeeper_shamziroP204_004PC", String = "Ereon wird mir den Weg dazu weisen.", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_shamziroP204_005", String = "Ihr Priester seid wahrhaft gute Menschen! Öffnet das Tor!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse {Name = "g_P204_BasartorWestBewacht"}, SetGlobalFlagTrue {Name = "g_P204_BasartorWestAufmachen"}, SetRewardFlagTrue {Name = "Tor1DurchTrickGeoeffnet"}, SetGlobalTimeStamp{Name = "c_P204_CounterNasarSagtWas"},
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
			Negated(IsPlayerFlagTrue{Name = "FlagBasarwache_WestKnown"}),
		},
		Actions = {
			Say{Tag = "gatekeeper_shamziroP204_009", String = "Halt, Nachbar! Krieger haben hier keinen Zutritt!"},
			Answer{Tag = "gatekeeper_shamziroP204_010PC", String = "Wie sollen Eure Händler jemals zu Gold kommen, wenn Ihr alle Käufer vom Basar fernhaltet?", AnswerId = 6},
		}}

	OnAnswer{4;
		Conditions = {
			IsPlayerFlagTrue{Name = "FlagBasarwache_WestKnown"},
		},
		Actions = {
			Say{Tag = "gatekeeper_shamziroP204_006", String = "Kein Zutritt ..."},
			Answer{Tag = "gatekeeper_shamziroP204_007PC", String = "Schon gut, Nachbar.", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_shamziroP204_008", String = "Kenne ich Euch? Ach, ich und mein schlechtes Gedächtnis ..."},
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
			Say{Tag = "gatekeeper_shamziroP204_011", String = "Anordnung des Kaisers!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_shamziroP204_012", String = "Es tut mir leid, Nachbar, ich mache die Gesetze nicht. Kein Zutritt! Geht weiter!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBasarwache_WestKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end