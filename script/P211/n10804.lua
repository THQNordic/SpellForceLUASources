--Soulforger Pet

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 85, Y = 100, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
		{
			IsGlobalTimeElapsed {Name = "gt_P211_MiniforgerAufAuf", Seconds = 11}
		}, 
	Actions = 
		{
			Follow {Target = 9719, NpcId = self}
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
