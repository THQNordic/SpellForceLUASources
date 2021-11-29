function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = 358, Y = 303,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "OrcTownAttack"},
	}
}

OnIdleGoHome
{
	X = 449, Y = 285, Direction = 4,  WalkMode = Run,
	Conditions = 
	{	
		IsGlobalFlagTrue {Name = "OrcTownAttack"},
	}
}

EndDefinition()

end
