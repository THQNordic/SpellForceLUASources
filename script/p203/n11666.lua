function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
-- Waldgeistarmee Boss

-- Nur f?r Schattenklinge spawnen
SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},
	}
}

Despawn
{
	--PlayDeathAnim = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P203_BladesSpawnen", UpdateInterval = 2}
	}
}

--
---- Nur f?r Schattenklinge spawnen
--SpawnOnlyWhen
--{
--	X = _X, Y = _Y,
--	NoSpawnEffect = TRUE,
--	Conditions =
--	{
--		IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},
--	},
--	Actions =
--	{
--		ChangeRace {Race = 148},
--	}
--}
--
--OnIdleGoHome
--{
--	X = _X+37, Y = _Y,
--	WalkMode = Run,
--	Direction = East,
--	Conditions =
--	{
--		IsGlobalFlagTrue {Name = "g_P203_HokanCutscene", UpdateInterval = 2},
--	},
--}
--
--OnIdleGoHome
--{
--	X = _X+44, Y = _Y-10,
--	WalkMode = Walk,
--	Direction = East,
--	Conditions =
--	{
--		IsGlobalFlagTrue {Name = "g_P203_HokanCutscene", UpdateInterval = 2},
--		FigureInRange {X = _X+9, Y = _Y-9, Range = 0},
--	},
--}
--
--OnOneTimeEvent
--{
--	Conditions =
--	{
--		IsGlobalFlagTrue {Name = "g_P203_WieDieFliegen", UpdateInterval = 2},
--	},
--	Actions =
--	{
--		Kill {},
--	}
--}

EndDefinition()

end
