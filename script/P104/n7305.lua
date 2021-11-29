function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- soviel zeit in sekunden verstreicht zwischen dem erscheinen von 2 flüchtlingsgruppen
FugitiveGroupSpawnDelay = 6


-- zum beschleunigten testen auf Run stellen, sonst Walk:
FugitivesWalkMode = Walk

SpawnOnlyWhen
{
	X = FugeePortalX, Y = FugeePortalY, NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "FirstFugitiveGroupComingThroughPortal"},
	},
	Actions = 
	{
	},
}

-- zum flüchtlingscamp in den sümpfen
OnIdleGoHome
{
	X = Punkt1X, Y = Punkt1Y, Direction = West, Range = 4, WalkMode = FugitivesWalkMode,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "FugitivesMovingToPosition1"},
		IsNpcFlagFalse {Name = "FirstOneTimer"},
	},
	HomeActions = 
	{
		SetGlobalTimeStamp {Name = "SumpfwartenWeiterGehen"},
		SetNpcFlagTrue {Name = "FirstOneTimer"},
	},
}

-- zum flüchtlingscamp in den sümpfen
OnIdleGoHome
{
	X = Flucht1X, Y = Flucht1Y, Direction = West, Range = 4, WalkMode = FugitivesWalkMode,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "SumpfwartenWeiterGehen", Seconds = 30},
		IsGlobalFlagFalse {Name = "OneTimer"},
	},
	HomeActions = 
	{
		SetGlobalFlagTrue {Name = "OneTimer"},
	},
}
-- nun gehen die Flüchtlinge zum Tor
OnIdleGoHome
{
	X = Flucht2X, Y = Flucht2Y, Direction = random(0,7), Range = 4, WalkMode = FugitivesWalkMode,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "FugitivesMovingToPosition2"},
	},
	HomeActions = 
	{
		SetGlobalFlagTrue{Name = "FugitivesReachedPosition2"},	-- einmal für die Angriffe
	},
}

-- nun gehen die Flüchtlinge durch das Tor zum Pass
OnIdleGoHome
{
	X = Flucht2Xend, Y = Flucht2Yend, Direction = random(0,7), Range = 4, WalkMode = FugitivesWalkMode,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "FugitivesReachedPosition2"},
		--IsGlobalFlagTrue{Name = "FugitivesReachedPosition2a"},
		IsGlobalTimeElapsed {Name = "FugitivesGate1", Seconds = 20},
	}
}

-- nun gehen die flüchtlinge vors tor zur garnison (2. lager)
OnIdleGoHome
{
	X = Flucht3X, Y = Flucht3Y, Direction = West, Range = 4, WalkMode = FugitivesWalkMode,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "FugitivesMovingToPosition3"},
	},
	HomeActions =
	{
		SetGlobalFlagTrue	{Name = "FugitivesReachedPosition3"},
	}
	
}
-- nun gehen die flüchtlinge in die garnison
OnIdleGoHome
{
	X = Flucht4X, Y = Flucht4Y, Direction = random(0,7), Range = 4, WalkMode = FugitivesWalkMode,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "FugitivesMovingToPosition4"},
		IsGlobalFlagTrue {Name = "TorAufLeaLos"},
	},
	HomeActions =
	{
		SetGlobalFlagTrue{Name = "FugitivesReachedPosition4"},
	}
}
-- nun gehen die flüchtlinge zum ausgangsportal
OnIdleGoHome
{
	X = Flucht5X, Y = Flucht5Y, Direction = South, WalkMode = FugitivesWalkMode,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "FugitivesMovingToPosition5"},
	},
	HomeActions = 
	{
		SetEffect{NpcId = NpcId, Effect = "SimpleInvis", Length = 3333},
		SetNpcFlagTrue{Name = "DespawnMeNow"},
	},
}

-- despawning eines anführers beim endportal richtung vIce City
Despawn
{
	Conditions = 
	{
		IsNpcFlagTrue{Name = "DespawnMeNow"},
	}
}

EndDefinition()

end
