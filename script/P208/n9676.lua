function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate {}
--
Respawn
{
	X = _X, Y = _Y,
	WaitTime = 20,
	Conditions  =
	{
		-- Die dreigruppe ist tot
		-- Es ist Tagsüber
		-- Nur wenn sein Lager nicht zerstört ist respawnt er
		TimeDay{},
		IsGlobalFlagFalse {Name = "g_P208_CampEinsKaputt"},
		IsGlobalFlagFalse {Name = "g_P208_GoblinEinsEinerLebtNoch"},
	}
}

-- Nur wenn keiner der vermehrten mehr auf der Map ist geht es zum Wasser
-- Ist der Gobbo am Wasser angekommen, wird er vermehrt
OnIdleGoHome
{	
	X = g_P208_TeichEinsX, Y = g_P208_TeichEinsY, WalkMode = Run,
	Direction = South,
	Conditions =
	{
		FigureDead {NpcId = 9680},
		FigureDead {NpcId = 9681},
		FigureDead {NpcId = 9682},
		--IsGlobalFlagTrue {Name = "E"},
	},
	HomeActions =
	{
		SetGlobalFlagTrue {Name = "g_P208_GoblinEinsAmWasser"},
	}
}

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P208_GoblinEinsAmWasser"},
	}
}



EndDefinition()

end
