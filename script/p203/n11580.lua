function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
-- Gesindel Order of Dawn

-- Nur für Phoenixstein spawnen
SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
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

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P203_WieDieFliegen", UpdateInterval = 2},
	},
	Actions =
	{
		Kill {},
	}
}

EndDefinition()

end
