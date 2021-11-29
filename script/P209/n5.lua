-- _______________________________________
--I                                      I
--I             P209_Kathai              I
--I______________________________________I



----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



-- _______________________________________
--I                                      I
--I            P201_Main Quest           I
--I______________________________________I

-- _______________________________________
--I                                      I
--I              Erster Akt              I
--I______________________________________I
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_sP209CutszeneStartEnded"},
	},
	Actions = 
	{ 
		QuestBegin {QuestId = 779},
		QuestBegin {QuestId = 780},
		QuestBegin {QuestId = 781},
		QuestBegin {QuestId = 782},
		SetRewardFlagTrue { Name = "P209KarteErreicht" },
		
	}
}


--Wenn man die 12 Untotencamps zerstört hat.
OnOneTimeEvent
{
	Conditions = 
	{ 
		
		IsGlobalFlagTrue {Name = "g_sP209UntotenLagerOst"},
		IsGlobalFlagTrue {Name = "g_sP209UntotenLagerNord"},
		IsGlobalFlagTrue {Name = "g_sP209UntotenLagerSued"},
		
	},
	Actions = 
	{ 
		QuestSolve {QuestId = 781},
	}
}

--XP Verteilung wenn man die NordCamps zerstört hat
OnOneTimeEvent
{
	Conditions = 
	{ 
		
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp1_NordTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp2_NordTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp3_NordTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp4_NordTor_Destroyed"},
	
	
	},
	Actions = 
	{ 
		SetRewardFlagTrue { Name = "UntotenlagerNord" },
		SetGlobalFlagTrue {Name = "g_sP209UntotenLagerNord"},
	}
}

--XP Verteilung wenn man die SüdCamps zerstört hat
OnOneTimeEvent
{
	Conditions = 
	{ 
		
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp1_SuedTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp2_SuedTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp3_SuedTor_Destroyed"},
	
	
	},
	Actions = 
	{ 
		SetRewardFlagTrue { Name = "UntotenlagerSued" },
		SetGlobalFlagTrue {Name = "g_sP209UntotenLagerSued"},
	}
}

--XP Verteilung wenn man die WestCamps zerstört hat
OnOneTimeEvent
{
	Conditions = 
	{ 
		
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp1_OstTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp2_OstTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp3_OstTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp4_OstTor_Destroyed"},
		IsGlobalFlagTrue {Name = "g_sP209SkelettCamp5_OstTor_Destroyed"},
	
	
	},
	Actions = 
	{ 
		SetRewardFlagTrue { Name = "UntotenlagerWest" },
		SetGlobalFlagTrue {Name = "g_sP209UntotenLagerOst"},
	}
}




--Wenn man es in die Wüstenstadt geschafft hat.
OnOneTimeEvent
{
	Conditions = 
	{ 
		
		PlayerUnitInRange {X = 258, Y = 179, Range = 5, FigureType = FigureAvatar, UpdateInterval = 10},
	},
	Actions = 
	{ 
		QuestSolve {QuestId = 782},
		SetGlobalFlagTrue {Name = "g_sP209InnenstadtErreicht"},
		QuestBegin {QuestId = 784},
		QuestBegin {QuestId = 1083},
		QuestBegin {QuestId = 1084},
		SetRewardFlagTrue { Name = "StadtKathaiErreicht" },
		SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_10085"},
		SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_8588"},
		
	}
}

--Wenn man mit Khal geredet hat.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209KhalGeredet"},
	},
	Actions = 
	{ 
		
		QuestSolve {QuestId = 1083},
		RevealUnExplored {X = 378, Y = 251, Range = 10},
		--SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_8588"},
		SetRewardFlagTrue { Name = "GespraechMitKhal" },
	}
}


--Wenn man mit Uru geredet hat.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209UruGeredet1"}, 
	},
	Actions = 
	{ 
		QuestSolve {QuestId = 1083},
		QuestSolve {QuestId = 1084},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8588"},
		SetRewardFlagTrue { Name = "UruSpricht1" },
		
	}
}

--Wenn man mind. 1 Stadttor für seine Truppen geöffnet hat und noch nicht mit Uru geredet hat.
OnOneTimeEvent
{
	Conditions = 
	{ 
		QuestState {QuestId = 1084, State = StateActive},
		IsGlobalCounter {Name = "g_cnP209Stadttor", Value = 1, Operator = IsGreaterOrEqual}, 
		IsGlobalFlagFalse {Name = "g_sP209SkeletonTowersDestroyed"},
		
	},
	Actions = 
	{ 
		
		QuestSolve {QuestId = 1084},
		QuestSolve {QuestId = 1083},
		QuestSolve {QuestId = 784},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8588"},
		QuestBegin {QuestId = 785},
		SetRewardFlagTrue { Name = "KathaiStadtTorOffen" },
	}
}

--Wenn man mind. 1 Stadttor für seine Truppen geöffnet hat.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalCounter {Name = "g_cnP209Stadttor", Value = 1, Operator = IsGreaterOrEqual}, 
		IsGlobalFlagFalse {Name = "g_sP209SkeletonTowersDestroyed"},
	},
	Actions = 
	{ 
		QuestSolve {QuestId = 784},
		QuestBegin {QuestId = 785},
		SetRewardFlagTrue { Name = "KathaiStadtTorOffen" },
	}
}

