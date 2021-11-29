function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)


--Lena Level 5 (nach Rune1)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "IchWarAufRune1", UpdateInterval = 5},
	},
	Actions = {
		Follow{Target = 0, NpcId = self},
	},
	Target = Avatar,
}


--Despawn, wenn durch Portal nach Flee to Ice
Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "PlayerWarAufFleeToIce", UpdateInterval = 40},
	
	} , 
	Actions = { },
}

-- umspawn flag setzen bei spielertod
OnToggleEvent
{
	OnConditions = 
	{
		FigureDead{NpcId = Avatar},
	},
	OnActions = 
	{
	},
	OffConditions = 
	{
		FigureAlive{NpcId = Avatar},
	},
	OffActions = 
	{
		SetNpcFlagTrue{Name = "BitteUmspawnen"},
	}
}
-- umspawn flag setzen bei plattformwechsel
OnPlatformOneTimeEvent
{
	Conditions =
	{
	},
	Actions = 
	{
		SetNpcFlagTrue{Name = "BitteUmspawnen"},
	}
}

--Umspawn, wenn Spieler tot /  Kartenwechsel / Bindstonereise mit Follow auf Avatar
Umspawn 
{
	UnitId = self, 
	Clan = 0, 
	X = startX, 
	Y = startY,
	Target = Avatar,
	NoSpawnEffect = FALSE,
	OnlyOnce = FALSE,
	Conditions = 
	{
		ODER                                       
		(                                  
			AvatarLocalTeleport{},
			IsNpcFlagTrue{Name = "BitteUmspawnen", UpdateInterval = 3}
		),
		IsGlobalFlagFalse{Name = "P101Gelöst", UpdateInterval = 3},
		IsGlobalFlagTrue{Name = "P101RebirthFollowLea1An", UpdateInterval = 3},
		IsGlobalFlagFalse{Name = "P101RebirthFollowLea2An", UpdateInterval = 3},
		
	} , 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		--Outcry{NpcId = 7010, String = "Umspawn Lena mit Follow hauf Avatar hat funktioniert" , Tag = "" , Color = ColorWhite},
		Follow{Target = 0, NpcId = self},
	}

}

----Umspawn, wenn Spieler tot / Kartenwechsel / Bindstonereisemit Follow auf Elune
--Umspawn 
--{
--	UnitId = self, 
--	Clan = 0, 
--	X = startX, 
--	Y = startY,
--	Target = Avatar,
--	NoSpawnEffect = FALSE,
--	OnlyOnce = FALSE,
--	Conditions = 
--	{
--		ODER                                       
--		(                                  
--			AvatarLocalTeleport{},
--			IsNpcFlagTrue{Name = "BitteUmspawnen", UpdateInterval = 3}
--		),
--		IsGlobalFlagFalse{Name = "P101Gelöst", UpdateInterval = 30},
--		IsGlobalFlagTrue{Name = "P101RebirthFollowLea2An", UpdateInterval = 3},
--		IsGlobalFlagFalse{Name = "P101RebirthFollowLea1An", UpdateInterval = 3},
--		
--	} , 
--	Actions = 
--	{
--		SetNpcFlagFalse{Name = "BitteUmspawnen"},
--		--Outcry{NpcId = 7010, String = "Umspawn Lena mit Follow auf Elune hat funktioniert" , Tag = "" , Color = ColorWhite},
--		Follow{Target = 5937, NpcId = self},
--	}
--
--}

--Umspawn, wenn Spieler tot / Kartenwechsel / Bindstonereise ohne Follow
Umspawn 
{
	UnitId = self, 
	Clan = 0, 
	X = startX, 
	Y = startY,
	Target = Avatar,
	NoSpawnEffect = FALSE,
	OnlyOnce = FALSE,
	Conditions = 
	{
		ODER                                       
		(                                  
			AvatarLocalTeleport{},         
			IsNpcFlagTrue{Name = "BitteUmspawnen", UpdateInterval = 3}
		),
		IsGlobalFlagFalse{Name = "P101Gelöst", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "P101RebirthFollowLea1An", UpdateInterval = 3},
		IsGlobalFlagFalse{Name = "P101RebirthFollowLea2An", UpdateInterval = 3},
		
	}, 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		--Outcry{NpcId = 7010, String = "Umspawn Lena ohne Follow hat funktioniert" , Tag = "" , Color = ColorWhite},
	}

}

---------------------------------------
---------------------------------------

