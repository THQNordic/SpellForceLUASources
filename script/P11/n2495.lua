function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 243 , Y = 181 ,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Q166ConjurationSuccess", UpdateInterval = 1},		
	}
}

OnIdleGoHome
{
	WalkMode = Run, X = _X, Y = _Y, 
	Direction = 5 , 
	Conditions = 
	{
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "TestBla"},
	}
}

EndDefinition()

end
