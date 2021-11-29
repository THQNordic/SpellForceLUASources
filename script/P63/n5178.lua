--> Skelett-Spawing für Libi

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- Spawn Libi um 0:00 --

-- nicht mehr nötig, Spawn macht jetzt von sich aus fx
REM = [[
OnEvent
{
	Conditions =
	{
		IsNpcFlagTrue { Name = "Libi Spawn" , UpdateInterval = 1 }
	},
	Actions =
	{	
		SetNpcFlagFalse { Name = "Libi Spawn" },
		SetEffect { Effect = "Materialize" , Length = 3000 , TargetType = World, X = 407, Y = 203 }
	},
}
]]


SpawnOnlyWhen
{
	X = _X, Y = _Y,
	Conditions =
	{
		IsGlobalState { Name = "Plot", State = "JourneyFour"},
		TimeOfDay { Hour = LibiStartStunde },
	},
	
	Actions =
	{	
		SetNpcFlagTrue { Name = "LibiLookEast" },
		SetNpcFlagTrue { Name = "LibiStartWalking" },
		SetNpcFlagTrue { Name = "CanBeDespawned" },
	},
}

Respawn
{
	X = _X, Y = _Y, WaitTime = 0.1,
	Conditions =
	{
		IsGlobalState { Name = "Plot", State = "JourneyFour"},
		TimeOfDay { Hour = LibiStartStunde },		
	},
	Actions =
	{	
		SetNpcFlagTrue { Name = "LibiLookEast" },
		SetNpcFlagTrue { Name = "LibiStartWalking" },
		SetNpcFlagTrue { Name = "CanBeDespawned" },
	},
}


