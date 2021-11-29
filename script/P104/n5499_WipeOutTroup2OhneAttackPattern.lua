--Das machen alle der Boss hat noch sein Attacklpattern

Trupp1 = 5499 
OnIdleEvent
	{
		Conditions = 
		{
			FigureAlive {NpcId = Trupp2},
			IsNpcFlagFalse {Name = "FollowModeAlreadySet"},
		},
		Actions = 
		{ 
			Follow{Target = Trupp2} ,
			SetNpcFlagTrue{Name = "FollowModeAlreadySet"},
		}, 
	}

	-- nur wenn es einen Boss gibt in Follow gehen
SpawnOnlyWhen
{
	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE,
	Conditions = 
	{ 
		FigureAlive{NpcId = Trupp2},
	},
	Actions =
	{
		Follow {Target = Trupp2},
	}
}	
	
    

-- respawnen I

Respawn
{
	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE, WaitTime = 60,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "FugitivesMovingToPosition2"},
		IsGlobalFlagFalse {Name = "NewSpawn"},
		FigureAlive {NpcId = Trupp2},
		IsNpcFlagFalse {Name = "NoMoreRespawn"},
	},
	DeathActions = 
	{
	
		SetNpcFlagFalse{Name = "FollowModeAlreadySet"},
	}
}

Respawn
{
	X = SecondSpawnX, Y = SecondSpawnY, NoSpawnEffect = TRUE, WaitTime = 60,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "NewSpawn"},
		FigureAlive {NpcId = Trupp2},
		IsNpcFlagFalse {Name = "NoMoreRespawn"},
	},
}

-- wenn der anführer tot ist, bricht panik aus!
-- alle stürzen sich auf den spieler weil ihnen die "strategie" fehlt...

OnIdleGoHome
{
	X = PortalX, Y = PortalY, Direction = NorthWest, WalkMode = Run, Range = 5,
	Conditions = 
	{
		FigureDead{NpcId = Trupp2},
		IsGlobalFlagFalse {Name = "NewSpawn"},
	},
	Actions = 
	{
		StopFollow{Target = Trupp2},
	}
}

-- Wenn das OrkCamp eingenommen wurde wissen die Elfen wo sie hinsollen, nämlich zum Monument
OnIdleGoHome
{
	X = AttackOrkMonumentX, Y = AttackOrkMonumentY, Direction = NorthWest, WalkMode = Run, Range = 5,
	Conditions = 
	{
		FigureDead{NpcId = Trupp2},
		IsGlobalFlagTrue {Name = "NewSpawn"},
	},
	Actions = 
	{
		StopFollow{Target = Trupp2},
	}
}


-- Wenn der Angriff auf die Festung losgeht gehen die Wipe outer zum Portal und despawnen
OnIdleGoHome
{
	X = PortalX, Y = PortalY, Direction = NorthWest, WalkMode = Run, Range = 2,
	Conditions =
	{	
		IsGlobalFlagFalse {Name = "APW04"},
		IsGlobalFlagTrue {Name = "Last1"},
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
	Actions =
	{
		SetNpcFlagTrue {Name = "NoMoreRespawn"},
	}
}