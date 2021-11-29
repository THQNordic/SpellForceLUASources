-- HöhlenSpawning am Gefängnis
-- Höhle3




Flag =
{
	[1] = {WaitTime = 20, XInStellung = 196, YInStellung = 147, SecondsSpawn = 10, XInEbene = NpcId10564_X, YInEbene = NpcId10564_Y},
	[2] = {WaitTime = 30, XInStellung = 191, YInStellung = 147, SecondsSpawn = 12, XInEbene = NpcId10565_X, YInEbene = NpcId10565_Y},
	[3] = {WaitTime = 50, XInStellung = 192, YInStellung = 146, SecondsSpawn = 15, XInEbene = NpcId10566_X, YInEbene = NpcId10566_Y},
	[4] = {WaitTime = 70, XInStellung = 188, YInStellung = 146, SecondsSpawn = 20, XInEbene = NpcId10567_X, YInEbene = NpcId10567_Y},
	[5] = {WaitTime = 90, XInStellung = 188, YInStellung = 143, SecondsSpawn = 11, XInEbene = NpcId10568_X, YInEbene = NpcId10568_Y}, 
	[6] = {WaitTime = 110, XInStellung = 191, YInStellung = 143, SecondsSpawn = 22, XInEbene = NpcId10569_X, YInEbene = NpcId10569_Y}, 
	[7] = {WaitTime = 150, XInStellung = 193, YInStellung = 144, SecondsSpawn = 30, XInEbene = NpcId10570_X, YInEbene = NpcId10570_Y}, 
	[8] = {WaitTime = 170, XInStellung = 194, YInStellung = 143, SecondsSpawn = 35, XInEbene = NpcId10571_X, YInEbene = NpcId10571_Y},
	[9] = {WaitTime = 70, XInStellung =  192, YInStellung = 141, SecondsSpawn = 17, XInEbene = NpcId10572_X, YInEbene = NpcId10572_Y}
	
}

-----------------------------------------------------------
-- Goto in Ebene
SpawnOnlyWhen
{
	X = 185, Y = 177, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "gt_P211HoehlenTimer", Seconds = Flag[MyNumber].SecondsSpawn},
		IsGlobalFlagFalse {Name = "g_P211Hoehle3SpawnEnde", UpdateInterval = 20}
	}, 
	Actions = 
	{ 
		Goto {X = Flag[MyNumber].XInEbene, Y = Flag[MyNumber].YInEbene, NpcId = self, Range = 3, WalkMode = Walk, GotoMode = GotoContinuous},
	} 
}


----------------------------------------------------------------------
-- Respawn + Action, solange HöhlenRange nicht mit Units besetzt:
----------------------------------------------------------------------
----------------------------------------------------------------------
-- als Phönixkrieger
---------------------------
-- wenn CS Befreiung noch nicht gelaufen, respawn mit Goto in Ebene:

Respawn
{
	WaitTime = Flag[MyNumber].WaitTime, UnitId = self, Clan = 0, Target = none, X = 185, Y = 177, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P211EndgegnerEnde"},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P211Hoehle3SpawnEnde", UpdateInterval = 20},
		IsGlobalFlagFalse {Name = "g_P211CSBefreiungGelaufen", UpdateInterval = 20},
		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P212"},
	} , 
	Actions = 
	{
		Goto {X = Flag[MyNumber].XInEbene, Y = Flag[MyNumber].YInEbene, NpcId = self, Range = 3, WalkMode = Walk, GotoMode = GotoContinuous},
	}, 
	DeathActions = {} 
}


-- als Phönixkrieger
-- wenn CS Befreiung gelaufen, respawn mit Goto zum Gefängnisaufgang:

Respawn
{
	WaitTime = Flag[MyNumber].WaitTime, UnitId = self, Clan = 0, Target = none, X = 185, Y = 177, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P211EndgegnerEnde"},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P211Hoehle3SpawnEnde", UpdateInterval = 20},
		IsGlobalFlagTrue {Name = "g_P211CSBefreiungGelaufen", UpdateInterval = 20},
		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P212"},
	} , 
	Actions = 
	{
		Goto {X = Flag[MyNumber].XInStellung, Y = Flag[MyNumber].YInStellung, NpcId = self, Range = 3, WalkMode = Walk, GotoMode = GotoContinuous},
	}, 
	DeathActions = {} 
}


-- als Phönixkrieger
-- Wenn CS Befreiung gelaufen, Goto der Blades zum Gefängnisaufgang
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211CSBefreiungGelaufen", UpdateInterval = 20},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 30}
	},
	Actions = 
	{
		Goto {X = Flag[MyNumber].XInStellung, Y = Flag[MyNumber].YInStellung, NpcId = self, Range = 3, WalkMode = Run, GotoMode = GotoContinuous},
	},
}


-----------------------------------------------------
----------------------------------------------------
-- als Schattenkrieger
------------------------------
--Craig noch nicht befreit, respawn mit Goto in Ebene:

Respawn
{
	WaitTime = Flag[MyNumber].WaitTime, UnitId = self, Clan = 0, Target = none, X = 185, Y = 177, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P211EndgegnerEnde"},
		IsGlobalFlagTrue {Name = "g_P211CSPhoenixAuftrittGelaufen", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_P211Hoehle3SpawnEnde", UpdateInterval = 20},
		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P212"},
		IsGlobalFlagFalse {Name = "g_P211CraigBefreit", UpdateInterval = 20}
	} , 
	Actions = 
	{
		Goto {X = Flag[MyNumber].XInEbene, Y = Flag[MyNumber].YInEbene, NpcId = self, Range = 3, WalkMode = Walk, GotoMode = GotoContinuous},
	}, 
	DeathActions = {} 
}


-- als Schattenkrieger
-- wenn Craig befreit, respawn mit Goto zum Gefängnisaufgang:

Respawn
{
	WaitTime = Flag[MyNumber].WaitTime, UnitId = self, Clan = 0, Target = none, X = 185, Y = 177, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P211EndgegnerEnde"},
		IsGlobalFlagTrue {Name = "g_P211CSPhoenixAuftrittGelaufen", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_P211Hoehle3SpawnEnde", UpdateInterval = 20},
		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P212"},
		IsGlobalFlagTrue {Name = "g_P211CraigBefreit", UpdateInterval = 20}
	} , 
	Actions = 
	{
		Goto {X = Flag[MyNumber].XInStellung, Y = Flag[MyNumber].YInStellung, NpcId = self, Range = 3, WalkMode = Walk, GotoMode = GotoContinuous},
	}, 
	DeathActions = {} 
}


-- als Schattenkrieger
-- Wenn Craig befreit, Goto der Blades zum Gefängnisaufgang
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211CraigBefreit", UpdateInterval = 20},
		IsGlobalFlagTrue {Name = "g_P211CSPhoenixAuftrittGelaufen", UpdateInterval = 10}
	},
	Actions = 
	{
		Goto {X = Flag[MyNumber].XInStellung, Y = Flag[MyNumber].YInStellung, NpcId = self, Range = 3, WalkMode = Run, GotoMode = GotoContinuous},
	},
}

