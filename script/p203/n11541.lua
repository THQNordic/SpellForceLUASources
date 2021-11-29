function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
-- Maskenmann
-- In den Kapf spawnen zum casten
Umspawn
{
	X = 479, Y = 406,
	NoSpawnEffect = FALSE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P203_HokanZumKampf", UpdateInterval = 2},
	}
}

-- Zu Gabar spawnen zum Töten
Umspawn
{
	X = 463, Y = 403,
	NoSpawnEffect = FALSE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P203_HokanZuGabar", UpdateInterval = 2},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P203_RohenNachHause", UpdateInterval = 2},
	},
	Actions =
	{
		SetEffect {Effect = "DeMaterialize", NpcId = self, Length = 3200},
		SetNpcFlagTrue {Name = "n_P203_Verschwindibus"},
	}
}

Despawn
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "n_P203_Verschwindibus", UpdateInterval = 10},
	}
}

EndDefinition()

end
