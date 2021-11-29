function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
-- Waldgeistarmee

-- Nur für Schattenklinge spawnen
SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},
	},
	Actions =
	{
		ChangeRace {Race = 148},
	}
}

OnIdleGoHome
{
	X = _X+37, Y = _Y,
	WalkMode = Walk,
	Direction = East,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P203_HokanCutscene", UpdateInterval = 2},
	},
}

OnIdleGoHome
{
	X = _X+44, Y = _Y-10,
	WalkMode = Walk,
	Direction = East,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P203_HokanCutscene", UpdateInterval = 2},
		FigureInRange {X = _X+9, Y = _Y-9, Range = 0},
	},
}
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P203_WieDieFliegen", UpdateInterval = 2},
	},
	Actions =
	{
		ChangeEquipment {Slot = 2, Item = 3106},
		SetEffect {Effect = "BuildingFire", Length = 250, TargetType = Figure},
		SetNpcTimeStamp {Name = "n_P203_Stirb"},
		Goto {X = 473, Y = 404, WalkMode = Run, GotoMode = GotoForced}
	}
}

OnOneTimeEvent
{
	UpdateInterval = 2,
	Conditions =
	{
		IsNpcTimeElapsed {Name = "n_P203_Stirb", Seconds = 7, UpdateInterval = 2},
	},
	Actions =
	{
		Kill {},
	}
}

EndDefinition()

end
