function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X , Y = _Y ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "Aussenhof"},
	}
}

OnIdleGoHome{WalkMode = Run, X = 133, Y = 103, Direction = 0}


EndDefinition()

end
