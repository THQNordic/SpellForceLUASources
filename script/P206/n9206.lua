function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- Gehilfen für zum Killen tuen von den Palastwächtern



-- Wenn es die Zeit erfordert folgen die Gesellen ihrem Chef
-- Nach der Cutscene geht es wieder zum Lager, damit die Einheit nicht so doof in der Landschaft rum seht
OnIdleGoHome
{
	X = 244, Y = 457,
	WalkMode = Walk,
	Direction = South,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_IntroGelaufen"},
		IsGlobalFlagFalse { Name = "g_P206_KarawaneLos"},
		IsGlobalFlagFalse { Name = "g_P206_KarawaneLosOhneDeal"}
	}
}

-- Vorm Tor bleibt die Karawane erst mal stehen bis es auf ist
OnIdleGoHome
{
	X = 256, Y = 206,
	WalkMode = Walk, Direction = South,
	Conditions =
	{
		IsNpcCounter {Name = "c_P206_KarawanenWegpunktzaehler", Value = 0, Operator = IsEqual},
		ODER9
		{
			IsGlobalFlagTrue { Name = "g_P206_KarawaneLos"},
			IsGlobalFlagTrue { Name = "g_P206_KarawaneLosOhneDeal"}
		}
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "P206_AmTor"},
	},
	HomeActions =
	{
		ChangeRace {Race = 4},
	}
}
-- Idle go home kann mehrfach ausgeführt werden, deshalb Zählen auslagern
OnOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "P206_AmTor"},
	},
	Actions =
	{
		IncreaseNpcCounter {Name = "c_P206_KarawanenWegpunktzaehler"}
	}
}

--Zur Oase
OnIdleGoHome
{
	X = 167, Y = 141,
	WalkMode = Walk, Direction = South,
	Conditions =
	{
		IsNpcCounter {Name = "c_P206_KarawanenWegpunktzaehler", Value = 1, Operator = IsEqual},
		IsGlobalFlagTrue {Name = "g_P206_TorAuf"}
	},
	HomeActions =
	{
	}
}

EndDefinition()

end
