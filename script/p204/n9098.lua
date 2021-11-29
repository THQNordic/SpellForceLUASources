-->INFO: Stadtwache
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--- Lieb und keinen Dialog ---
OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 9098},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9098"},
	}
}

--- Dialog geben wenn Spieler Dietriche bekommt ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P204_StadtwachenDialog", UpdateInterval = 60},
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_9098"},
	}
}

OnIdleGoHome
{
X = _X, Y = _Y, Direction = West, Range = 0 , WalkRange = 1 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoNormal,
	Conditions = {},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}

-- Wache wird agro, wenn Tor geöffnet wird
OnOneTimeEvent
{	
	Conditions =
	{
		ODER9
		{
	   		IsGlobalTimeElapsed{Name = "c_P204_CounterUnterstadttorRechts", Seconds = 2, UpdateInterval = 10}, 
	   		IsGlobalFlagTrue {Name = "g_P204_StadtwachenAngriff"},
		}
	},

	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9098"},
		SetGlobalFlagFalse{Name = "g_P204_UnterstadttorRechtsBewacht"},
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
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9098"},
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
-- Source: C:\project\main\mission\dialoge\P204\n9098_Stadtwache.txt


	

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
			Say{Tag = "gatekeeper_takP204_001", String = "Heda, Gesell! Was glaubst du, wo du hingehst?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gatekeeper_takP204_002PC", String = "Wachmann, ich erbitte Zutritt.", AnswerId = 2},
			OfferAnswer{Tag = "gatekeeper_takP204_006PC", String = "Lasst mich durch, ihr Bastarde!", AnswerId = 5},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_takP204_003", String = "Da schau sich einer diesen Trollfurz an! Erbittet Zutritt! Hast du das gehört Kahled?"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_takP204_004", String = "Kahled und ich, wir vergessen gleich mal unsere Manieren, dann bittest du um was ganz anderes, Freundchen!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_takP204_005", String = "Nämlich um dein Leben! Ha Ha!"},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_takP204_007", String = "Holla! Hast du das gehört Kahled? Hör mal Dreckspatz, was glaubst du mit wem du hier redest?"},
			Answer{Tag = "gatekeeper_takP204_008PC", String = "Mit stinkendem Abschaum dessen Mutter sich mit Hunden paart!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gatekeeper_takP204_009", String = "Du ... Du ..."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P204_StadtwachenAngriff"},
			Say{Tag = "gatekeeper_takP204_010", String = "Los Kaled! Die Ratte kaufen wir uns!"},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end