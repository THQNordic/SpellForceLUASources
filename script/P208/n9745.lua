function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate {}

SpawnOnlyWhen
{
	X = g_P208_GraeberNordostenX, Y = g_P208_GraeberNordostenY,
	NoSpawnEffect = FALSE,
	Conditions =
	{
		-- Wenn der gegenpart am Fleisch ist wird gespant
		IsGlobalFlagTrue {Name = "g_GoblinDreiGruppeVierTot"},
		
	},
}

Respawn
{
	X = g_P208_GraeberNordostenX, Y = g_P208_GraeberNordostenY, WaitTime = 1,
	NoSpawnEffect = FALSE,
	Conditions =
	{
		-- Wenn der gegenpart am Fleisch ist wird gespant
		IsGlobalFlagTrue {Name = "g_GoblinDreiGruppeVierTot", UpdateInterval = 5},
	},
}

-- Lauf Gobbo lauf
OnIdleGoHome
{	
	X = g_P208_GraeberNordostenX, Y = g_P208_GraeberNordostenY, WalkMode = Run,
	Direction = South,
	Conditions =
	{
		IsNpcCounter {Name = "n_P208_GoblinWP",  Value = 0},
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "n_P208_GoblinWP"},
	}
}

OnIdleGoHome
{	
	X = g_P208_DorfDreiX, Y = g_P208_DorfDreiY, WalkMode = Run,
	Direction = South,
	Conditions =
	{
		IsNpcCounter {Name = "n_P208_GoblinWP",  Value = 1},
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "n_P208_GoblinWP"},
	}
}

OnIdleGoHome
{	
	X = g_P208_GraeberNordenX, Y = g_P208_GraeberNordenY, WalkMode = Run,
	Direction = South,
	Conditions =
	{
		IsNpcCounter {Name = "n_P208_GoblinWP",  Value = 2},
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "n_P208_GoblinWP"},
	}
}

OnIdleGoHome
{	
	X = g_P208_MonumentX, Y = g_P208_MonumentY, WalkMode = Run,
	Direction = South,
	Conditions =
	{
		IsNpcCounter {Name = "n_P208_GoblinWP",  Value = 3, Operator = IsGreaterOrEqual},
	},
	HomeActions =
	{
		ResetNpcCounter {Name = "n_P208_GoblinWP"},
	}
}


-- Wenn es Tag ist verschwindet die Böse Form
Despawn
{
	Conditions =
	{
		TimeDay {},
	},
	Actions = 
	{
		SetGlobalFlagFalse {Name = "g_GoblinDreiGruppeVierTot"}
	}
}

OnDeath
{
	Actions =
	{
		SetGlobalFlagFalse {Name = "g_GoblinDreiGruppeVierTot"}, 
	}
}
EndDefinition()

end
