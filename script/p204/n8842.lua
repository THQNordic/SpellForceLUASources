-->INFO: Oberstadtwache

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 8842},
	}
}
OnIdleGoHome
{
X = _X, Y = _Y, Direction = 2, Range = 0 , WalkRange = 0 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoNormal,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "g_P204_KollegenGehenZumTisch"},
	},
	Actions = {},
	HomeActions = 
	{
	--HoldPosition {NpcId = self},
	},
}


--- Dialog zwischen den Wachen am linken Aufgang ---
OnOneTimeEvent
{
	Conditions =
	{
	IsGlobalTimeElapsed{Name = "c_P204_CounterNasarSagtWas", Seconds = 8, UpdateInterval = 10}, 
	PlayerUnitInRange {X = 231, Y = 270, Range = 5, FigureType = Avatar, UpdateInterval = 20},
	IsGlobalFlagFalse{Name ="g_P204_BierHinstellen"},
	IsGlobalFlagFalse {Name = "g_P204_WachenOutcryWasser"},
	IsGlobalFlagFalse{Name = "g_P204_OberstadttorLinksOffen"},	
	},

	Actions =
	{
		Outcry { NpcId = 8841, Tag = "oca2gatekeeper_monP204_001", Delay = FALSE, String = "Beim Seelenfluss, hab ich Durst! Und wieder gibt es nur brackiges Wasser"},
		Outcry { NpcId = 8842, Tag = "oca2gatekeeper_razulP204_001", Delay = FALSE, String = "Ja! Widerlich! Wir wagen hier unser Leben und werden wie Gefangene versorgt!"},
		Outcry { NpcId = 8841, Tag = "oca2gatekeeper_razulP204_002", Delay = FALSE, String = "Am liebsten würde ich dem General die faule Brühe in den Rachen schütten!"},
	
		SetGlobalTimeStamp{Name = "c_P204_CounterWacheLinksSatzA"},
		SetGlobalFlagTrue {Name = "g_P204_WachenDialogBetrogener"},
		SetGlobalFlagTrue {Name = "g_P204_DialogWachenLinks"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
	   IsGlobalFlagFalse{Name ="g_P204_BierHinstellen"},	
	   IsGlobalFlagFalse{Name = "g_P204_OberstadttorLinksOffen"},		
	   IsGlobalTimeElapsed{Name = "c_P204_CounterWacheLinksSatzA", Seconds = 6, UpdateInterval = 10}, 
	},

	Actions =
	{
--		Outcry { NpcId = 8842, Tag = "oca2gatekeeper_razulP204_001", String = "Ja! Widerlich! Wir wagen hier unser Leben und werden wie Gefangene versorgt!"},
		SetGlobalTimeStamp{Name = "c_P204_CounterWacheLinksSatzB"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
	   IsGlobalFlagFalse{Name ="g_P204_BierHinstellen"},	
	   IsGlobalFlagFalse{Name = "g_P204_OberstadttorLinksOffen"},		
	   IsGlobalTimeElapsed{Name = "c_P204_CounterWacheLinksSatzB", Seconds = 6, UpdateInterval = 10}, 
	},

	Actions =
	{
--		Outcry { NpcId = 8841, Tag = "oca2gatekeeper_razulP204_002", String = "Am liebsten würde ich dem General die faule Brühe in den Rachen schütten!"},
		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_9668"},
		SetGlobalFlagFalse {Name = "g_P204_DialogWachenLinks"},
		SetGlobalFlagFalse {Name = "g_P204_WachenDialogBetrogener"},
		QuestBegin {QuestId = 877}
	}
}


-- Wache wird agro, wenn Tor geöffnet wird und sie nicht abgelenkt wurde
OnOneTimeEvent
{
	Conditions =
	{
	   IsGlobalTimeElapsed{Name = "c_P204_CounterOberstadttorLinks", Seconds = 2, UpdateInterval = 10}, 
	   IsGlobalFlagTrue {Name = "g_P204_OberstadttorLinksOffen"},
	   IsGlobalFlagFalse {Name = "g_P204_KollegenGehenZumTisch"},
	},

	Actions =
	{
		ChangeRace{Race = 150, NpcId = self},
	}
}

-- Wache geht zum Tisch, sobald der Spieler das Bier dort abgestellt hat
OnIdleGoHome
{
	X = 216, Y = 279, WalkMode = Run, Direction = North,

	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_KollegenGehenZumTisch", UpdateInterval = 10},
	},

	HomeActions =
	{
		SetGlobalFlagFalse{Name = "g_P204_OberstadttorLinksBewacht"},
		SetGlobalFlagFalse{Name = "g_P204_BierHinstellen"},
		SetRewardFlagTrue { Name = "OberstadtLinksErreicht" },
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
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8842"},
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

------OutcryDummy Event für Scriptparser
OnOneTimeEvent
{
Conditions = {
			IsGlobalFlagTrue{Name = "NeverTrue"}
			},
Actions = {
		Outcry { NpcId = 8842, Tag = "oca2gatekeeper_monP204_002", String = "Na so was! Wer hat denn an dem Schloss gedreht?"},	
		}
}
EndDefinition()

end
