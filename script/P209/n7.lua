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
		IsGlobalFlagTrue {Name = "g_sP209CutszeneBoteEnded"},
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
--I             Dritter Akt              I
--I______________________________________I


--Wenn man mit Uru zum 4 mal geredet hat.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209ZwergenSchluessel"},
	},
	Actions = 
	{ 
		
		QuestSolve {QuestId = 794},
		QuestBegin {QuestId = 795},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8588"},
		SetRewardFlagTrue { Name = "UruSpricht4" },
		SetGlobalFlagTrue {Name = "g_sP209Uru4malGeredet"},
	}
}

--Wenn man das Zwergenmonument geclaimed hat.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsMonumentInUse {X = 360, Y = 421, Range = 5 , UpdateInterval = 60},
	},
	Actions = 
	{ 
		QuestSolve { QuestId = 795},
		QuestBegin { QuestId = 796},
		QuestBegin { QuestId = 797},
		QuestBegin { QuestId = 798},
		QuestBegin { QuestId = 799},
		QuestBegin { QuestId = 817},
		SetRewardFlagTrue { Name = "ZwergenMonumentClaimed" },
		SetGlobalFlagTrue { Name = "s_gP209AnfuehrerGesetzt"},
	}
}



--Wenn der Anführer der Nordarmee getötet wurde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		
		IsGlobalFlagTrue {Name = "g_sP209AnfuehrerNordgesetzt"},
		IsGlobalFlagTrue { Name = "s_gP209AnfuehrerGesetzt"},
		FigureDead {NpcId = 8659},
	},
	Actions = 
	{ 
		QuestSolve { QuestId = 797},
		SetRewardFlagTrue { Name = "LeaderNordarmeeKilled" },
	}
}

--Wenn der Anführer der Südarmee getötet wurde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209AnfuehrerSuedgesetzt"},
		IsGlobalFlagTrue { Name = "s_gP209AnfuehrerGesetzt"},
		FigureDead {NpcId = 8664},
	},
	Actions = 
	{ 
		QuestSolve { QuestId = 798},
		SetRewardFlagTrue { Name = "LeaderSuedarmeeKilled" },
	}
}

--Wenn der Anführer der Hauptarmee getötet wurde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209AnfuehrerEastgesetzt"},
		IsGlobalFlagTrue { Name = "s_gP209AnfuehrerGesetzt"},
		FigureDead {NpcId = 8665},
	},
	Actions = 
	{ 
		QuestSolve { QuestId = 799},
		SetRewardFlagTrue { Name = "LeaderHauptarmeeKilled" },
	}
}

--Wenn der Bronzeriese getötet wurde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209Bronzeriesengesetzt"},
		IsGlobalFlagTrue { Name = "s_gP209AnfuehrerGesetzt"},
		FigureDead {NpcId = 8662},
		QuestState {QuestId = 817, State = StateActive},
	},
	Actions = 
	{ 
		QuestSolve { QuestId = 817},
		SetGlobalFlagTrue {Name = "g_sP209BronzerieseDead"},
		SetRewardFlagTrue { Name = "BronzerieseGetoetet" },
	}
}

--Wenn alle Anführer getötet wurden und damit die gesamte Kaiserliche Armee.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209CutszeneKaiserEnded"},
	},
	Actions = 
	{ 
		QuestSolve { QuestId = 793},
		QuestSolve { QuestId = 796},
		QuestBegin { QuestId = 873},
		QuestBegin { QuestId = 874},
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_8588"},
	
		
	}
}

--Wenn man von Uru den Schlüssel für die ClockWorkCrypt erhalten hat.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209KeyClockwork"},
	},
	Actions = 
	{ 
		QuestSolve { QuestId = 874},
		QuestBegin { QuestId = 875},
		--SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8588"},
		SetRewardFlagTrue { Name = "UruSpricht5" },
	}
}



EndDefinition()
end
 