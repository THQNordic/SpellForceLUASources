function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y, 
	Conditions =
	{
		IsGlobalFlagTrue {Name = "WindjalfFolgt"},
	}
	
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "WindjalfFolgt"},
	},
	Actions =
	{
		AttackTarget {Target = 6304},
	}
}
EndDefinition()

end

