function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Run, X = _X, Y = _Y, 
	Direction = 1
}

OnIdleGoHome
{
	WalkMode = Run, X = 461, Y = 147, 
	Direction = 1,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "FarlornBriarGateOpen"},
	},
	HomeActions =
	{
		SetNpcFlagTrue {Name = "Verschwindibus"},
	}
}

Despawn
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "Verschwindibus"},
	}
}

Respawn
{
	X = 79, Y = 336, WaitTime = 5,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "FarlornBriarGateOpen"},
	},
}
--!EDS ONIDLEGOHOME END

EndDefinition()

end
