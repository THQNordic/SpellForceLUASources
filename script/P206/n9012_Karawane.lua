function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Abweichungswert erstellen, damit nicht alle auf den gleichen Punkt laufen
if NpcId == 9012 then
	xFaktor = 1
	yFaktor = 1
elseif NpcId == 9013 then
	xFaktor = 2
	yFaktor = 2
elseif NpcId == 9014 then
	xFaktor = 3
	yFaktor = 3
elseif NpcId == 9015 then
	xFaktor = 1
	yFaktor = 3
elseif NpcId == 9016 then
	xFaktor = 3
	yFaktor = 1
elseif NpcId == 9017 then
	xFaktor = 4
	yFaktor = 2
elseif NpcId == 9018 then
	xFaktor = 4
	yFaktor = 1
elseif NpcId == 9019 then
	xFaktor = 0
	yFaktor = 2
elseif NpcId == 9020 then
	xFaktor = 2
	yFaktor = 4
elseif NpcId == 9021 then
	xFaktor = 4
	yFaktor = 3
end


---- Gespawnt wird nur wenn die Karawane loszieht
--SpawnOnlyWhen
--{
--	X = g_P206_PortalX, Y = g_P206_PortalY, 
--	NoSpawnEffect = TRUE,
--	Conditions =
--	{
--		IsGlobalFlagTrue { Name = "g_P206_KarawaneLos"}
--	},
--	Actions =
--	{
--		IncreaseNpcCounter {Name = "c_P206_KarawanenWegpunktzaehler"}
--	}
--}

-- Damit die Viecher nicht schon vor der Reise umkommen sind sie in der ersten Hälfte der Map neutral zu allen
OnOneTimeEvent
{
	Conditions =
	{
	},
	Actions =
	{
		ChangeRace {Race = 152},
	}
}


-- Vorm Tor bleibt die Karawane erst mal stehen bis es auf ist
OnIdleGoHome
{
	X = 256+xFaktor, Y = 206+yFaktor,
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
		ChangeRace {Race = 4}
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

--Zum Portal
OnIdleGoHome
{
	X = 165+xFaktor, Y = 126+yFaktor,
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

OnDeath
{
	Actions = 
	{
		IncreaseGlobalCounter{Name = "g_c_P206_ToteTrolle"},
	},
}

EndDefinition()

end