-- _______________________________________
--I                                      I
--I             P209_Kathai              I
--I______________________________________I



----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

BeginScript
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209UruGeredet2"},
	},
	Actions = 
	{
	
	},
}


KillScript
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209ZwergenSchluessel"},
	},
	Actions = 
	{
	
	},
}


-- _______________________________________
--I                                      I
--I            P201_Main Quest           I
--I______________________________________I


-- _______________________________________
--I                                      I
--I              Zweiter Akt             I
--I______________________________________I


--Wenn man mit Uru zum zweiten Mal geredet hat.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209UruGeredet2"},
	},
	Actions = 
	{ 
		QuestSolve {QuestId = 934},
		QuestBegin {QuestId = 786},
		QuestBegin {QuestId = 789},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8588"},
		SetRewardFlagTrue { Name = "UruSpricht2" },
	}
}

--Wenn man mind. 1 Artefakt wiedergefunden hat.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalCounter {Name = "g_cnP209ArtefaktAnzahl", Value = 1, Operator = IsGreaterOrEqual},
	},
	Actions = 
	{ 
		QuestSolve {QuestId = 789},
		QuestBegin {QuestId = 790},
		SetRewardFlagTrue { Name = "HolyArtefact1Gefunden" },
		
	}
}

--Wenn man mind. 1 Artefakt zu Uru zurückgebracht hat.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209ArenaStart"},
	},
	Actions = 
	{ 
		
		QuestSolve {QuestId = 790},
		QuestBegin {QuestId = 791},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8588"},
	}
}

--Damit man nur einen Helfer mitnehmen kann wird der Dialog abgeschaltet
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209ArenaStart", UpdateInterval = 10},
		ODER(IsGlobalFlagTrue {Name = "g_sP209MitstreiterUrias", UpdateInterval = 10}, IsGlobalFlagTrue {Name = "g_sP209MitstreiterJenquai", UpdateInterval = 10}),
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8588"},
		SetRewardFlagTrue { Name = "HolyArtefact2Gefunden" },
	}
}

--Wenn man den Gottesentscheid gewonnen hat.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209XalabarGeschlagen"},
	},
	Actions = 
	{ 
		QuestSolve {QuestId = 791},
		QuestBegin {QuestId = 792},
		SetRewardFlagTrue { Name = "XalabarInArenaBesiegt" },
	}
}

--Wenn man den Gottesentscheid gewonnen hat und mit Uru geredet hat.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209CutszeneBoteEnded"},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_8588"},
		QuestSolve {QuestId = 792},
		QuestSolve {QuestId = 786},
		QuestBegin {QuestId = 793},
		QuestBegin {QuestId = 794},
		SetRewardFlagTrue { Name = "UruSpricht3" },
	}
}

EndDefinition()
end
 