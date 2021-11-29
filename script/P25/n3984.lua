function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

SpawnOnlyWhen
{
	X = XSpawnCoordinateBlades, Y = YSpawnCoordinateBlades,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "FillCaynyonAttackTimer", Seconds = caynyonFillerRespawn4},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "Awake"},
	}
}
OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, 
	Direction = 2,
	Conditions =
	{
		IsNpcFlagTrue {Name = "Awake"},
	},
	HomeActions =
	{
		SetNpcFlagFalse {Name = "Awake"},
	}
	
}

OnIdleGoHome
{
	WalkMode = Run, X = XAttackTarget1, Y = YAttackTarget1, 
	Direction = 2,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "CaynyonAttackTimer", Seconds = caynyonAttack4},
	},
	HomeActions =
	{
		SetNpcFlagTrue {Name = "Angriffspunkt1erreicht"},
	}
	
}

OnIdleGoHome
{
	WalkMode = Run, X = XAttackTarget2, Y = YAttackTarget2, 
	Direction = 2,
	Conditions =
	{
		IsNpcFlagTrue {Name = "Angriffspunkt1erreicht"},
	},
	HomeActions =
	{
		SetNpcFlagTrue {Name = "Angriffspunkt2erreicht"},
		SetNpcFlagFalse {Name = "Angriffspunkt1erreicht"},
	}
	
}


OnIdleGoHome
{
	WalkMode = Run, X = XAttackTarget3, Y = YAttackTarget3, 
	Direction = 2,
	Conditions =
	{
		IsNpcFlagTrue {Name = "Angriffspunkt2erreicht"},
	},
	HomeActions =
	{
		SetNpcFlagTrue {Name = "Angriffspunkt3erreicht"},
		SetNpcFlagFalse {Name = "Angriffspunkt2erreicht"},
	}
	
}

OnIdleGoHome
{
	WalkMode = Run, X = XAttackTarget4, Y = YAttackTarget4, 
	Direction = 2,
	Conditions =
	{
		IsNpcFlagTrue {Name = "Angriffspunkt3erreicht"},
	},
	HomeActions =
	{
		SetNpcFlagTrue {Name = "Angriffspunkt4erreicht"},
		SetNpcFlagFalse {Name = "Angriffspunkt3erreicht"},
	}
	
}

OnIdleGoHome
{
	WalkMode = Run, X = XAttackTarget5, Y = YAttackTarget5, 
	Direction = 2,
	Conditions =
	{
		IsNpcFlagTrue {Name = "Angriffspunkt4erreicht"},
	},
	HomeActions =
	{
		SetNpcFlagTrue {Name = "Angriffspunkt5erreicht"},
		SetNpcFlagFalse {Name = "Angriffspunkt4erreicht"},
	}
	
}

OnIdleGoHome
{
	WalkMode = Run, X = XAttackTarget6, Y = YAttackTarget6, 
	Direction = 2,
	Conditions =
	{
		IsNpcFlagTrue {Name = "Angriffspunkt5erreicht"},
	},
	HomeActions =
	{
		SetNpcFlagFalse {Name = "Angriffspunkt5erreicht"},
	}
	
}


Respawn
{
	WaitTime = SpawnWaitTime, X = XSpawnCoordinateBlades, Y = YSpawnCoordinateBlades,
	Conditions = 
	{
		BuildingInRange {X = XBuildingCoordinateBlades, Y = YBuildingCoordinateBlades, Owner = OwnerNpc},
	},
	Actions =
	{
		SetGlobalTimeStamp {Name =  "CaynyonAttackTimer"},
		SetNpcFlagTrue {Name = "Awake"},
	}
}
EndDefinition()

end
