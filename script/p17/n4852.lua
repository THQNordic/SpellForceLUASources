function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X , Y = _Y ,
	Conditions = 
	{
		FigureDead{NpcId = 2569},
		IsGlobalFlagTrue {Name = "LetztesCamp1"}, 
		IsGlobalFlagTrue {Name = "LetztesCamp2"}, 
	}
}

OnIdleGoHome{WalkMode = Run, X = 139, Y = 319, Direction = 0}


EndDefinition()

end
