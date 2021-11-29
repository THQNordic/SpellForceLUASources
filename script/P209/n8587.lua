--INFO Xalabar

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
OneTimeInitAction (ChangeRace {Race = 152, NpcId = self})

--Xalabar dreht sich in der 2 Cutszene um, sobald er angekommen ist.
OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 379, Y = 250, NpcId = self, Range = 0},
		FigureJob {Job = JobIdle , NpcId = self},
		IsGlobalFlagTrue {Name = "g_sP209KhalMove"},
	},
	Actions = 
	{ 
		LookAtDirection {Direction = West, NpcId = self},
	}
}

--Xalabar begibt sich zur Arena.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209KathaiMove"},
	},
	Actions = 
	{ 
		Goto {X = 322, Y = 184, NpcId = self, Range = 3, WalkMode = Walk, GotoMode = GotoContinuous},
	}
}


--Für die ArtefaktQuest, wird Xalabar zu einem anderen Tempel gespawned und macht sich durch einen Outcry bemerkbar
Umspawn
{
	X = 383,
	Y = 334,
	NoSpawnEffect = TRUE,
	OnlyOnce = TRUE,
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		ODER(IsGlobalFlagTrue {Name = "g_sP209Artefakt3Gespawned"},IsGlobalFlagTrue {Name = "g_sP209Artefakt2Gespawned"}),
		IsGlobalFlagFalse {Name = "g_sP209XalabarErschienen"},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP209XalabarErscheintTempel1"},
		Outcry {NpcId = 8587, String = "Ha! Ich habe ein Gon gefunden!" , Tag = "oca2xalabarP209_001" , Color = ColorWhite},
		SetMinimapAlert{ X = 383, Y = 334, Type = 6},
		RevealUnExplored {X = 383, Y = 334, Range = 8},		
		SetNpcTimeStamp {Name = "npc_nP209WartezeitXalabar1"},
		SetGlobalFlagTrue {Name = "g_sP209XalabarErschienen"},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsNpcTimeElapsed {Name = "npc_nP209WartezeitXalabar1", Seconds = 15},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP209UmspawnXalabarArena"},
	}
}




Umspawn
{
	X = 414,
	Y = 156,
	NoSpawnEffect = TRUE,
	OnlyOnce = TRUE,
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209Artefakt1Gespawned"},
		IsGlobalFlagFalse {Name = "g_sP209XalabarErschienen"},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP209XalabarErscheintTempel3"},
		Outcry {NpcId = 8587, String = "Ich habe ein Artefakt gefunden!" , Tag = "oca2xalabarP209_001" , Color = ColorWhite},
		SetMinimapAlert{ X = 414, Y = 156, Type = 6},
		RevealUnExplored {X = 414, Y = 156, Range = 8},
		SetNpcTimeStamp {Name = "npc_nP209WartezeitXalabar2"},	
		SetGlobalFlagTrue {Name = "g_sP209XalabarErschienen"},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsNpcTimeElapsed {Name = "npc_nP209WartezeitXalabar2", Seconds = 15},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_sP209UmspawnXalabarArena"},
	}
}

--Umspawn in die Arena
Umspawn
{
	X = 338,
	Y = 185,
	NoSpawnEffect = TRUE,
	OnlyOnce = TRUE,
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209UmspawnXalabarArena"},
	},
	Actions = 
	{
		
	}
}

--Umspawn zum Westtor aus der Arena
Umspawn
{
	X = 291,
	Y = 262,
	NoSpawnEffect = TRUE,
	OnlyOnce = TRUE,
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209UmspawnCutszeneBote1"},
	},
	Actions = 
	{
		
	}
}


