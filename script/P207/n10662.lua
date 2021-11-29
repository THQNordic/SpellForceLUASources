function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = _X,
	Y = _Y,
	StayOpen = TRUE,
	Type = DunkelelfenTor,
	OpenConditions = 
	{
		Negated(BuildingInRange {X = 193, Y = 323, Range = 0, BuildingId = 0, Owner = OwnerNpc}),
		Negated(BuildingInRange {X = 177, Y = 323, Range = 0, BuildingId = 0, Owner = OwnerNpc}),
	},
	OpenActions = 
	{
		--SetGlobalTimeStamp{Name = "g_p207_Erste_Festung_Tore_Offen_Timer"},
		SetGlobalFlagTrue {Name = "g_p207_Erste_Festung_Tore_Offen"},
		QuestSolve {QuestId = 975}, -- Quest 975 lösen
		QuestBegin {QuestId = 976},
	},
}

--OnOneTimeEvent
--{
--	Conditions =
--	{
--		IsGlobalTimeElapsed {Name = "g_p207_Erste_Festung_Tore_Offen_Timer", Seconds = 3},
--	},
--	Actions =
--	{
--		SetGlobalFlagTrue {Name = "g_p207_Erste_Festung_Tore_Offen"},
--	},
--}

EndDefinition()

end
