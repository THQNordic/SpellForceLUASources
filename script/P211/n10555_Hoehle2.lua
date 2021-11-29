-- HöhlenSpawning am Gefängnis
-- Höhle2




Flag =
{
	[1] = {WaitTime = 20,  XInStellung = 166, YInStellung = 144, SecondsSpawn = 10, XInEbene = NpcId10555_X, YInEbene = NpcId10555_Y},
	[2] = {WaitTime = 30,  XInStellung = 164, YInStellung = 144, SecondsSpawn = 12, XInEbene = NpcId10556_X, YInEbene = NpcId10556_Y},
	[3] = {WaitTime = 50,  XInStellung = 164, YInStellung = 140, SecondsSpawn = 15, XInEbene = NpcId10557_X, YInEbene = NpcId10557_Y},
	[4] = {WaitTime = 70,  XInStellung = 162, YInStellung = 137, SecondsSpawn = 20, XInEbene = NpcId10558_X, YInEbene = NpcId10558_Y},
	[5] = {WaitTime = 90,  XInStellung = 162, YInStellung = 133, SecondsSpawn = 11, XInEbene = NpcId10559_X, YInEbene = NpcId10559_Y}, 
	[6] = {WaitTime = 110, XInStellung = 161, YInStellung = 129, SecondsSpawn = 22, XInEbene = NpcId10560_X, YInEbene = NpcId10560_Y}, 
	[7] = {WaitTime = 150, XInStellung = 159, YInStellung = 127, SecondsSpawn = 30, XInEbene = NpcId10561_X, YInEbene = NpcId10561_Y}, 
	[8] = {WaitTime = 170, XInStellung = 167, YInStellung = 132, SecondsSpawn = 35, XInEbene = NpcId10562_X, YInEbene = NpcId10562_Y},
	[9] = {WaitTime = 70,  XInStellung = 171, YInStellung = 137, SecondsSpawn = 17, XInEbene = NpcId10563_X, YInEbene = NpcId10563_Y}
	
}

-----------------------------------------------------------
-- Goto in Ebene
SpawnOnlyWhen
{
	X = 127, Y = 164, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "gt_P211HoehlenTimer", Seconds = Flag[MyNumber].SecondsSpawn},
		IsGlobalFlagFalse {Name = "g_P211Hoehle2SpawnEnde", UpdateInterval = 20}
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
	WaitTime = Flag[MyNumber].WaitTime, UnitId = self, Clan = 0, Target = none, X = 127, Y = 164, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P211EndgegnerEnde"},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P211Hoehle2SpawnEnde", UpdateInterval = 20},
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
	WaitTime = Flag[MyNumber].WaitTime, UnitId = self, Clan = 0, Target = none, X = 127, Y = 164, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P211EndgegnerEnde"},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P211Hoehle2SpawnEnde", UpdateInterval = 20},
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
	WaitTime = Flag[MyNumber].WaitTime, UnitId = self, Clan = 0, Target = none, X = 127, Y = 164, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P211EndgegnerEnde"},
		IsGlobalFlagTrue {Name = "g_P211CSPhoenixAuftrittGelaufen", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_P211Hoehle2SpawnEnde", UpdateInterval = 20},
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
	WaitTime = Flag[MyNumber].WaitTime, UnitId = self, Clan = 0, Target = none, X = 127, Y = 164, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P211EndgegnerEnde"},
		IsGlobalFlagTrue {Name = "g_P211CSPhoenixAuftrittGelaufen", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_P211Hoehle2SpawnEnde", UpdateInterval = 20},
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

