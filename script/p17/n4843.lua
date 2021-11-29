function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X , Y = _Y ,
	Conditions = 
	{
		FigureDead{NpcId = 2567},
		IsGlobalFlagTrue {Name = "BauernCamp"}, 
	}
}

OnIdleGoHome{WalkMode = Run, X = 396, Y = 198, Direction = 0}


EndDefinition()

end
