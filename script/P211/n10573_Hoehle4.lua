-- HöhlenSpawning am Gefängnis
-- Höhle4




Flag =
{
	[1] = {WaitTime = 20,  XInStellung = 177, YInStellung = 113, SecondsSpawn = 10, XInEbene = NpcId10573_X, YInEbene = NpcId10573_Y},
	[2] = {WaitTime = 30,  XInStellung = 177, YInStellung = 116, SecondsSpawn = 12, XInEbene = NpcId10574_X, YInEbene = NpcId10574_Y},
	[3] = {WaitTime = 50,  XInStellung = 179, YInStellung = 110, SecondsSpawn = 15, XInEbene = NpcId10575_X, YInEbene = NpcId10575_Y},
	[4] = {WaitTime = 70,  XInStellung = 182, YInStellung = 115, SecondsSpawn = 20, XInEbene = NpcId10576_X, YInEbene = NpcId10576_Y},
	[5] = {WaitTime = 90,  XInStellung = 183, YInStellung = 110, SecondsSpawn = 11, XInEbene = NpcId10577_X, YInEbene = NpcId10577_Y}, 
	[6] = {WaitTime = 110, XInStellung = 185, YInStellung = 113, SecondsSpawn = 22, XInEbene = NpcId10578_X, YInEbene = NpcId10578_Y}, 
	[7] = {WaitTime = 150, XInStellung = 186, YInStellung = 111, SecondsSpawn = 30, XInEbene = NpcId10579_X, YInEbene = NpcId10579_Y}, 
	[8] = {WaitTime = 170, XInStellung = 188, YInStellung = 116, SecondsSpawn = 35, XInEbene = NpcId10580_X, YInEbene = NpcId10580_Y},
	[9] = {WaitTime = 70,  XInStellung = 189, YInStellung = 119, SecondsSpawn = 17, XInEbene = NpcId10581_X, YInEbene = NpcId10581_Y}
	
}

-----------------------------------------------------------
-- Goto in Ebene
SpawnOnlyWhen
{
	X = 216, Y = 82, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "gt_P211HoehlenTimer", Seconds = Flag[MyNumber].SecondsSpawn},
		IsGlobalFlagFalse {Name = "g_P211Hoehle4SpawnEnde", UpdateInterval = 20}
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
	WaitTime = Flag[MyNumber].WaitTime, UnitId = self, Clan = 0, Target = none, X = 216, Y = 82, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P211EndgegnerEnde"},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P211Hoehle4SpawnEnde", UpdateInterval = 20},
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
	WaitTime = Flag[MyNumber].WaitTime, UnitId = self, Clan = 0, Target = none, X = 216, Y = 82, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P211EndgegnerEnde"},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P211Hoehle4SpawnEnde", UpdateInterval = 20},
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
	WaitTime = Flag[MyNumber].WaitTime, UnitId = self, Clan = 0, Target = none, X = 216, Y = 82, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P211EndgegnerEnde"},
		IsGlobalFlagTrue {Name = "g_P211CSPhoenixAuftrittGelaufen", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_P211Hoehle4SpawnEnde", UpdateInterval = 20},
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
	WaitTime = Flag[MyNumber].WaitTime, UnitId = self, Clan = 0, Target = none, X = 216, Y = 82, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P211EndgegnerEnde"},
		IsGlobalFlagTrue {Name = "g_P211CSPhoenixAuftrittGelaufen", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_P211Hoehle4SpawnEnde", UpdateInterval = 20},
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