--ArenaQuest.
OnToggleEvent
{
	OnConditions =
	{
		IsGlobalFlagTrue {Name = "g_sP209DerKampfKannBeginnen", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_sP209XalabarGeschlagen",  UpdateInterval = 10},
	},
	OnActions = 
	{
		ChangeRace { Race = 179, NpcId = self},	
		Goto {X = 351, Y = 181, NpcId = self, Range = 3, WalkMode = Run, GotoMode = GotoContinuous},
		
	},
	OffConditions =
	{
		IsGlobalFlagFalse {Name = "g_sP209DerKampfKannBeginnen", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_sP209XalabarGeschlagen",  UpdateInterval = 10},
	},
	OffActions = 
	{
		ChangeRace { Race = 1, NpcId = self},
		SetHealth {HitPoints = 2639, NpcId = self , Decrease = FALSE},
		Outcry {NpcId = 8587, String = "Nur wer ein Gon hat, darf auf den Platz! Der Kampf ist ungültig!" , Tag = "oca2xalabarP209_002" , Color = ColorWhite},
	
	},
}

OnToggleEvent
{
	OnConditions =
	{
		IsGlobalFlagTrue {Name = "g_sP209DerKampfKannBeginnen", UpdateInterval = 10},
		FigureAlive {NpcId = 8597},
		IsGlobalFlagFalse {Name = "g_sP209XalabarGeschlagen",  UpdateInterval = 10},
	},
	OnActions = 
	{
		ChangeRace { Race = 179, NpcId = 8597},	
		Goto {X = 345, Y = 184, NpcId = self, Range = 3, WalkMode = Run, GotoMode = GotoContinuous},
	},
	OffConditions =
	{
		IsGlobalFlagFalse {Name = "g_sP209DerKampfKannBeginnen", UpdateInterval = 10},
		FigureAlive {NpcId = 8597},
		IsGlobalFlagFalse {Name = "g_sP209XalabarGeschlagen",  UpdateInterval = 10},
	},
	OffActions = 
	{
		ChangeRace { Race = 1, NpcId = 8597},
		SetHealth {HitPoints = 858, NpcId = 8597, Decrease = FALSE},	
	},
}
--Xalabar gibt auf wenn er nur noch 15% Hitpoints besitzt.
OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureHasHealth {Percent = 15, NpcId = self , UpdateInterval = 10},
	},
	Actions = 
	{ 
		ChangeRace { Race = 1, NpcId = self},
		Outcry {NpcId = 8588, String = "Torai! Alle beide! Genug Blut ist für heute vergossen!" , Tag = "csa232uru_006" , Color = ColorWhite},
		--Outcry {NpcId = 8587, String = "Haltet ein! Bitte verschont mich! Ich gebe mich geschlagen!" , Tag = "" , Color = ColorWhite},
		SetGlobalFlagTrue {Name = "g_sP209XalabarGeschlagen"},
		SetItemFlagFalse {Name = "HeiligesArtefaktKathai1"},
		SetItemFlagFalse {Name = "HeiligesArtefaktKathai2"},
		SetItemFlagFalse {Name = "HeiligesArtefaktKathai3"},
	}
}

--Xalabar begibt am Anfang der Cutszene Dryade zum Tor und verschwindet in Richtung Clockwork.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_sP209ClockworkGateOpen"},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{Name = "g_tsP209XalabarWartetAufsTor"},
	}
}
--SicherheitsDelay damit das Tor auch unten ist!
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "g_tsP209XalabarWartetAufsTor", Seconds = 1},
	},
	Actions = 
	{ 
		Goto {X = 414, Y = 302, NpcId = 8587, Range = 0, WalkMode = Walk, GotoMode = GotoContinuous},
	}
}


Despawn
{
	PlayDeathAnim = FALSE,
	Conditions = 
	{
		FigureInRange {X = 414, Y = 302, NpcId = self, Range = 0},
		FigureJob {Job = JobIdle , NpcId = self},
		IsGlobalFlagTrue {Name = "g_sP209ClockworkTold"},
	},
	Actions = 
	{
	
	}
}
EndDefinition()

end
