-->Braune Goblin Renner

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X,
	Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200GoblinRennenStart", UpdateInterval = 10},
		
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP200GoblinBraunRennAufstellung"},
		
	}
} 

--Goblin nimmt Startposition ein.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_sP200CutszeneGoblinAufstellung", UpdateInterval = 10},
		--IsGlobalFlagTrue {Name = "g_sP200GoblinRennAufstellung", UpdateInterval = 10},
    },
	Actions =
	{
		Goto { X = 154, Y = 114, NpcId = self, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},
	}
}

--Start
OnIdleGoHome
{
X = 155,
Y = 131,
Direction = North,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200CutszeneRennenStart", UpdateInterval = 10},
		IsNpcCounter {Name = "npc_sP200BraunerGoblinCounter", Value = 0, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200BraunerGoblinCounter"},
		
	},

}
--Ostgerade
OnIdleGoHome
{
X = 155,
Y = 155,
Direction = North,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 155, Y = 131, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200BraunerGoblinCounter", Value = 1, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200BraunerGoblinCounter"},
		
	},

}

--Erste Kurve
OnIdleGoHome
{
X = 145,
Y = 164,
Direction = NorthWest,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 155, Y = 155, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200BraunerGoblinCounter", Value = 2, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200BraunerGoblinCounter"},
		
	},

}

--Nordgerade 
OnIdleGoHome
{
X = 109,
Y = 164,
Direction = West,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 145 , Y = 164, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200BraunerGoblinCounter", Value = 3, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200BraunerGoblinCounter"},
		
	},

}

--Zweite Kurve 
OnIdleGoHome
{
X = 109,
Y = 142,
Direction = SouthWest,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 109, Y = 164, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200BraunerGoblinCounter", Value = 4, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		
		IncreaseNpcCounter {Name = "npc_sP200BraunerGoblinCounter"},
	},

}

--Westgerade, alle Goblins laufen nun auf den selben Zielpunkt.
OnIdleGoHome
{
X = 113,
Y = 122,
Direction = South,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 109 , Y = 142, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200BraunerGoblinCounter", Value = 5, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200BraunerGoblinCounter"},
		
	},

}

-- Westgerade
OnIdleGoHome
{
X = 107,
Y = 117,
Direction = South,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 113, Y = 122, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200BraunerGoblinCounter", Value = 6, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200BraunerGoblinCounter"},
		
	},

}

-- Westgerade
OnIdleGoHome
{
X = 108,
Y = 98,
Direction = South,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 107, Y = 117, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200BraunerGoblinCounter", Value = 7, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200BraunerGoblinCounter"},
		
	},

}

-- Dritte Kurve
OnIdleGoHome
{
X = 129,
Y = 92,
Direction = SouthEast,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 108, Y = 98, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200BraunerGoblinCounter", Value = 8, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200BraunerGoblinCounter"},
		
	},

}

-- OstGerade
OnIdleGoHome
{
X = 150,
Y = 93,
Direction = East,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 129, Y = 92, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200BraunerGoblinCounter", Value = 9, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200BraunerGoblinCounter"},
		
	},

}

-- Vierte Kurve Ziel.
OnIdleGoHome
{
X = 154,
Y = 110,
Direction = NorthEast,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 150, Y = 93, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200BraunerGoblinCounter", Value = 10, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200BraunerGoblinCounter"},
		
	},

}

--Wenn das Rennen vorbei ist, despawnen die Goblins.
Despawn
{
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "g_tsWarteZeitDespawnGoblins", Seconds = 3, UpdateInterval = 60}, 
		IsGlobalFlagTrue {Name = "g_sP209CutszeneGoblinRennenEnded"},
	},
	Actions = 
	{
		
	}
}

EndDefinition()

end