OnEvent
{
	Conditions =
	{
		IsNpcFlagTrue { Name = "LibiLookEast", UpdateInterval = 1 },
	},
	Actions =
	{	
		LookAtDirection { Direction = East },
		SetNpcFlagFalse { Name = "LibiLookEast" },
		SetEffect{NpcId = 5178, Effect = "Gladiator"},
		----CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawne Stefan --
OnIdleGoHome
{
	X = 413, Y = 200 ,  Direction = South, 
	Conditions = 
	{
		TimeOfDay { Hour = LibiStartStunde , Minute = 15 },
		IsNpcFlagTrue { Name = "LibiStartWalking" },		-- um wiederholtes hinlaufen zu vermeiden...
	},
	HomeActions = 
	{
		SetNpcFlagFalse { Name = "LibiStartWalking" },
		SetGlobalFlagTrue { Name = "Stefan Spawn" },
		----CGdsFigureSetHealth:new(_NpcId, 1),
	},

}

-- Spawne Arne --

OnIdleGoHome
{
	X = 415, Y = 200 ,  Direction = South, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Stefan Gespawnt" },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Stefan Gespawnt" },
		SetGlobalFlagTrue { Name = "Arne Spawn" },
		----CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawne Holger --

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "Arne Gespawnt" },
	},
	Actions =
	{	
		SetGlobalFlagFalse { Name = "Arne Gespawnt" },
		LookAtDirection { Direction = North },
		SetGlobalFlagTrue { Name = "Holger Spawn" },
		----CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawne Steffen --

OnIdleGoHome
{
	X = 417, Y = 200 ,  Direction = South, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Holger Gespawnt" },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Holger Gespawnt" },
		SetGlobalFlagTrue { Name = "Steffen Spawn" },
		----CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawne Sidonie --

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "Steffen Gespawnt" },
	},
	Actions =
	{	
		SetGlobalFlagFalse { Name = "Steffen Gespawnt" },
		LookAtDirection { Direction = North },
		SetGlobalFlagTrue { Name = "Sidonie Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawne Jochen --

OnIdleGoHome
{
	X = 419, Y = 200 ,  Direction = South, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Sidonie Gespawnt" },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Sidonie Gespawnt" },
		SetGlobalFlagTrue { Name = "Jochen Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawne Silke --

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "Jochen Gespawnt" },
	},
	Actions =
	{	
		SetGlobalFlagFalse { Name = "Jochen Gespawnt" },
		LookAtDirection { Direction = North },
		SetGlobalFlagTrue { Name = "Silke Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawn Marco --

OnIdleGoHome
{
	X = 421, Y = 200 ,  Direction = South, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Silke Gespawnt" },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Silke Gespawnt" },
		SetGlobalFlagTrue { Name = "Marco R Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawne Andre --

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "Marco R Gespawnt" },
	},
	Actions =
	{	
		SetGlobalFlagFalse { Name = "Marco R Gespawnt" },
		LookAtDirection { Direction = North },
		SetGlobalFlagTrue { Name = "Andre Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawn Pierre --

OnIdleGoHome
{
	X = 423, Y = 200 ,  Direction = South, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Andre Gespawnt" },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Andre Gespawnt" },
		SetGlobalFlagTrue { Name = "Pierre Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawne Tilman --

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "Pierre Gespawnt" },
	},
	Actions =
	{	
		SetGlobalFlagFalse { Name = "Pierre Gespawnt" },
		LookAtDirection { Direction = North },
		SetGlobalFlagTrue { Name = "Tilman Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawn Marcus --

OnIdleGoHome
{
	X = 425, Y = 200 ,  Direction = South, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Tilman Gespawnt" },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Tilman Gespawnt" },
		SetGlobalFlagTrue { Name = "Marcus Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawne Andreas --

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "Marcus Gespawnt" },
	},
	Actions =
	{	
		SetGlobalFlagFalse { Name = "Marcus Gespawnt" },
		LookAtDirection { Direction = North },
		SetGlobalFlagTrue { Name = "Andreas Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawn Christian --

OnIdleGoHome
{
	X = 427, Y = 200 ,  Direction = South, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Andreas Gespawnt" },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Andreas Gespawnt" },
		SetGlobalFlagTrue { Name = "Christian Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawne Markus --

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "Christian Gespawnt" },
	},
	Actions =
	{	
		SetGlobalFlagFalse { Name = "Christian Gespawnt" },
		LookAtDirection { Direction = North },
		SetGlobalFlagTrue { Name = "Markus Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawn Thorsten --

OnIdleGoHome
{
	X = 429, Y = 200 ,  Direction = South, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Markus Gespawnt" },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Markus Gespawnt" },
		SetGlobalFlagTrue { Name = "Thorsten Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawne Thomas --

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "Thorsten Gespawnt" },
	},
	Actions =
	{	
		SetGlobalFlagFalse { Name = "Thorsten Gespawnt" },
		LookAtDirection { Direction = North },
		SetGlobalFlagTrue { Name = "Thomas Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawn Jonas --

OnIdleGoHome
{
	X = 431, Y = 200 ,  Direction = South, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Thomas Gespawnt" },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Thomas Gespawnt" },
		SetGlobalFlagTrue { Name = "Jonas Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawne Tobs --

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "Jonas Gespawnt" },
	},
	Actions =
	{	
		SetGlobalFlagFalse { Name = "Jonas Gespawnt" },
		LookAtDirection { Direction = North },
		SetGlobalFlagTrue { Name = "Tobs Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Laufe im Halbkreis dumm rum --

OnIdleGoHome
{
	X = 432, Y = 200 , Direction = NorthEast,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Tobs Gespawnt"  , UpdateInterval = 10 },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Tobs Gespawnt" },
		SetGlobalFlagTrue { Name = "Punkt 1 erreicht" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

OnIdleGoHome
{
	X = 433 , Y = 201 ,  Direction = North,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Punkt 1 erreicht"  , UpdateInterval = 10 },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Punkt 1 erreicht" },
		SetGlobalFlagTrue { Name = "Punkt 2 erreicht" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

OnIdleGoHome
{
	X = 433 , Y = 207 ,   Direction = NorthWest,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Punkt 2 erreicht"  , UpdateInterval = 10 },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Punkt 2 erreicht" },
		SetGlobalFlagTrue { Name = "Punkt 3 erreicht" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

OnIdleGoHome
{
	X = 432 , Y = 208 ,    Direction = West,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Punkt 3 erreicht"  , UpdateInterval = 10 },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Punkt 3 erreicht" },
		SetGlobalFlagTrue { Name = "Punkt 4 erreicht" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawn Dirk --

OnIdleGoHome
{
	X = 431 , Y = 208 , Direction = South, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Punkt 4 erreicht" },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Punkt 4 erreicht" },
		SetGlobalFlagTrue { Name = "Dirk Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawn Jirka --

OnIdleGoHome
{
	X = 429, Y = 208 ,  Direction = South, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Dirk Gespawnt" },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Dirk Gespawnt" },
		SetGlobalFlagTrue { Name = "Jirka Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawn Klaus --

OnIdleGoHome
{
	X = 427, Y = 208 ,  Direction = South, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Jirka Gespawnt" },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Jirka Gespawnt" },
		SetGlobalFlagTrue { Name = "Klaus Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Matz --

OnIdleGoHome
{
	X = 425, Y = 208 ,  Direction = South, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Klaus Gespawnt" },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Klaus Gespawnt" },
		SetGlobalFlagTrue { Name = "Matz Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawn Marco --

OnIdleGoHome
{
	X = 423, Y = 208 ,  Direction = South, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Matz Gespawnt" },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Matz Gespawnt" },
		SetGlobalFlagTrue { Name = "Marco K Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawn Ralf --

OnIdleGoHome
{
	X = 421, Y = 208 ,  Direction = South, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Marco K Gespawnt" },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Marco K Gespawnt" },
		SetGlobalFlagTrue { Name = "Ralf Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawn Cabo --

OnIdleGoHome
{
	X = 419, Y = 208 ,  Direction = South, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Ralf Gespawnt" },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Ralf Gespawnt" },
		SetGlobalFlagTrue { Name = "Cabo Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawn Volker --

OnIdleGoHome
{
	X = 417, Y = 208 ,  Direction = South, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Cabo Gespawnt" },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Cabo Gespawnt" },
		SetGlobalFlagTrue { Name = "Volker Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Spawn Boris --

OnIdleGoHome
{
	X = 415, Y = 208 ,  Direction = South, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Volker Gespawnt" },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Volker Gespawnt" },
		SetGlobalFlagTrue { Name = "Boris Spawn" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

-- Geh nach hause, Baby! --

OnIdleGoHome
{
	X = 413, Y = 208 ,  Direction = SouthWest,  
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Boris Gespawnt"  , UpdateInterval = 10 },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Boris Gespawnt" },
		SetGlobalFlagTrue { Name = "Punkt 5 erreicht" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

OnIdleGoHome
{
	X = 412 , Y = 207 ,   Direction = South, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Punkt 5 erreicht"  , UpdateInterval = 10 },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Punkt 5 erreicht" },
		SetGlobalFlagTrue { Name = "Punkt 6 erreicht" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

OnIdleGoHome
{
	X = 412 , Y = 203 ,    Direction = West, 
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Punkt 6 erreicht"  , UpdateInterval = 10 },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Punkt 6 erreicht" },
		SetGlobalFlagTrue { Name = "Punkt 7 erreicht" },
		--CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

OnIdleGoHome
{
	X = 407 , Y = 203 ,  Direction = East,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "Punkt 7 erreicht"  , UpdateInterval = 10 },
	},
	HomeActions = 
	{	
		SetGlobalFlagFalse { Name = "Punkt 7 erreicht" },
		SetGlobalFlagTrue { Name = "Punkt 8 erreicht" },
		--CGdsFigureSetHealth:new(_NpcId, 1),

		--StopEffect{NpcId = 5178},
		--SetEffect{NpcId = 5168, Effect = "Gladiator"},
		--SetEffect{NpcId = 5169, Effect = "Gladiator"},
		--SetEffect{NpcId = 5170, Effect = "Gladiator"},
		--SetEffect{NpcId = 5171, Effect = "Gladiator"},
		--SetEffect{NpcId = 5172, Effect = "Gladiator"},
		--SetEffect{NpcId = 5173, Effect = "Gladiator"},
		--SetEffect{NpcId = 5174, Effect = "Gladiator"},
		--SetEffect{NpcId = 5175, Effect = "Gladiator"},
		--SetEffect{NpcId = 5176, Effect = "Gladiator"},
		--SetEffect{NpcId = 5177, Effect = "Gladiator"},
		--SetEffect{NpcId = 5178, Effect = "Gladiator"},
		--SetEffect{NpcId = 5196, Effect = "Gladiator"},
		--SetEffect{NpcId = 5197, Effect = "Gladiator"},
		--SetEffect{NpcId = 5198, Effect = "Gladiator"},
		--SetEffect{NpcId = 5199, Effect = "Gladiator"},
		--SetEffect{NpcId = 5200, Effect = "Gladiator"},
		--SetEffect{NpcId = 5261, Effect = "Gladiator"},
		--SetEffect{NpcId = 5262, Effect = "Gladiator"},
		--SetEffect{NpcId = 5263, Effect = "Gladiator"},
		--SetEffect{NpcId = 5264, Effect = "Gladiator"},
		--SetEffect{NpcId = 5265, Effect = "Gladiator"},
		--SetEffect{NpcId = 5266, Effect = "Gladiator"},
		--SetEffect{NpcId = 5267, Effect = "Gladiator"},
		--SetEffect{NpcId = 5268, Effect = "Gladiator"},
		--SetEffect{NpcId = 5269, Effect = "Gladiator"},
		--SetEffect{NpcId = 5270, Effect = "Gladiator"},
		--SetEffect{NpcId = 5271, Effect = "Gladiator"},
		--SetEffect{NpcId = 5272, Effect = "Gladiator"},
		--SetEffect{NpcId = 5273, Effect = "Gladiator"},
        --
		--SetEffect{NpcId = 5168, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5169, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5170, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5171, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5172, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5173, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5174, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5175, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5176, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5177, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5178, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5196, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5197, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5198, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5199, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5200, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5261, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5262, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5263, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5264, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5265, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5266, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5267, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5268, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5269, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5270, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5271, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5272, Effect = "SimpleInvis"},
		--SetEffect{NpcId = 5273, Effect = "SimpleInvis"},
	},
}

OnEvent
{
	Conditions =
	{
		TimeBetween{Hour = LibiEndStunde, ToHour = 23, ToMinute = 59, UpdateInterval = 60},
		IsNpcFlagTrue { Name = "CanBeDespawned" },
	},
	Actions =
	{	
		SetNpcFlagFalse { Name = "CanBeDespawned" },
		SetNpcTimeStamp{ Name = "DespawnTimer" },
		SetEffect { Effect = "DeMaterialize" , Length = 2200 , NpcId = _NpcId },
	},
}

Despawn
{
	Conditions =
	{
		IsNpcTimeElapsed{ Name = "DespawnTimer", Seconds = 1.9, UpdateInterval = 5},
	},
	Actions =
	{	
		ClearNpcTimeStamp{ Name = "DespawnTimer" },

		SetGlobalFlagFalse { Name = "Stefan Spawn" },
		SetGlobalFlagFalse { Name = "Arne Spawn" },
		SetGlobalFlagFalse { Name = "Holger Spawn" },
		SetGlobalFlagFalse { Name = "Holger Spawn" },
		SetGlobalFlagFalse { Name = "Steffen Spawn" },
		SetGlobalFlagFalse { Name = "Sidonie Spawn" },
		SetGlobalFlagFalse { Name = "Jochen Spawn" },
		SetGlobalFlagFalse { Name = "Silke Spawn" },
		SetGlobalFlagFalse { Name = "Marco R Spawn" },
		SetGlobalFlagFalse { Name = "Andre Spawn" },
		SetGlobalFlagFalse { Name = "Pierre Spawn" },
		SetGlobalFlagFalse { Name = "Tilman Spawn" },
		SetGlobalFlagFalse { Name = "Marcus Spawn" },
		SetGlobalFlagFalse { Name = "Andreas Spawn" },
		SetGlobalFlagFalse { Name = "Christian Spawn" },
		SetGlobalFlagFalse { Name = "Markus Spawn" },
		SetGlobalFlagFalse { Name = "Thorsten Spawn" },
		SetGlobalFlagFalse { Name = "Thomas Spawn" },
		SetGlobalFlagFalse { Name = "Jonas Spawn" },
		SetGlobalFlagFalse { Name = "Tobs Spawn" },
		SetGlobalFlagFalse { Name = "Dirk Spawn" },
		SetGlobalFlagFalse { Name = "Jirka Spawn" },
		SetGlobalFlagFalse { Name = "Matz Spawn" },
		SetGlobalFlagFalse { Name = "Marco K Spawn" },
		SetGlobalFlagFalse { Name = "Ralf Spawn" },
		SetGlobalFlagFalse { Name = "Cabo Spawn" },
		SetGlobalFlagFalse { Name = "Volker Spawn" },
		SetGlobalFlagFalse { Name = "Boris Spawn" },

		SetGlobalFlagFalse { Name = "Stefan Gespawnt" },
		SetGlobalFlagFalse { Name = "Arne Gespawnt" },
		SetGlobalFlagFalse { Name = "Holger Gespawnt" },
		SetGlobalFlagFalse { Name = "Holger Gespawnt" },
		SetGlobalFlagFalse { Name = "Steffen Gespawnt" },
		SetGlobalFlagFalse { Name = "Sidonie Gespawnt" },
		SetGlobalFlagFalse { Name = "Jochen Gespawnt" },
		SetGlobalFlagFalse { Name = "Silke Gespawnt" },
		SetGlobalFlagFalse { Name = "Marco R Gespawnt" },
		SetGlobalFlagFalse { Name = "Andre Gespawnt" },
		SetGlobalFlagFalse { Name = "Pierre Gespawnt" },
		SetGlobalFlagFalse { Name = "Tilman Gespawnt" },
		SetGlobalFlagFalse { Name = "Marcus Gespawnt" },
		SetGlobalFlagFalse { Name = "Andreas Gespawnt" },
		SetGlobalFlagFalse { Name = "Christian Gespawnt" },
		SetGlobalFlagFalse { Name = "Markus Gespawnt" },
		SetGlobalFlagFalse { Name = "Thorsten Gespawnt" },
		SetGlobalFlagFalse { Name = "Thomas Gespawnt" },
		SetGlobalFlagFalse { Name = "Jonas Gespawnt" },
		SetGlobalFlagFalse { Name = "Tobs Gespawnt" },
		SetGlobalFlagFalse { Name = "Dirk Gespawnt" },
		SetGlobalFlagFalse { Name = "Jirka Gespawnt" },
		SetGlobalFlagFalse { Name = "Matz Gespawnt" },
		SetGlobalFlagFalse { Name = "Marco K Gespawnt" },
		SetGlobalFlagFalse { Name = "Ralf Gespawnt" },
		SetGlobalFlagFalse { Name = "Cabo Gespawnt" },
		SetGlobalFlagFalse { Name = "Volker Gespawnt" },
		SetGlobalFlagFalse { Name = "Boris Gespawnt" },

		SetGlobalFlagFalse { Name = "Punkt 1 erreicht" },
		SetGlobalFlagFalse { Name = "Punkt 2 erreicht" },
		SetGlobalFlagFalse { Name = "Punkt 3 erreicht" },
		SetGlobalFlagFalse { Name = "Punkt 4 erreicht" },
		SetGlobalFlagFalse { Name = "Punkt 5 erreicht" },
		SetGlobalFlagFalse { Name = "Punkt 6 erreicht" },
		SetGlobalFlagFalse { Name = "Punkt 7 erreicht" },
		SetGlobalFlagFalse { Name = "Punkt 8 erreicht" },
	},
}



	EndDefinition()

end
