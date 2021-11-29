--Archon, der Craig bewacht

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}


SpawnOnlyWhen
{
	X = _X, Y = _Y, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
		{
			--IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"}, 
			--QuestState {QuestId = 1063, State = StateActive}, --NQ Der letzte Dracon
		}, 
	Actions = 
	{
		ChangeRace {Race = 124, NpcId = self},
		SetGlobalFlagTrue {Name = "g_sP211NQDraconArchonGeSpawned"},
	} 
}

OnIdleGoHome
{
	X = _X, Y = _Y, Direction = 7, Range = 1, WalkRange = 2, WaitTime = 0, WalkMode = Walk, GotoMode = GotoNormal,
	Conditions = {},
	Actions = {},
	HomeActions = { },
	AbortConditions = {},
	AbortActions = {},
}


EndDefinition()

end
