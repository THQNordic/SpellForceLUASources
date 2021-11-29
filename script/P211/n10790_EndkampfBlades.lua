function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 85, Y = 100, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
		{
			IsGlobalTimeElapsed {Name = "gt_P211_MiniforgerAufAuf", Seconds = random(1)+3}
		}, 
	Actions = 
		{
			Goto {X = _X, Y = _Y, NpcId = self, Range = 1, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0}
		} 
}

OnIdleGoHome
{
	X = _X, Y = _Y, Direction = 0, Range = 0, WalkRange = 4, WaitTime = 0, WalkMode = Walk, GotoMode = GotoNormal,
	Conditions = {},
	Actions = {},
	HomeActions = {},
	AbortConditions = {},
	AbortActions = {},
}


EndDefinition()

end
