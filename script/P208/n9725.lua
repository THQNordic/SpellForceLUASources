function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
-- Init
KillOnDominate {}
--
Respawn
{
	X = g_P208_DorfZweiX, Y = g_P208_DorfZweiY,
	WaitTime = 20,
	Conditions  =
	{
		-- Die dreigruppe ist tot
		-- Es ist Tagsüber
		-- Nur wenn sein Lager nicht zerstört ist respawnt er
		TimeDay{},
		IsGlobalFlagFalse {Name = "g_P208_CampZweiKaputt"},
		IsGlobalFlagFalse {Name = "g_P208_GoblinZweiEinerLebtNoch"},
	}
}

-- Nur wenn keiner der vermehrten mehr auf der Map ist geht es zum Wasser
-- Ist der Gobbo am Wasser angekommen, wird er vermehrt
-- Evtl sollte der Zyklus erst losgehen, wenn der Spieler den Teil der KArte freigespielt hat
OnIdleGoHome
{	
	X = g_P208_TeichZweiX, Y = g_P208_TeichZweiY, WalkMode = Run,
	Direction = South,
	Conditions =
	{
		FigureDead {NpcId = 9726},
		FigureDead {NpcId = 9727},
		FigureDead {NpcId = 9728},
	},
	HomeActions =
	{
		SetGlobalFlagTrue {Name = "g_P208_GoblinZweiAmWasser"},
	}
}

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P208_GoblinZweiAmWasser"},
	}
}

EndDefinition()

end
