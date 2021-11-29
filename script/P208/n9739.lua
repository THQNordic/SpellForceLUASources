function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
-- Init
KillOnDominate {}
--
Respawn
{
	X = g_P208_DorfVierX, Y = g_P208_DorfVierY,
	WaitTime = 20,
	Conditions  =
	{
		-- Die dreigruppe ist tot
		-- Es ist Tagsüber
		-- Nur wenn sein Lager nicht zerstört ist respawnt er
		TimeDay{},
		IsGlobalFlagFalse {Name = "g_P208_CampVierKaputt"},
		IsGlobalFlagFalse {Name = "g_P208_GoblinVierEinerLebtNoch"},
	}
}

-- Nur wenn keiner der vermehrten mehr auf der Map ist geht es zum Wasser
-- Ist der Gobbo am Wasser angekommen, wird er vermehrt
-- Evtl sollte der Zyklus erst losgehen, wenn der Spieler den Teil der KArte freigespielt hat
OnIdleGoHome
{	
	X = g_P208_TeichVierX, Y = g_P208_TeichVierY, WalkMode = Run,
	Direction = South,
	Conditions =
	{
		FigureDead {NpcId = 9740},
		FigureDead {NpcId = 9741},
		FigureDead {NpcId = 9742},
	},
	HomeActions =
	{
		SetGlobalFlagTrue {Name = "g_P208_GoblinVierAmWasser"},
	}
}

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P208_GoblinVierAmWasser"},
	}
}

EndDefinition()

end
