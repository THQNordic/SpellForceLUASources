function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{

	WalkMode = Run, X = _X, Y = _Y, Direction = 6,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "SpielerAmTor"},
		IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"},
	}	
}


OnIdleGoHome
{

	WalkMode = Run, X = 290, Y = 219, Direction = 6,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "SpielerAmTor"},
		IsGlobalFlagFalse {Name = "P109_DunkelElfenTorZerstört"},
	},	
}
--!EDS ONIDLEGOHOME END


OnIdleGoHome
{

	WalkMode = Run, X = 60, Y = 98, Direction = 6,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "P109_DunkelElfenTorZerstört"},
		IsNpcFlagFalse {Name = "P109_DEIdleBlocker"}
	},	
	HomeActions =
	{
		SetNpcFlagTrue {Name = "P109_WeiterZumSpieler"},
		SetNpcFlagTrue {Name = "P109_WeiterZumSpieler"},
	}
}

OnIdleGoHome
{

	WalkMode = Run, X = 113, Y = 389, Direction = 6,
	Conditions =
	{
		IsNpcFlagTrue {Name = "P109_WeiterZumSpieler"},
	},	
	HomeActions =
	{
	}
}



Respawn
{
	X = 268, Y = 148, NoSpawnEffect = FALSE, WaitTime = 180,
	Conditions = 
	{ 
		BuildingInRange {X = 244, Y = 155, Range = 30, Owner = OwnerNpc},
	},
	Actions =
	{
	},
	DeathActions = 
	{
	
	},
}

EndDefinition()

end
