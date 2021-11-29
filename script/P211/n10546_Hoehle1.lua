-- HöhlenSpawning am Gefängnis
-- Höhle1




Flag =
{
	[1] = {WaitTime = 20, XInStellung = 161, YInStellung = 102, SecondsSpawn = 10, XInEbene = NpcId10546_X, YInEbene = NpcId10546_Y},
	[2] = {WaitTime = 30, XInStellung = 163, YInStellung = 104, SecondsSpawn = 12, XInEbene = NpcId10547_X, YInEbene = NpcId10547_Y},
	[3] = {WaitTime = 50, XInStellung = 160, YInStellung = 107, SecondsSpawn = 15, XInEbene = NpcId10548_X, YInEbene = NpcId10548_Y},
	[4] = {WaitTime = 70, XInStellung = 161, YInStellung = 109, SecondsSpawn = 20, XInEbene = NpcId10549_X, YInEbene = NpcId10549_Y},
	[5] = {WaitTime = 90, XInStellung = 161, YInStellung = 113, SecondsSpawn = 11, XInEbene = NpcId10550_X, YInEbene = NpcId10550_Y}, 
	[6] = {WaitTime = 110, XInStellung = 157, YInStellung = 115, SecondsSpawn = 22, XInEbene = NpcId10551_X, YInEbene = NpcId10551_Y}, 
	[7] = {WaitTime = 150, XInStellung = 164, YInStellung = 114, SecondsSpawn = 30, XInEbene = NpcId10552_X, YInEbene = NpcId10552_Y}, 
	[8] = {WaitTime = 170, XInStellung = 161, YInStellung = 118, SecondsSpawn = 35, XInEbene = NpcId10553_X, YInEbene = NpcId10553_Y},
	[9] = {WaitTime = 70, XInStellung =  157, YInStellung = 117, SecondsSpawn = 17, XInEbene = NpcId10554_X, YInEbene = NpcId10554_Y}
	
}

-----------------------------------------------------------
-- Goto in Ebene
SpawnOnlyWhen
{
	X = 143, Y = 79, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "gt_P211HoehlenTimer", Seconds = Flag[MyNumber].SecondsSpawn},
		IsGlobalFlagFalse {Name = "g_P211Hoehle1SpawnEnde", UpdateInterval = 20},
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
	WaitTime = Flag[MyNumber].WaitTime, UnitId = self, Clan = 0, Target = none, X = 143, Y = 79, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P211EndgegnerEnde"},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P211Hoehle1SpawnEnde", UpdateInterval = 20},
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
	WaitTime = Flag[MyNumber].WaitTime, UnitId = self, Clan = 0, Target = none, X = 143, Y = 79, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P211EndgegnerEnde"},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P211Hoehle1SpawnEnde", UpdateInterval = 20},
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
		--Outcry {NpcId = 10580, String = "Haltet sie auf!" , Tag = "oca2soulforgerP211_001" , Delay = TRUE , Color = ColorWhite}
	},
}

-----------------------------------------------------
----------------------------------------------------
-- als Schattenkrieger
------------------------------
--Craig noch nicht befreit, respawn mit Goto in Ebene:

Respawn
{
	WaitTime = Flag[MyNumber].WaitTime, UnitId = self, Clan = 0, Target = none, X = 143, Y = 79, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P211EndgegnerEnde"},
		IsGlobalFlagTrue {Name = "g_P211CSPhoenixAuftrittGelaufen", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_P211Hoehle1SpawnEnde", UpdateInterval = 20},
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
	WaitTime = Flag[MyNumber].WaitTime, UnitId = self, Clan = 0, Target = none, X = 143, Y = 79, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P211EndgegnerEnde"},
		IsGlobalFlagTrue {Name = "g_P211CSPhoenixAuftrittGelaufen", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_P211Hoehle1SpawnEnde", UpdateInterval = 20},
		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P212"},
		IsGlobalFlagTrue {Name = "g_P211CraigBefreit", UpdateInterval = 20},
		
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
		--Outcry {NpcId = 10580, String = "Haltet sie auf!" , Tag = "oca2soulforgerP211_001" , Delay = TRUE , Color = ColorWhite}

	},
}

