-->Roter Goblin Renner

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
		SetGlobalFlagTrue {Name = "g_sP200GoblinRotRennAufstellung"},
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
		Goto { X = 155, Y = 117, NpcId = self, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},
	}
}
--Start
OnIdleGoHome
{
X = 156,
Y = 133,
Direction = North,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200CutszeneRennenStart", UpdateInterval = 10},
		IsNpcCounter {Name = "npc_sP200RoterGoblinCounter", Value = 0, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200RoterGoblinCounter"},
		
	},

}

--Ostgerade
OnIdleGoHome
{
X = 156,
Y = 157,
Direction = North,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 156, Y = 133, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200RoterGoblinCounter", Value = 1, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		
		IncreaseNpcCounter {Name = "npc_sP200RoterGoblinCounter"},
	},

}

--Erste Kurve
OnIdleGoHome
{
X = 147,
Y = 165,
Direction = NorthWest,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 156, Y = 157, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200RoterGoblinCounter", Value = 2, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		
		IncreaseNpcCounter {Name = "npc_sP200RoterGoblinCounter"},
	},

}

--Nordgerade 
OnIdleGoHome
{
X = 108,
Y = 165,
Direction = West,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 147 , Y = 165, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200RoterGoblinCounter", Value = 3, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200RoterGoblinCounter"},
		
	},

}

--Zweite Kurve 
OnIdleGoHome
{
X = 108,
Y = 142,
Direction = SouthWest,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 108, Y = 165, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200RoterGoblinCounter", Value = 4, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200RoterGoblinCounter"},
		
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
		FigureInRange { X = 108, Y = 142, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200RoterGoblinCounter", Value = 5, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200RoterGoblinCounter"},
		
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
		IsNpcCounter {Name = "npc_sP200RoterGoblinCounter", Value = 6, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200RoterGoblinCounter"},
		
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
		IsNpcCounter {Name = "npc_sP200RoterGoblinCounter", Value = 7, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200RoterGoblinCounter"},
		
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
		IsNpcCounter {Name = "npc_sP200RoterGoblinCounter", Value = 8, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200RoterGoblinCounter"},
		
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
		IsNpcCounter {Name = "npc_sP200RoterGoblinCounter", Value = 9, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200RoterGoblinCounter"},
		
	},

}

-- Vierte Kurve Ziel.
OnIdleGoHome
{
X = 155,
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
		IsNpcCounter {Name = "npc_sP200RoterGoblinCounter", Value = 10, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200RoterGoblinCounter"},
		
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
