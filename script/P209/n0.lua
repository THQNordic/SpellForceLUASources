-- _______________________________________
--I                                      I
--I             P209_Kathai              I
--I______________________________________I



----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


dofile("script/P209/n0_ItemScript.lua")
dofile("script/P209/n32470_CutszeneStart.lua") 
dofile("script/P209/n32476_CutszeneKathaiBefreit.lua")
dofile("script/P209/n32483_CutszeneBote.lua") 
dofile("script/P209/n32493_CutszeneKaiser.lua") 
dofile("script/P209/n32497_CutszeneDryadePhoenix.lua") 
dofile("script/P209/n32498_CutszeneDryadeSchatten.lua") 

dofile("script/Hadeko.lua")
dofile("script/HeiligeStaetteWorkaround.lua")



-- _______________________________________
--I                                      I
--I              Erster Akt              I
--I______________________________________I


OnOneTimeEvent
{
	Conditions = 
	{ 
		
	},
	Actions = 
	{ 
		
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8576" },
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8694" },	
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8590" },	
		SetGlobalFlagTrue {Name = "g_sP209CutszeneStartBegin"},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_10085"},
		QuestSolve {QuestId = 972},	
		QuestSolve {QuestId = 1098},	
		
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209CutszeneStartEnded"},
	},
	Actions = 
	{ 
		
		
		SetGlobalFlagTrue {Name = "g_sP209JenquaiFollow"},
		SetGlobalFlagTrue {Name = "g_sP209UriasFollow"},
		SetGlobalFlagTrue {Name = "g_sP209AlyahFollow"},
		RevealUnExplored {X = 113, Y = 410, Range = 10},
		
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209UruGeredet1"}
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP209KithaiBefreit"},
	}
}

--Wenn alle Skelettcamps zerstört wurden und Uru befreit wurde.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209KithaiBefreit"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp1_OstTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp2_OstTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp3_OstTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp4_OstTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp5_OstTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp1_NordTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp2_NordTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp3_NordTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp4_NordTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp1_SuedTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp2_SuedTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp3_SuedTor_Destroyed"},
		
		
		--Skeleton Spawncamps Innenstadt
		IsGlobalFlagTrue {Name ="g_sP209SpawnStopInnenstadt"},
		
		--Alle 3 TorWächter getötet
		FigureDead {NpcId = 8939},
		FigureDead {NpcId = 8940},
		FigureDead {NpcId = 8942}, 
		
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP209AlleKathaiBefreit"},
	}
}


--Wenn Uru befreit wurde, bekommt er von ihr Unterstützungseinheiten um ein Tor für seine Armee zu öffnen.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209KathaiUnterstuetzungErhalten"},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP209SpawnUnterstuetzungseinheiten"},
	}
}



----I---------------------------------------I
----I                                       I
----I           Bank von Empyria            I
----I           Schatzbrief-Zähler          I
----I         (muß auf alle Karten!)        I
----I                                       I
----I---------------------------------------I



OnEvent
{
	Conditions =
	{
		PlayerHasItem{ItemId = 7357},
		IsGlobalTimeElapsed{Name = "g_SchatzbriefTimer", Seconds = 7000}
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "g_P204_SchatzbriefZins"},
		SetGlobalTimeStamp{Name = "g_SchatzbriefTimer"},
	}
}

----------------------------------------------------------
--				Storyquest Part.
----------------------------------------------------------


--- Enter Clockwork
OnOneTimeEvent
{
	Conditions = 
	{
	QuestState{QuestId = 1087, State = StateActive}, 
	QuestState{QuestId = 1092, State = StateActive}, 
	IsGlobalFlagTrue{Name = "g_StoryQuestEnterClockwork"},
	},
	Actions = 
	{ 
	QuestSolve{QuestId = 1092},
	QuestBegin{QuestId = 1093},
	}
}

EndDefinition()
end
 