
-- erst spawnen wenn die letzten flüchtlinge aus dem portal sind
SpawnOnlyWhen
{
	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "EnoughFoodForDraconArmySpawning"},
	},
	Actions = 
	{
		Follow {Target = 5379},
	},
}

Respawn 
{
	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE, WaitTime = 60,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "EnoughFoodForDraconArmySpawning"},
		FigureAlive {NpcId = 5379},
	},
	Actions =
	{
		Follow {Target = 5379},
	}
}
OnOneTimeEvent 
{
	Conditions =
	{
		FigureAlive {NpcId = 7664},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "P104_DraconsAlleingang"},
		StopFollow {Target = 5379},
	}
}

-- Wenn Dracon Angriff auf den Spieler beginnt  geht die Leibgarde zum Portal und despawnt
OnIdleGoHome
{
	X = PortalX, Y = PortalY, Direction = NorthWest, WalkMode = Run, Range = 2,
	Conditions =
	{	
		IsGlobalFlagTrue {Name = "P104_DraconsAlleingang"},
	},
	HomeActions =
	{
		SetNpcFlagTrue {Name = "FigurDespawn"},
	}
}

Despawn
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "FigurDespawn"},
	},
}

--Respawn 
--{
--	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE, WaitTime = 60,
--	Conditions = 
--	{ 
--		IsGlobalFlagTrue {Name = "EnoughFoodForDraconArmySpawning"},
--		FigureAlive {NpcId = 7664},
--	},
--	Actions =
--	{
--		Follow {Target = 7664},
--	}
--}
--
--OnOneTimeEvent
--{
--	Conditions =
--	{
--		FigureAlive {NpcId = 7664}
--	},
--	Actions =
--	{
--		StopFollow {Target = 5379},
--		Follow {Target = 7664},
--	}
--}

