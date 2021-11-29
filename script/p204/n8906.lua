-->INFO: TempelTorwache
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--- Friedlich und Dialog weg ---
OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 8906},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8906"},
		SetGlobalFlagTrue {Name = "g_P204_TempeltorwacheHomepoint"},	
	}
}


--- Homepoint ---
OnIdleGoHome
{
X = _X, Y = _Y, Direction = 2, Range = 0 , WalkRange = 0 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_TempeltorwacheHomepoint", UpdateInterval = 60},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}


--- Dialog wenn Spieler Dietriche hat ---
OnOneTimeEvent
{
	Conditions = 
	{
	    PlayerHasItem {ItemId = 4630, UpdateInterval = 60},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_8906"},
	}
}


--- Agro wenn Tempeltor offen und nicht abgelenkt ---
OnOneTimeEvent
{
	Conditions =
	{
	   IsGlobalTimeElapsed{Name = "c_P204_CounterTempeltor", Seconds = 2, UpdateInterval = 60}, 
	   FigureInRange{X = 223, Y = 197, NpcId = self , Range = 5},
	   IsGlobalFlagTrue {Name = "g_P204_TempeltorOffen"},
	   IsGlobalFlagTrue {Name = "g_P204_TempeltorBewacht"},
	   IsGlobalFlagFalse {Name = "g_P204_TempeltorwacheAttacke"},
	   IsGlobalFlagFalse{Name = "g_P204_EmpyriaAlarmiert"},
	   IsGlobalFlagFalse{Name = "g_P204_WacheWurdeAbgelenkt"},	   
	},

	Actions =
	{
		SetGlobalFlagFalse {Name = "g_P204_TempeltorwacheHomepoint"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8906"},
		ChangeRace{Race = 150, NpcId = self},
	}
}


-- Wache verfolgt Flink in den Hinterhof, das Tor ist unbewacht ---
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_TempeltorwacheAttacke", UpdateInterval = 60},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8906"},
--		Outcry { NpcId = 8683 , String = "Oh, oh, ich erzittere! Hier bin ich! Na komm schon!" },
		SetGlobalFlagTrue{Name = "g_P204_WacheVerfolgtFlink"},
		SetGlobalFlagFalse {Name = "g_P204_TempeltorwacheHomepoint"},
		Follow{Target = 8683, NpcId = self},
		QuestSolve {QuestId = 943},
	}
}


--- Verwirrung im Hinterhof ---
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {X = 243, Y = 155, NpcId = self, Range = 5},
	},

	Actions =
	{
		StopFollow{Target = 8683, NpcId = self},
		SetGlobalFlagTrue{Name = "g_P204_WacheNixraff"},
	}
}

OnIdleGoHome
{
	X = 241, Y = 167, WalkMode = Walk, Direction = West,

	Conditions =
	{
	   IsGlobalFlagTrue {Name = "g_P204_WacheNixraff", UpdateInterval = 60},
	},

	HomeActions =
	{
		--HoldPosition {NpcId = self},
		SetNpcFlagTrue{Name = "n_P204_WacheSuchtImHinterhof"},
	}
}
OnOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue{Name = "n_P204_WacheSuchtImHinterhof"},
	},
	Actions =
	{
		Outcry { NpcId = 8906 , Tag = "oca2gatekeeper_praijosP204_002", String = "Wo ist der Kerl hin? Verfluchter Hund!" },
		SetGlobalFlagFalse{Name = "g_P204_WacheVerfolgtFlink"},
		SetGlobalFlagTrue{Name = "g_P204_FlinkAusserGefahr"},		
		SetGlobalTimeStamp{Name = "c_P204_CounterWacheImHinterhof"},
		--SetGlobalFlagTrue{Name = "g_P204_TempeltorBewacht"},		
	}
}


--- Counter bis zurueck zum Tor ---
OnOneTimeEvent
{
	Conditions =
	{
	   IsGlobalTimeElapsed{Name = "c_P204_CounterWacheImHinterhof", Seconds = 20, UpdateInterval = 60}, 
	},

	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P204_WacheZurueck"},
		SetGlobalFlagTrue {Name = "g_P204_WacheWurdeAbgelenkt"},		

	}
}


--- Wache geht zum Tor zurück wenn es geöffnet wurde und der Counter abgelaufen ist ---
OnIdleGoHome
{
	X = 226, Y = 196, WalkMode = Run, Direction = West,

	Conditions =
	{
       IsGlobalFlagTrue{Name = "g_P204_WacheZurueck", UpdateInterval = 60},
	},

	HomeActions =
	{
		SetGlobalFlagFalse{Name = "g_P204_FlinkLenktWacheAb"},
		SetGlobalFlagFalse{Name = "g_P204_WacheNixraff"},
		SetGlobalFlagFalse{Name = "g_P204_WacheEntkommen"},
		SetGlobalFlagFalse{Name = "g_P204_TempeltorwacheAttacke"},
		SetGlobalFlagFalse{Name = "g_P204_WacheVerfolgtFlink"},
		SetGlobalFlagTrue {Name = "g_P204_TempelWacheHomePoint"},
		SetGlobalFlagTrue {Name = "g_P204_TempeltorBewacht"},		
	}
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
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8906"},
	}
}
------OutcryDummy Event für Scriptparser
OnOneTimeEvent
{
Conditions = {
			IsGlobalFlagTrue{Name = "NeverTrue"}
			},
Actions = {
		Outcry { NpcId = 8906, Tag = "oca2gatekeeper_praijosP204_003", String = "Verdammt! Jemand hat das Tor aufgebrochen!"},	
		}
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n8906_TempelTorwache.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagTempelTorwacheKnown"},
		},
		Actions = {
			Say{Tag = "gatekeepr_praijosP204_001", String = "Halt! Dies ist der Zugang zum Tempelbereich! Niemand darf ohne Erlaubnis des Kaisers hinein!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagTempelTorwacheKnown"}),
		},
		Actions = {
			Say{Tag = "gatekeepr_praijosP204_004", String = "Du schon wieder? Verschwinde!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagTempelTorwacheKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gatekeepr_praijosP204_002PC", String = "Ich habe die Hazim vor den Toren geschlagen, ich will eine Audienz mit dem Kaiser!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeepr_praijosP204_003", String = "Du kannst eine Audienz mit meinem Stiefel bekommen! Los, fort mit dir!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			QuestBegin {QuestId = 943},
			SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_8683"},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end