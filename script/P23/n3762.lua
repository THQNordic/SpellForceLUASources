function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

SpawnOnlyWhen
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "Q310StartRevengeAttack"},
	},
	Actions =
	{
		SetGlobalTimeStamp {Name = "WeiterGehts"},
	}
}


OnIdleGoHome
{
	WalkMode = Run, X = 36, Y = 282, Direction = random (0,7),  Range = 15,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "WeiterGehts", Seconds = 2},
		IsNpcFlagFalse {Name = "GehHeim"},
	},
	HomeActions = 
	{	
		SetNpcFlagTrue {Name = "GehHeim"},
	}
}

OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 2,
	Conditions =
	{
		IsNpcFlagTrue {Name = "GehHeim"},
	}
}

EndDefinition()

end
