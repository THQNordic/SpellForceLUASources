function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
-- Init
KillOnDominate {}
--
Respawn
{
	X = g_P208_DorfDreiX, Y = g_P208_DorfDreiY,
	WaitTime = 20,
	Conditions  =
	{
		-- Die dreigruppe ist tot
		-- Es ist Tagsüber
		-- Nur wenn sein Lager nicht zerstört ist respawnt er
		TimeDay{},
		IsGlobalFlagFalse {Name = "g_P208_CampDreiKaputt"},
		IsGlobalFlagFalse {Name = "g_P208_GoblinDreiEinerLebtNoch"},
	}
}

-- Nur wenn keiner der vermehrten mehr auf der Map ist geht es zum Wasser
-- Ist der Gobbo am Wasser angekommen, wird er vermehrt
-- Evtl sollte der Zyklus erst losgehen, wenn der Spieler den Teil der KArte freigespielt hat
OnIdleGoHome
{	
	X = g_P208_TeichDreiX, Y = g_P208_TeichDreiY, WalkMode = Run,
	Direction = South,
	Conditions =
	{
		FigureDead {NpcId = 9733},
		FigureDead {NpcId = 9734},
		FigureDead {NpcId = 9735},
	},
	HomeActions =
	{
		SetGlobalFlagTrue {Name = "g_P208_GoblinDreiAmWasser"},
	}
}

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P208_GoblinDreiAmWasser"},
	}
}

EndDefinition()

end
