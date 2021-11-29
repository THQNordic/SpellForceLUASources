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

OnIdleGoHome{WalkMode = Run, X = 132, Y = 104, Direction = 0}


EndDefinition()

end