-- Follow auf Grim nach Rune1
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 60,
	Conditions = 
	{ 
		IsGlobalTimeElapsed{Name = "P101FollowNachRune1", Seconds = 8},
	},
	Actions = 
	{ 
		Follow {Target = 0, NpcId = self},
	}
}



--Lea folgt Avatar nach Rune2
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 20 ,
	Conditions = 
	{ 
		IsGlobalTimeElapsed{Name = "P101FollowNachRune2", Seconds = 8},
		
	},
	Actions = 
	{ 
		Follow {Target = 0, NpcId = self},
		
	}
}


---- Ende Follow auf Avatar bei Begin Cutscene Gefängnis, Umspawn Avatar-Follow aus
--
--OnOneTimeEvent
--{
--	NotInDialog = FALSE , UpdateInterval = 60 ,
--	Conditions = 
--	{ 
--		IsGlobalFlagTrue {Name = "CutsceneInitGefaengnis", UpdateInterval = 20},
--		
--	},
--	Actions = 
--	{ 
--		StopFollow {Target = 0, NpcId = self}, 
--		SetGlobalFlagFalse {Name = "P101RebirthFollowLea1An"},
--	},
--}	


----Lea folgt jetzt Elune, Umspawn-Follow LeaElune an
--OnOneTimeEvent
--{
--	NotInDialog = FALSE , UpdateInterval = 60 ,
--	Conditions = 
--	{ 
--		IsGlobalFlagTrue {Name = "P101EluneZuEiselfen", UpdateInterval = 30}, 
--		
--		
--	},
--	Actions = 
--	{ 
--		Follow {Target = 5937, NpcId = self},
--		SetGlobalFlagTrue{Name = "P101RebirthFollowLea2An"},
--		
--	}
--}


--Stop Follow , Lena geht zum Portal, Umspawn-Follow LeaAvatar aus
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 30 ,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "P101EiselfentorOffen", Seconds = 18, UpdateInterval = 20},
	},
	Actions = 
	{ 
		StopFollow{Target = Avatar, NpcId = 5537},
		Goto{X = 449, Y = 466, NpcId = 7010 , Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
		SetGlobalFlagFalse{Name = "P101RebirthFollowLea1An"},
	},
}


--Lea zont nach Flee to Ice 
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 30 ,
	Conditions = 
	{
		FigureInRange {X = 461, Y = 465, NpcId = self , Range = 0},
		IsGlobalFlagTrue{Name = "P101LeaNachFleeToIce", UpdateInterval = 30},
	},
	Actions = 
	{ 
		Vanish {NpcId = self},
	},
}



------------------------------------
--Cutcsene Inits
-----------------------------------
-- Cutscene Init ElfDiscovered
Umspawn
{
	UnitId = self, Clan = 0, X = 230, Y = 428, Target = None, NoSpawnEffect = TRUE, OnlyOnce = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "CutsceneInitElfDiscoveredLena", UpdateInterval = 5},
		Negated(FigureInRange{NpcId = self, X = 230, Y = 428, Range = 5}),		
	}, 
	Actions = 
	{
		SetNoFightFlagTrue {NpcId = self},	
		SetGlobalFlagFalse {Name = "CutsceneInitElfDiscoveredLena"},				
	},
}

-- Cutscene Init Hauptquartier
Umspawn
{
	UnitId = self, Clan = 0, X = 222, Y = 302, Target = None, NoSpawnEffect = TRUE, OnlyOnce = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "CutsceneInitHauptquartierLena", UpdateInterval = 5},
		Negated(FigureInRange{NpcId = self, X = 222, Y = 302, Range = 5}),		
	}, 
	Actions = 
	{
		SetNoFightFlagTrue {NpcId = self},	
		SetGlobalFlagFalse {Name = "CutsceneInitHauptquartierLena"},				
	},
}

-- Cutscene Init Gefaengnis
Umspawn
{
	UnitId = self, Clan = 0, X = 259, Y = 141, Target = None, NoSpawnEffect = TRUE, OnlyOnce = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "CutsceneInitGefaengnisLena", UpdateInterval = 5},
		Negated(FigureInRange{NpcId = self, X = 260, Y = 131, Range = 5}),		
	}, 
	Actions = 
	{
		SetNoFightFlagTrue {NpcId = self},	
		SetGlobalFlagFalse {Name = "CutsceneInitGefaengnisLena"},				
	},
}



EndDefinition()

end
