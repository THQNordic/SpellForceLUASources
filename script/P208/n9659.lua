function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P208_SchnitterSpawnen"},
	},
	-- Timestamp setzen, damit man das rumalufen über einen Timer notfalls wieder in den Takt bringen kann,
	-- wenn die Homaactions mal wieder nicht ausgeführt werden
	Actions = 
	{
		SetEffect{Effect = "AreaHit", X = _X, Y = _Y, Length = 3000},
		SetEffect{Effect = "Fog", X = _X, Y = _Y, Length = 3000},
		SetNpcTimeStamp {Name = "gt_P208_SurtNotbremse"},
		Outcry {Tag = "oca2surtP208_001", NpcId = 9659, String = "Ah, du stellst dich dem Fluch! Dann musst du dich auch mir stellen!", Color = ColorWhite}, 
	},
}

-- Surt laeuft ein wenig über die Karte und raeumt auf
OnIdleGoHome
{
	X = 259, Y = 60,
	WalkMode = Run,
	Direction = South,
	Conditions =
	{
		IsNpcCounter {Name = "gc_P208_SurtRumlaufen", Value = 0},
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "gc_P208_SurtRumlaufen"}
	}
}

OnIdleGoHome
{
	X = 144, Y = 241,
	WalkMode = Run,
	Direction = South,
	Conditions =
	{
		IsNpcCounter {Name = "gc_P208_SurtRumlaufen", Value = 1},
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "gc_P208_SurtRumlaufen"}
	}
}

OnIdleGoHome
{
	X = 167, Y = 32,
	WalkMode = Run,
	Direction = South,
	Conditions =
	{
		IsNpcCounter {Name = "gc_P208_SurtRumlaufen", Value = 2},
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "gc_P208_SurtRumlaufen"}
	}
}

OnIdleGoHome
{
	X = 199, Y = 200,
	WalkMode = Run,
	Direction = South,
	Conditions =
	{
		IsNpcCounter {Name = "gc_P208_SurtRumlaufen", Value = 3},
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "gc_P208_SurtRumlaufen"}
	}
}

OnIdleGoHome
{
	X = 59, Y = 65,
	WalkMode = Run,
	Direction = South,
	Conditions =
	{
		ODER9
		{
			IsNpcCounter {Name = "gc_P208_SurtRumlaufen", Value = 4, Operator = IsGreaterOrEqual},
			IsNpcTimeElapsed {Name = "", Seconds = 300}
		}
	},
	Actions =
	{
		IncreaseNpcCounter {Name = "gc_P208_SurtRumlaufen", Step = 6},
	},
	HomeActions =
	{
		ResetNpcCounter {Name = "gc_P208_SurtRumlaufen"},
		SetNpcTimeStamp {Name = "gt_P208_SurtNotbremse"},
	}
}

OnDeath
{
	Actions =
	{
		QuestSolve {QuestId = 855},
		QuestSolve {QuestId = 862},
	}
}


EndDefinition()

end
