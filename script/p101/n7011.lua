function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- Grim Level 5


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


--Despawn, wenn durch Portal nach Fire City
Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "NachFireCity", UpdateInterval = 40},
		--FigureInRange {X = 403, Y = 248, NpcId = self , Range = 0},
	} , 
	Actions = 
	{ 
		SetGlobalFlagTrue{Name = "P101GrimInFireCity"},
	},
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

--Umspawn, wenn Spieler tot / Kartenwechsel / Bindstonereise ohne Follow
--(nach Zerstörung des HQ; Grim rennt zum Gefängnis, folgt nicht mehr)
Umspawn 
{
	UnitId = self , 
	Clan = 0 , 
	X = startX , 
	Y = startY ,
	Target = Avatar ,
	NoSpawnEffect = FALSE ,
	OnlyOnce = FALSE,
	Conditions = 
	{
		ODER
		(
			AvatarLocalTeleport{},
			IsNpcFlagTrue{Name = "BitteUmspawnen", UpdateInterval = 3}
		),
		IsGlobalFlagFalse{Name = "P101GrimInFireCity", UpdateInterval = 3},
		IsGlobalFlagFalse{Name = "P101RebirthFollowGrimAn", UpdateInterval = 3},
		
	} , 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		--Outcry{NpcId = 7011, String = "Umspawn Grim ohne Follow hat funktioniert" , Tag = "" , Color = ColorWhite},
	}

}


--Umspawn, wenn Spieler tot / Kartenwechsel / Bindstonereise mit Follow auf Avatar
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
		IsGlobalFlagFalse{Name = "P101GrimInFireCity", UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "P101RebirthFollowGrimAn", UpdateInterval = 3}
		
	}, 
	Actions = 
	{
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		--Outcry{NpcId = 7011, String = "Umspawn Grim mit Follow auf Avatar hat funktioniert" , Tag = "" , Color = ColorWhite},
		Follow {Target = Avatar, NpcId = self},
	}

}

---------------------------------------------
---------------------------------------------

-- Follow  Avatar nach Rune1
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 20 ,
	Conditions = 
	{ 
		IsGlobalTimeElapsed{Name = "P101FollowNachRune1", Seconds = 5},
		
		
	},
	Actions = 
	{ 
		Follow {Target = Avatar, NpcId = self},
	}
}


---------------------------------------------
	
-- Grim läuft dem Avatar voraus zum Angriff ElfenHQ
OnFollowMe
{	
	X = 318, Y = 218, 
	LeadRange = 10, 
	Conditions = 
	{
		IsGlobalTimeElapsed{Name = "AbSpielerHatQuestarmee", Seconds = 8, UpdateInterval = 10},
	}, 
	Actions = {},
	HomeActions = 
	{
		SetGlobalFlagTrue {Name = "p101GrimAmStadtportal" },
	},
}



-- Grim läuft nach erstem Angriff auf Eiselfen dem Avatar hinterher

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "p101GrimAmStadtportal", UpdateInterval = 10}, 
	},
	Actions = 
	{ 
		Follow{Target = Avatar},
		
		
	}
}



---- Grim  wird neutral und folgt Avatar
--OnOneTimeEvent
--{
--	NotInDialog = FALSE , UpdateInterval = 60 ,
--	Conditions = 
--	{ 
--		IsGlobalFlagTrue{Name = "CutHQgelaufen",  UpdateInterval = 20},
--		
--	},
--	Actions = 
--	{ 
--		
--		ChangeRace {NpcId = 7011, Race = 152}, -- grim wird neutral
--		Follow{Target = Avatar},
--		
--	}
--}	


----------------------------------
--Cutscene Inits
----------------------------------
-- Cutscene Init ElfDiscovered
Umspawn
{
	UnitId = self, Clan = 0, X = 227, Y = 422, Target = None, NoSpawnEffect = TRUE, OnlyOnce = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "CutsceneInitElfDiscovered", UpdateInterval = 5},
		Negated(FigureInRange{NpcId = self, X = 227, Y = 422, Range = 5}),		
	}, 
	Actions = 
	{
		SetNoFightFlagTrue {NpcId = self},	
		SetGlobalFlagFalse {Name = "CutsceneInitElfDiscovered"},				
	},
}

-- Cutscene Init Rekrutierung
Umspawn
{
	UnitId = self , Clan = 0 , X = 298, Y = 130, Target = None , NoSpawnEffect = TRUE , OnlyOnce = TRUE ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "CutsceneInitRekrutierung", UpdateInterval = 15},
		Negated(FigureInRange{NpcId = self, X = 298, Y = 130, Range = 5}),
	}, 
	Actions = 
	{
		SetNoFightFlagTrue {NpcId = self},
		SetGlobalFlagFalse {Name = "CutsceneInitRekrutierung"},			
	},
}

-- Cutscene Init Hauptquartier
Umspawn
{
	UnitId = self, Clan = 0, X = 223, Y = 299, Target = None, NoSpawnEffect = TRUE, OnlyOnce = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "CutsceneInitHauptquartierGrim", UpdateInterval = 5},
		Negated(FigureInRange{NpcId = self, X = 223, Y = 299, Range = 5}),		
	}, 
	Actions = 
	{
		SetNoFightFlagTrue {NpcId = self},	
		SetGlobalFlagFalse {Name = "CutsceneInitHauptquartierGrim"},				
	},
}




-- Cutscene Init Gefaengnis
Umspawn
{
	UnitId = self, Clan = 0, X = 259, Y = 138, Target = None, NoSpawnEffect = TRUE, OnlyOnce = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "CutsceneInitGefaengnisGrim", UpdateInterval = 5},
		Negated(FigureInRange{NpcId = self, X = 260, Y = 133, Range = 5}),		
	}, 
	Actions = 
	{
		SetNoFightFlagTrue {NpcId = self},	
		SetGlobalFlagFalse {Name = "CutsceneInitGefaengnisGrim"},				
	},
}

--Grim umspawnen, für Cutscene Gefängnis Teil II
Umspawn
{
	UnitId = self, X = 341 , Y = 245, NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "GrimZumTor", UpdateInterval = 10},
	} , 
	Actions = 
	{
		SetGlobalFlagFalse{Name = "GrimZumTor"},
	},
}

EndDefinition()

end
