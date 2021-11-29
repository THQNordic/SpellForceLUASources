-->Drache Stein1

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}

SpawnOnlyWhen
{
	X = _X, 
	Y = _Y, 
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201DoppelgaengerLaurinStart", UpdateInterval = 10}, 
	},
	Actions = 
	{
		ChangeRace {Race = 152, NpcId = self},
		SetEffect{Effect = "Spawnboss", Length = 0, TargetType = Figure, NpcId = self},
		SetHealth{HitPoints = 1, NpcId = self, Decrease = FALSE},
 		SetGlobalFlagTrue {Name = "g_P201LaurinDoppelgaenger1lebt"},
	}
} 

--Nach dem ersten Timer.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "g_tnP201ZeitDoppelgaengerStart1", Seconds = 15}, 
		IsGlobalFlagTrue {Name = "g_sP201LaurinAmLeben", UpdateInterval = 10},
		--IsGlobalFlagFalse {Name = "g_sP201LaurinTot"},	
		IsGlobalFlagFalse {Name = "g_sP201_LaurinStein1Off", UpdateInterval = 10},
	},
	Actions = 
	{ 
		SetNpcTimeStamp {Name = "npc_tnP201ZeitDoppelgaengerTimer2"},	
		SetHealth{HitPoints = 522, NpcId = self, Decrease = FALSE},
	}
}

--Nach dem zweiten Timer.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsNpcTimeElapsed {Name = "npc_tnP201ZeitDoppelgaengerTimer2", Seconds = 15}, 
		IsGlobalFlagTrue {Name = "g_sP201LaurinAmLeben", UpdateInterval = 10},
		--IsGlobalFlagFalse {Name = "g_sP201LaurinTot"},	
		IsGlobalFlagFalse {Name = "g_sP201_LaurinStein1Off", UpdateInterval = 10},
	},
	Actions = 
	{ 
		SetNpcTimeStamp {Name = "npc_tnP201ZeitDoppelgaengerTimer3"},	
		SetHealth{HitPoints = 1045, NpcId = self, Decrease = FALSE},
	}
}

--Nach dem dritten Timer.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsNpcTimeElapsed {Name = "npc_tnP201ZeitDoppelgaengerTimer3", Seconds = 15}, 
		IsGlobalFlagTrue {Name = "g_sP201LaurinAmLeben", UpdateInterval = 10},
		--IsGlobalFlagFalse {Name = "g_sP201LaurinTot"},	
		IsGlobalFlagFalse {Name = "g_sP201_LaurinStein1Off", UpdateInterval = 10},
	},
	Actions = 
	{ 
		SetNpcTimeStamp {Name = "npc_tnP201ZeitDoppelgaengerTimer4"},	
		SetHealth{HitPoints = 1567, NpcId = self, Decrease = FALSE},
	}
}

--Nach dem vierten Timer.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsNpcTimeElapsed {Name = "npc_tnP201ZeitDoppelgaengerTimer4", Seconds = 15}, 
		IsGlobalFlagTrue {Name = "g_sP201LaurinAmLeben", UpdateInterval = 10},
		--IsGlobalFlagFalse {Name = "g_sP201LaurinTot"},	
		IsGlobalFlagFalse {Name = "g_sP201_LaurinStein1Off", UpdateInterval = 10},
	},
	Actions = 
	{ 
		
		SetHealth{HitPoints = 2090, NpcId = self, Decrease = FALSE},
		ChangeRace {Race = 107, NpcId = self},
		StopEffect{ TargetType = Figure, NpcId = self},
	}
}

--Sobald der Drachenstein2 vom Spieler ausgeschaltet wird, wird der Drache aggro.
OnOneTimeEvent
{
	Conditions = 
	{ 
		
		IsGlobalFlagTrue {Name = "g_sP201LaurinAmLeben", UpdateInterval = 10},
		--IsGlobalFlagFalse {Name = "g_sP201LaurinTot"},	
		IsGlobalFlagTrue {Name = "g_sP201_LaurinStein1Off", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_P201LaurinDoppelgaenger1lebt", UpdateInterval = 10},
	},
	Actions = 
	{ 
		ChangeRace {Race = 107, NpcId = self},
		StopEffect{ TargetType = Figure, NpcId = self},
	}
}


EndDefinition()

end
