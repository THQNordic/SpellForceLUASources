-->Gelber Goblin Renner

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
		SetGlobalFlagTrue {Name = "g_sP200GoblinGelbRennAufstellung"},
		
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
		Goto { X = 152, Y = 108, NpcId = self, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},
	}
}

--Start
OnIdleGoHome
{
X = 153,
Y = 127,
Direction = North,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200CutszeneRennenStart", UpdateInterval = 10},
		IsNpcCounter {Name = "npc_sP200GelberGoblinCounter", Value = 0, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200GelberGoblinCounter"},	
	},

}

--Ostgerade
OnIdleGoHome
{
X = 153,
Y = 150,
Direction = North,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 153 , Y = 127, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200GelberGoblinCounter", Value = 1, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200GelberGoblinCounter"},	
		
	},

}

--Erste Kurve
OnIdleGoHome
{
X = 141,
Y = 162,
Direction = NorthWest,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 153 , Y = 150, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200GelberGoblinCounter", Value = 2, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200GelberGoblinCounter"},	
		
	},

}

--Nordgerade 
OnIdleGoHome
{
X = 111,
Y = 162,
Direction = West,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 141 , Y = 162, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200GelberGoblinCounter", Value = 3, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200GelberGoblinCounter"},	
		
	},

}

--Zweite Kurve 
OnIdleGoHome
{
X = 111,
Y = 142,
Direction = SouthWest,
Range = 3,
WalkRange = 3,
WaitTime = 0, 
WalkMode = Run , 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = 111 , Y = 162, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200GelberGoblinCounter", Value = 4, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200GelberGoblinCounter"},	
		
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
		FigureInRange { X = 111 , Y = 142, NpcId = self , Range = 3},
		IsNpcCounter {Name = "npc_sP200GelberGoblinCounter", Value = 5, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200GelberGoblinCounter"},	
		
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
		IsNpcCounter {Name = "npc_sP200GelberGoblinCounter", Value = 6, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200GelberGoblinCounter"},	
		
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
		IsNpcCounter {Name = "npc_sP200GelberGoblinCounter", Value = 7, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200GelberGoblinCounter"},	
		
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
		IsNpcCounter {Name = "npc_sP200GelberGoblinCounter", Value = 8, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200GelberGoblinCounter"},	
		
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
		IsNpcCounter {Name = "npc_sP200GelberGoblinCounter", Value = 9, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200GelberGoblinCounter"},	
		
	},

}

-- Vierte Kurve Ziel.
OnIdleGoHome
{
X = 152,
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
		IsNpcCounter {Name = "npc_sP200GelberGoblinCounter", Value = 10, Operator = IsEqual, UpdateInterval = 10},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		IncreaseNpcCounter {Name = "npc_sP200GelberGoblinCounter"},	
		
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
