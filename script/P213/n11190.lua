function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 442, Y = 227,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_BelialErscheint"}
	}, 
	Actions =
	{
		SetGlobalTimeStamp {Name = "gt_P213_BelialCastTimer"},
	}
}


--OnPlatformOneTimeEvent
--{
--	Actions =
--	{
--		HoldPosition {},
--	}
--}

-- Wenn der Spieler in der Nähe ist wird ein Area Pain alle 40 sec gecastet
-- Verschiedene Gebiete, damit es nicht ganz so eintönig und vorhersehbar ist
SektorEinsX = 456
SektorEinsY = 234
SektorZweiX = 432 
SektorZweiY = 234
SektorDreiX = 431
SektorDreiY = 222
SektorVierX = 454
SektorVierY = 222
SektorFuenfX = 443
SektorFuenfY = 210

OnEvent
{
	Conditions =
	{
		FigureInRange {NpcId = Avatar, X = SektorEinsX, Y = SektorEinsY, Range = 7},
		IsGlobalTimeElapsed {Name = "gt_P213_BelialCastTimer", Seconds = 40, UpdateInterval = 2}
	},
	Actions =
	{
		SetGlobalTimeStamp {Name = "gt_P213_BelialCastTimer"},
		CastSpell {Spell = 2510, Target = 0, TargetType = World, X = SektorEinsX, Y = SektorEinsY},
	}
}

OnEvent
{
	Conditions =
	{
		FigureInRange {NpcId = Avatar, X = SektorZweiX, Y = SektorZweiY, Range = 7},
		IsGlobalTimeElapsed {Name = "gt_P213_BelialCastTimer", Seconds = 40, UpdateInterval = 2}
	},
	Actions =
	{
		SetGlobalTimeStamp {Name = "gt_P213_BelialCastTimer"},
		CastSpell {Spell = 2510, Target = 0, TargetType = World, X = SektorZweiX, Y = SektorZweiY},
	}
}

OnEvent
{
	Conditions =
	{
		FigureInRange {NpcId = Avatar, X = SektorDreiX, Y = SektorDreiY, Range = 7},
		IsGlobalTimeElapsed {Name = "gt_P213_BelialCastTimer", Seconds = 40, UpdateInterval = 2}
	},
	Actions =
	{
		SetGlobalTimeStamp {Name = "gt_P213_BelialCastTimer"},
		CastSpell {Spell = 2510, Target = 0, TargetType = World, X = SektorDreiX, Y = SektorDreiY},
	}
}

OnEvent
{
	Conditions =
	{
		FigureInRange {NpcId = Avatar, X = SektorVierX, Y = SektorVierY, Range = 7},
		IsGlobalTimeElapsed {Name = "gt_P213_BelialCastTimer", Seconds = 40, UpdateInterval = 2}
	},
	Actions =
	{
		SetGlobalTimeStamp {Name = "gt_P213_BelialCastTimer"},
		CastSpell {Spell = 2510, Target = 0, TargetType = World, X = SektorVierX, Y = SektorVierY},
	}
}

OnEvent
{
	Conditions =
	{
		FigureInRange {NpcId = Avatar, X = SektorVierX, Y = SektorVierY, Range = 7},
		IsGlobalTimeElapsed {Name = "gt_P213_BelialCastTimer", Seconds = 40, UpdateInterval = 2}
	},
	Actions =
	{
		SetGlobalTimeStamp {Name = "gt_P213_BelialCastTimer"},
		CastSpell {Spell = 2510, Target = 0, TargetType = World, X = SektorVierX, Y = SektorVierY},
	}
}

-- Für die Cutscene umspawnen
Umspawn
{
	X = 442, Y = 237,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "UmspawnExtroBone", UpdateInterval = 2},
	},
	Actions =
	{
		SetEffect {Effect = "OccludeBlack", TargetType = World, X = 442, Y = 237, Length = 2000},
		LookAtDirection {Direction = East},
	}
}

Respawn
{
	X = 442, Y = 237,
	WaitTime = 1,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "UmspawnExtroBone", UpdateInterval = 2},
		IsGlobalFlagFalse {Name = "g_P213_BelialNachHause", UpdateInterval = 2},
	},
	Actions =
	{
		SetEffect {Effect = "OccludeBlack", TargetType = World, X = 442, Y = 237, Length = 2000},
		LookAtDirection {Direction = East},
	}
	
}

OnOneTimeEvent
{
	UpdateInterval = 2,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_BelialNachHause", UpdateInterval = 2}
	},
	Actions =
	{
		SetEffect {Effect ="OccludeBlack", TargetType = Figure, X = 0, Y = 0, Length = 2000},
		--SetGlobalFlagTrue {Name = "g_P213_HokanWiederDa"},
		SetGlobalFlagTrue {Name = "g_P213_BelialTot"},
	}
}

Despawn 
{
	PlayDeathAnim = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_BelialTot", UpdateInterval = 2}
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_P213_HokanWiederDa"},
	}
}
EndDefinition()

end
