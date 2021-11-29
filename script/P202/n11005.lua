--Wachgeist neutral + freezed (unit id  = )
--Wachgeist schwer (UnitId = 2658)
--Wachgeist leicht (UnitId = 2659)

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}


--am Anfang freezed

OnOneTimeEvent
{
	Conditions = {},
	Actions = 
	{ 
		ChangeRace {Race = 152, NpcId = self},
		SetFreezeFlagTrue {}
	}
}

--nach OpferManipulation:

--wenn Opfer getötet wurde
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P202OpferTot", UpdateInterval = 20},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_P202WachgeistVerwandelt"},
		SetEffect {Effect = "OccludeBlack", Length = 2000, TargetType = Figure, NpcId = self},
		ChangeUnit {Unit = 2659, NpcId = self, ChangeLevel = FALSE}, --Wachgeist leicht 
		ChangeRace {NpcId = self, Race = 118},
		SetFreezeFlagFalse {}
	}
}


--wenn Opfer befreit wurde
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P202OpferBefreit", UpdateInterval = 10},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_P202WachgeistVerwandelt"},
		SetEffect {Effect = "OccludeBlack", Length = 2000, TargetType = Figure, NpcId = self},
		ChangeUnit {Unit = 2658, NpcId = self, ChangeLevel = FALSE}, --Wachgeist schwer
		ChangeRace {NpcId = self, Race = 118},
		SetFreezeFlagFalse {}
	}
}




EndDefinition()

end
