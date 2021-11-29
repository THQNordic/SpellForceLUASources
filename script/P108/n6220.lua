function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{	
	WalkMode = Walk, X = _X, Y = _Y, Direction = 3,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "UramSprengungP108"},
	}
}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "UramSprengungP108"},
	},
	Actions = 
	{
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "UramSprengungP108"},
	},
	Actions =
	{
		AttackTarget {Target = 6200},
	},
}


EndDefinition()

end
