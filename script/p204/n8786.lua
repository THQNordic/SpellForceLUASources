-->INFO: Torwache
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 8786},
		SetGlobalFlagTrue {Name = "g_P204_TorwacheHomepoint"},		
	}
}


OnIdleGoHome
{
X = _X, Y = _Y, Direction = West, Range = 0 , WalkRange = 0 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_TorwacheHomepoint", UpdateInterval = 60},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}

OnOneTimeEvent
{
	Conditions = 
	{
		ODER9
		{
		IsGlobalFlagTrue {Name = "g_P204_StadttorAufmachen", UpdateInterval = 60},
		IsGlobalFlagTrue{Name = "g_P204_EmpyriaAlarmiert", UpdateInterval = 60},	
		IsGlobalFlagTrue{Name = "g_P204_AlyahKaiserin", UpdateInterval = 60},
		}			
	},

	Actions =
	{
	  	SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8786"},
	}
}

OnIdleGoHome
{
	X = 207, Y = 191, WalkMode = Run, Direction = South,

	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_StadttorAufmachen", UpdateInterval = 60},
	},

	HomeActions = 
	{
		SetGlobalFlagTrue {Name = "g_P204_TorwacheHomepoint2"},	
		SetGlobalFlagFalse {Name = "g_P204_TorwacheHomepoint"},			
	}
}


OnIdleGoHome
{
X = 207, Y = 191, Direction = South, Range = 0 , WalkRange = 0 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_TorwacheHomepoint2", UpdateInterval = 60},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}

--- Wache wird agro nach cutscene Alyah Dryade ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_EmpyriaAlarmiert", UpdateInterval = 60},
	},

	Actions =
	{
		ChangeRace{Race = 150, NpcId = self},
	}
}


--- Wache wird lieb wenn Alyah Kaiserin ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_AlyahKaiserin", UpdateInterval = 60},
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
-- Source: C:\project\main\mission\dialoge\P204\n8786_Torwache.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagTorwacheKnown"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagTorwacheKnown"}),
		},
		Actions = {
			Say{Tag = "gatekeeper_myroP204_008", String = "Kein Durchgang. Fremde haben keinen Zutritt zur Stadt."},
			Answer{Tag = "gatekeeper_myroP204_009PC", String = "Und wie kommen die Händler und Kauffahrer in die Stadt?", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P204_SpielerWarBeiAlyah"}),
		},
		Actions = {
			Say{Tag = "gatekeeper_myroP204_007", String = "Kein Zutritt zur Stadt! Weitergehen!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P204_SpielerWarBeiAlyah"},
		},
		Actions = {
			Say{Tag = "gatekeeper_myroP204_001", String = "Kein Zutritt zur Stadt!"},
			Answer{Tag = "gatekeeper_myroP204_002PC", String = "Ich habe eine Lieferung von Alyah.", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_myroP204_003", String = "Was? Ihr treibt Geschäfte mit Alyah? Unmöglich!"},
			Answer{Tag = "gatekeeper_myroP204_004PC", String = "Warum? Immerhin treibt sie ja auch Geschäfte mit Euch ...", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_myroP204_013", String = "Leise doch! Man könnte uns hören!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_myroP204_005", String = "Also gut ... Öffnet das Tor!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_myroP204_006", String = "Ihr könnt passieren."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_StadttorAufmachen"},
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
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_myroP204_010", String = "Die sind ja auch keine Runenkrieger! Keine Sorgenbringer ..so wie Ihr!"},
			Answer{Tag = "gatekeeper_myroP204_011PC", String = "Ich verstehe.", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_myroP204_012", String = "Gut! Sehr gut! Und jetzt geht wieder dahin, wo Ihr hergekommen seid!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagTorwacheKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end