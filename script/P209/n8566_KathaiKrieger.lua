function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209InnenstadtErreicht"},	
	},
	Actions =
	{
		
	}
}

Respawn
{
	WaitTime = 1,
	UnitId = self,
	X = 415,
	Y = 277,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "g_sP209KithaiBefreit"},
	},
	Actions = 
	{
		Goto {X = NpcX, Y = NpcY, NpcId = self, Range = 3, WalkMode = Run, GotoMode = GotoForced},
	},
	DeathActions = 
	{
	
	}
} 

--Sicherheitsabfrage, wenn sich der Kathaikrieger zurück zieht und Idle wird, soll er sich wieder zum Kampfplatz begeben.
OnToggleEvent
{
	OnConditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_sP209StopIdleKathai"},
		FigureJob {Job = JobIdle , NpcId = self},
	},
	OnActions = 
	{ 
		Goto {X = NpcX, Y = NpcY, NpcId = self, Range = 5, WalkMode = Run, GotoMode = GotoForced},
		
	},
	OffConditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209StopIdleKathai"},
	},
	OffActions =
	{
		
	},
}

--KathaiKrieger bewegen sich zu den Haupttoren
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209KathaiMove"},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP209StopIdleKathai"},
		Goto {X = 264, Y = 88, NpcId = 8566, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 264, Y = 88, NpcId = 8567, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 264, Y = 88, NpcId = 8568, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 270, Y = 271, NpcId = 8571, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 270, Y = 271, NpcId = 8575, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 270, Y = 271, NpcId = 8569, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 308, Y = 379, NpcId = 8572, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 308, Y = 379, NpcId = 8573, Range = 3, WalkMode = Run, GotoMode = GotoForced},
		Goto {X = 308, Y = 379, NpcId = 8574, Range = 3, WalkMode = Run, GotoMode = GotoForced},
	}
}

EndDefinition()

end
