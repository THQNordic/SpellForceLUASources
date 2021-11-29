function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
-- Wasser Goblin

KillOnDominate {}

SpawnOnlyWhen
{
	X = g_P208_AmTeichVierX, Y = g_P208_AmTeichVierY,
	NoSpawnEffect = FALSE,
	Conditions =
	{
		-- Wenn der Initiator ans Wasser gekommen ist werden die drei Jungs gespawnt
		IsGlobalFlagTrue {Name = "g_P208_GoblinVierAmWasser", UpdateInterval = 2},
		TimeDay{},
	},
}


-- Nachts laufen die Burschen zu den Leiche und fressen Fleisch zur Verwandlung
OnIdleGoHome
{	
	X = g_P208_GraeberNordostenX, Y = g_P208_GraeberNordostenY, WalkMode = Run,
	Direction = South,
	Conditions =
	{
		TimeNight {},
	},
	HomeActions =
	{
		SetGlobalFlagTrue {Name = "g_GoblinEinsGruppeVierTot"},
	}
}

-- Tagsüber laufen die Jungs ein wenig über die Karte, dafür gibts jetzt mal ein paar Idle go Homes
OnIdleGoHome
{	
	X = g_P208_DorfFuenfX, Y = g_P208_DorfFuenfY, WalkMode = Run,
	Direction = South,
	Conditions =
	{
		TimeDay {},
		IsNpcCounter {Name = "n_P208_GoblinWP",  Value = 0},
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "n_P208_GoblinWP"},
	}
}

OnIdleGoHome
{	
	X = g_P208_TeichZweiX, Y = g_P208_TeichZweiY, WalkMode = Run,
	Direction = South,
	Conditions =
	{
		TimeDay {},
		IsNpcCounter {Name = "n_P208_GoblinWP",  Value = 1},
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "n_P208_GoblinWP"},
	}
}

OnIdleGoHome
{	
	X = g_P208_GrabWestenX, Y = g_P208_GrabWestenY, WalkMode = Run,
	Direction = South,
	Conditions =
	{
		TimeDay {},
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
		TimeDay {},
		IsNpcCounter {Name = "n_P208_GoblinWP",  Value = 3, Operator = IsGreaterOrEqual},
	},
	HomeActions =
	{
		ResetNpcCounter {Name = "n_P208_GoblinWP"},
	}
}

Respawn
{
	WaitTime = 1,
	X = g_P208_TeichEinsX, Y = g_P208_TeichEinsY,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "g_GoblinEinsGruppeVierTot"},
		IsGlobalFlagTrue {Name = "g_P208_GoblinVierAmWasser"},
	},
	
}

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_GoblinEinsGruppeVierTot"},
	},
	
}

EndDefinition()

end
