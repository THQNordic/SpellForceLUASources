function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
-- Morton

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

Despawn
{
	--PlayDeathAnim = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P203_BladesSpawnen", UpdateInterval = 2}
	}
}

EndDefinition()

end