--Wenn man mind. 1 Stadttor für seine Truppen geöffnet hat und Quest 785 bereits gelöst hat.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalCounter {Name = "g_cnP209Stadttor", Value = 1, Operator = IsGreaterOrEqual}, 
		IsGlobalFlagTrue {Name = "g_sP209SkeletonTowersDestroyed"},
	},
	Actions = 
	{ 
		QuestSolve {QuestId = 784},	
		SetRewardFlagTrue { Name = "KathaiStadtTorOffen" },	
	}
}


--Das Nordtor wurde geöffnet.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "g_tsP209NorthGateOpen", Seconds = 2, UpdateInterval = 60}, 
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8529" },
		SetItemFlagFalse {Name = "PlayerHasItemNorthGateKeyKathai"},
	}
}

--Das Osttor wurde geöffnet.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "g_tsP209EastGateOpen", Seconds = 2, UpdateInterval = 60}, 
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8527" },
		SetItemFlagFalse {Name = "PlayerHasItemEastGateKeyKathai"},
	}
}

--Das Südtor wurde geöffnet.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "g_tsP209SouthGateOpen", Seconds = 2, UpdateInterval = 60}, 
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8528" },
		SetItemFlagFalse {Name = "PlayerHasItemSouthGateKeyKathai"},
	}
}


--Scriptoptimierung
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton1"},
		IsGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton2"},
		IsGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton3"},
		IsGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton4"},
		IsGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton5"},
		IsGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton6"},
		IsGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton7"},
		IsGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton8"},
		IsGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton9"},
		IsGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton10"},
		IsGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton11"},
		IsGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton12"},
		IsGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton13"},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name ="g_sP209SpawnStopInnenstadt"},
	}
}

--Scriptoptimierung
OnOneTimeEvent
{
	Conditions = 
	{ 
		--SüdTorTürme
		Negated(BuildingInRange {X = 259, Y = 97, Range = 2}),
		Negated(BuildingInRange {X = 257, Y = 78, Range = 2}),
		--OstTorTürme
		Negated(BuildingInRange {X = 265, Y = 288, Range = 2}),
		Negated(BuildingInRange {X = 266, Y = 282, Range = 2}),
		Negated(BuildingInRange {X = 267, Y = 259, Range = 2}),
		Negated(BuildingInRange {X = 266, Y = 254, Range = 2}),
		--NordTorTürme
		Negated(BuildingInRange {X = 302, Y = 390, Range = 2}),
		Negated(BuildingInRange {X = 304, Y = 369, Range = 2}),
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name ="g_sP209SkekletonBuildingZerstoert"},
	}
}


--Wenn alle Türme und alle Spawngebäude der Skeletons zerstört wurden.
OnOneTimeEvent
{
	Conditions = 
	{ 
		
		--Skeleton Spawncamps Innenstadt
		IsGlobalFlagTrue {Name = "g_sP209SpawnStopInnenstadt"},
		
		--Start der 1 Cutszene
		IsGlobalFlagTrue {Name = "g_sP209CutszeneStartEnded"},
		
		--Alle 3 TorWächter getötet
		FigureDead {NpcId = 8939},
		FigureDead {NpcId = 8940},
		FigureDead {NpcId = 8942}, 
		--Alle Türme zerstört
		IsGlobalFlagTrue {Name ="g_sP209SkekletonBuildingZerstoert"},
	},
	Actions = 
	{ 
		QuestSolve {QuestId = 785},
		SetGlobalFlagTrue {Name = "g_sP209SkeletonTowersDestroyed"},
		
	}
}

--Wenn alle Türme und alle Spawngebäude der Skeletons zerstört hat aber noch nicht mit Uru geredet hat.
OnOneTimeEvent
{
	Conditions = 
	{ 
		
		--Skeleton Spawncamps Innenstadt
		IsGlobalFlagTrue {Name = "g_sP209SpawnStopInnenstadt"},
		--Start der 1 Cutszene
		IsGlobalFlagTrue {Name = "g_sP209CutszeneStartEnded"},
		
		--Alle 3 TorWächter getötet
		FigureDead {NpcId = 8939},
		FigureDead {NpcId = 8940},
		FigureDead {NpcId = 8942}, 
		
		QuestState {QuestId = 1084, State = StateActive},
		--Alle Türme zerstört
		IsGlobalFlagTrue {Name ="g_sP209SkekletonBuildingZerstoert"},
		
	},
	Actions = 
	{ 
		QuestSolve {QuestId = 1084},
		QuestSolve {QuestId = 1083},
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8588"},
		QuestSolve {QuestId = 785},
		SetGlobalFlagTrue {Name = "g_sP209SkeletonTowersDestroyed"},
		
	}
}

--Quest 780 Solved wenn alle UnterQuests gesolved wurden.
OnOneTimeEvent
{
	Conditions = 
	{ 
		QuestState {QuestId = 781, State = StateSolved},
		QuestState {QuestId = 782, State = StateSolved},
		QuestState {QuestId = 1083, State = StateSolved},
		QuestState {QuestId = 1084, State = StateSolved},
		QuestState {QuestId = 784, State = StateSolved},
		QuestState {QuestId = 785, State = StateSolved},
	},
	Actions = 
	{ 
		
		SetGlobalFlagTrue {Name = "g_sP209StadtKathaiBefreit"},
		QuestSolve {QuestId = 780},
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_8588"},
		SetGlobalFlagTrue {Name = "g_sP209UruWachen"},	
		QuestBegin {QuestId = 934},
		SetRewardFlagTrue { Name = "KathaiStadtBefreit" },
	}
}


EndDefinition()
end
 