function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate {}

-- Wasser Goblin

SpawnOnlyWhen
{
	X = g_P208_AmTeichEinsX, Y = g_P208_AmTeichEinsY,
	NoSpawnEffect = FALSE,
	Conditions =
	{
		-- Wenn der Initiator ans Wasser gekommen ist werden die drei Jungs gespawnt
		IsGlobalFlagTrue {Name = "g_P208_GoblinEinsAmWasser", UpdateInterval = 2},
		TimeDay{},
	},
}


-- Nachts laufen die Burschen zu den Leiche und fressen Fleisch zur Verwandlung
OnIdleGoHome
{	
	X = g_P208_GraeberSuedenX, Y = g_P208_GraeberSuedenY, WalkMode = Run,
	Direction = South,
	Conditions =
	{
		TimeNight {},
	},
	HomeActions =
	{
		SetGlobalFlagTrue {Name = "g_GoblinZweiGruppeEinsTot"},
	}
}

-- Tagsüber laufen die Jungs ein wenig über die Karte, dafür gibts jetzt mal ein paar Idle go Homes
OnIdleGoHome
{	
	X = g_P208_GraeberNordostenX, Y = g_P208_GraeberNordostenY, WalkMode = Run,
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
	X = g_P208_DorfVierX, Y = g_P208_DorfVierY, WalkMode = Run,
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
	X = g_P208_GraeberNordenX, Y = g_P208_GraeberNordenY, WalkMode = Run,
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
		IsGlobalFlagFalse {Name = "g_GoblinZweiGruppeEinsTot"},
		IsGlobalFlagTrue {Name = "g_P208_GoblinEinsAmWasser"},
	},
	
}

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_GoblinZweiGruppeEinsTot"},
	},
	
}
EndDefinition()

end
