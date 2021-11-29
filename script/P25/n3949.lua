function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)
SpawnOnlyWhen
{
	X = XSpawnCoordinateBlades, Y = YSpawnCoordinateBlades,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "FillCaynyonAttackTimer", Seconds = caynyonFillerRespawn1},
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
		IsGlobalTimeElapsed {Name = "CaynyonAttackTimer", Seconds = caynyonAttack1},
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

----!EDS ONIDLEGOHOME BEGIN
--OnIdleGoHome
--{
--	WalkMode = Walk, X = _X, Y = _Y, 
--	Direction = 7,
--	Conditions =
--	{
--		IsNpcFlagFalse {Name = "RoamOn"},
--		IsNpcFlagFalse {Name = "RoamOn1"},
--		IsNpcFlagFalse {Name = "RoamOn2"},
--	},
--	HomeActions =
--	{
--		SetGlobalTimeStamp {Name = "CaynyonAttackTimer"},
--	}
--	
--}
----!EDS ONIDLEGOHOME END
--Respawn
--{
--	WaitTime = 120, X = 222, Y = 160,
--	Conditions = 
--	{
--		BuildingInRange {X = 219, Y = 159, Owner = OwnerNpc},
--	},
--	Actions =
--	{
--		SetNpcFlagFalse {Name = "RoamOn"},
--		SetNpcFlagFalse {Name = "RoamOn1"},
--		SetNpcFlagFalse {Name = "RoamOn2"},
--		SetGlobalTimeStamp {Name = "CaynyonAttackTimer"},
--	}
--}
--
--OnIdleGoHome
--{
--	X = 358, Y = 464, Direction = random (0,7),
--	WalkMode = Run,
--	Conditions =
--	{
--		IsGlobalTimeElapsed {Name = "CaynyonAttackTimer", Seconds = 24},
--		IsNpcFlagFalse {Name = "RoamOn"}, 
--		IsNpcFlagFalse {Name = "RoamOn1"},
--		IsNpcFlagFalse {Name = "RoamOn2"},
--	},
--	HomeActions =
--	{
--		SetNpcFlagTrue {Name = "RoamOn"},
--		SetGlobalTimeStamp {Name = "CaynyonAttackTimer"},
--	}
--}
--
--OnIdleGoHome
--{
--	X = 252, Y = 478, Direction = random (0,7),
--	WalkMode = Run,
--	Conditions =
--	{
--		IsNpcFlagTrue {Name = "RoamOn"},
--	},
--	HomeActions =
--	{
--		SetNpcFlagTrue {Name = "RoamOn1"},
--		SetNpcFlagFalse {Name = "RoamOn"},
--	}
--}
--
--OnIdleGoHome
--{
--	X = 474, Y = 381, Direction = random (0,7),
--	WalkMode = Run,
--	Conditions =
--	{
--		IsNpcFlagTrue {Name = "RoamOn1"},
--	},
--	HomeActions =
--	{
--		SetNpcFlagTrue {Name = "RoamOn2"},
--		SetNpcFlagFalse {Name = "RoamOn1"},
--	}
--}
--
--OnIdleGoHome
--{
--	X = 148, Y = 395, Direction = random (0,7),
--	WalkMode = Run,
--	Conditions =
--	{
--		IsNpcFlagTrue {Name = "RoamOn2"},
--	},
--	HomeActions =
--	{
--		SetNpcFlagFalse {Name = "RoamOn2"},
--	}
--}
EndDefinition()

end
