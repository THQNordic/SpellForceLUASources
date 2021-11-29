-- P111 ... Weapon to Kill

AngriffsZeitenLeichtSpawnCamp01	= 45
AngriffsZeitenLeichtSpawnCamp02	= 45
AngriffsZeitenLeichtSpawnCamp03	= 45
AngriffsZeitenLeichtSpawnCamp04	= 45

AngriffsZeitenMittelSpawnCamp01 = 40
AngriffsZeitenMittelSpawnCamp02 = 40
AngriffsZeitenMittelSpawnCamp03 = 40
AngriffsZeitenMittelSpawnCamp04 = 40

AngriffsZeitenSchwerSpawnCamp01	= 30
AngriffsZeitenSchwerSpawnCamp02 = 30
AngriffsZeitenSchwerSpawnCamp03 = 30
AngriffsZeitenSchwerSpawnCamp04 = 30



--Schwierigkeitsgrad Leicht = 2-3 Angriffseinheiten, Mittel = 4-6 Angrifseinheiten und Schwer = 8-12 Angrifseinheiten
--Schwierigkeitsgrad Mittel = nach 35 Minuten, Schwer nach 1 Stunde
SchwierigkeitsGradMittel = 180
SchwierigkeitsGradSchwer = 360

----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- cutscene rename
--dofile("script/p111/n6991_CutsceneWeaponEntry.lua") 
--dofile("script/p111/n6991_CutsceneWeaponEnd.lua")  

dofile("script/p111/n32019_CutsceneWeaponEntry.lua") 
dofile("script/p111/n32020_CutsceneWeaponEnd.lua")  

dofile("script/p111/n0_ItemScript.lua")
dofile("script/FahrendeHaendler.lua")


--Zeit für Zufallsangriffe
OnPlatformOneTimeEvent
{
	Conditions =
	{
		
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
	
    },
	Actions =
	{
		SetGlobalTimeStamp {Name = "ZufallsangriffeGeisterP111"},
		
	}
}



--Schattengeister werden Aggro When...
--Monument geclaimed wurde

OnPlatformOneTimeEvent
{
	Conditions =
	{
		
		IsGlobalFlagTrue { Name = "MenschenMonumentGeclaimedP111"},
		
		FigureAlive { NpcId = 7039},
		FigureAlive { NpcId = 7038},
	
	
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7039},
		ChangeUnit { Unit = 1339, NpcId = 7039},
		ChangeRace { Race = 179, NpcId = 7038},
		ChangeUnit { Unit = 1338, NpcId = 7038},
		
	}
}




--Kleines Haupthaus
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		PlayerBuildingExists { BuildingId = 85 , Amount = 1 , OnlyWhenBuiltUp = FALSE , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7040},
		FigureAlive { NpcId = 7035},
		
		
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "KleinesHaupthausP111" },

	}
}

--Kleines Haupthaus
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7040},
		FigureAlive { NpcId = 7035},
		IsGlobalTimeElapsed {Name = "KleinesHaupthausP111", Seconds = 2, UpdateInterval = 60},
		 
    },
	Actions =
	{
		
		ChangeRace { Race = 179, NpcId = 7040},
		ChangeUnit { Unit = 1340, NpcId = 7040},
		
		
		ChangeRace { Race = 179, NpcId = 7035},
		ChangeUnit { Unit = 1338, NpcId = 7035},
	}
}






--Mittleres Haupthaus
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		PlayerBuildingExists { BuildingId = 86 , Amount = 1 , OnlyWhenBuiltUp = FALSE , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7050},
		FigureAlive { NpcId = 7049},
		FigureAlive { NpcId = 7042},
		FigureAlive { NpcId = 7045}, 
    },
	Actions =
	{
		
		SetGlobalTimeStamp { Name = "MittleresHaupthausP111" },
		
	}
}

--Mittleres Haupthaus
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7050},
		FigureAlive { NpcId = 7049},
		FigureAlive { NpcId = 7042},
		FigureAlive { NpcId = 7045},
		IsGlobalTimeElapsed {Name = "MittleresHaupthausP111", Seconds = 2, UpdateInterval = 60},
    },
	Actions =
	{
		
		
		ChangeRace { Race = 179, NpcId = 7050},
		ChangeUnit { Unit = 1340, NpcId = 7050},
		
		ChangeRace { Race = 179, NpcId = 7049},
		ChangeUnit { Unit = 1341, NpcId = 7049},
		
		ChangeRace { Race = 179, NpcId = 7042},
		ChangeUnit { Unit = 1338, NpcId = 7042},
		
		ChangeRace { Race = 179, NpcId = 7045},
		ChangeUnit { Unit = 1339, NpcId = 7045},
	}
}
--Großes Haupthaus
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		PlayerBuildingExists { BuildingId = 87 , Amount = 1 , OnlyWhenBuiltUp = TRUE , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7038},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7049}, 
		FigureAlive { NpcId = 7051},
		FigureAlive { NpcId = 7053},
		FigureAlive { NpcId = 7048},
		FigureAlive { NpcId = 7054}, 
		
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "GrossesHaupthausP111" },
		
	}
}

--Großes Haupthaus
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7038},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7049}, 
		FigureAlive { NpcId = 7051},
		FigureAlive { NpcId = 7053},
		FigureAlive { NpcId = 7048},
		FigureAlive { NpcId = 7054}, 
		IsGlobalTimeElapsed {Name = "GrossesHaupthausP111", Seconds = 2, UpdateInterval = 60},
		
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7036},
		ChangeUnit { Unit = 1339, NpcId = 7036},
		
		ChangeRace { Race = 179, NpcId = 7038},
		ChangeUnit { Unit = 1338, NpcId = 7038},
		
		ChangeRace { Race = 179, NpcId = 7041},
		ChangeUnit { Unit = 1339, NpcId = 7041},
		
		ChangeRace { Race = 179, NpcId = 7049},
		ChangeUnit { Unit = 1340, NpcId = 7049},
		
		ChangeRace { Race = 179, NpcId = 7051},
		ChangeUnit { Unit = 1341, NpcId = 7051},
		
		ChangeRace { Race = 179, NpcId = 7053},
		ChangeUnit { Unit = 1339, NpcId = 7053},
	
		ChangeRace { Race = 179, NpcId = 7048},
		ChangeUnit { Unit = 1340, NpcId = 7048},
			
		ChangeRace { Race = 179, NpcId = 7054},
		ChangeUnit { Unit = 1338, NpcId = 7054},
	}
}

--Mine
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		PlayerBuildingExists { BuildingId = 95 , Amount = 1 , OnlyWhenBuiltUp = FALSE , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7037},
		FigureAlive { NpcId = 7038},
		FigureAlive { NpcId = 7041}, 
		
	
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "MineP111" },
		
		
	}
}

--Mine
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7037},
		FigureAlive { NpcId = 7038},
		FigureAlive { NpcId = 7041}, 
		IsGlobalTimeElapsed {Name = "MineP111", Seconds = 2, UpdateInterval = 60},
		
	
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7036},
		ChangeUnit { Unit = 1340, NpcId = 7036},
				
		ChangeRace { Race = 179, NpcId = 7037},
		ChangeUnit { Unit = 1338, NpcId = 7037},
		
		ChangeRace { Race = 179, NpcId = 7038},
		ChangeUnit { Unit = 1339, NpcId = 7038},
		
		ChangeRace { Race = 179, NpcId = 7041},
		ChangeUnit { Unit = 1341, NpcId = 7041},
		
	}
}


--Mondsilbermine
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		PlayerBuildingExists { BuildingId = 89 , Amount = 1 , OnlyWhenBuiltUp = FALSE , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7052},
		FigureAlive { NpcId = 7043},
		FigureAlive { NpcId = 7040}, 
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "MondSilbermineP111" },
				
	}
}

--Mondsilbermine
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7052},
		FigureAlive { NpcId = 7043},
		FigureAlive { NpcId = 7040}, 
		IsGlobalTimeElapsed {Name = "MondSilbermineP111", Seconds = 2, UpdateInterval = 60},
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7036},
		ChangeUnit { Unit = 1338, NpcId = 7036},
		ChangeRace { Race = 179, NpcId = 7052},
		ChangeUnit { Unit = 1339, NpcId = 7052},
		ChangeRace { Race = 179, NpcId = 7043},
		ChangeUnit { Unit = 1341, NpcId = 7043},
		
		ChangeUnit { Unit = 1340, NpcId = 7040},
		ChangeRace { Race = 179, NpcId = 7040},
		
		
	}
}


--Onyxschrein
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		PlayerBuildingExists { BuildingId = 99 , Amount = 1 , OnlyWhenBuiltUp = TRUE , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7037},
		FigureAlive { NpcId = 7044},
		FigureAlive { NpcId = 7053},
		FigureAlive { NpcId = 7047}, 
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "OnyxSchreinP111" },
				
	}
}

--Onyxschrein
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7037},
		FigureAlive { NpcId = 7044},
		FigureAlive { NpcId = 7053},
		FigureAlive { NpcId = 7047}, 
		IsGlobalTimeElapsed {Name = "OnyxSchreinP111", Seconds = 2, UpdateInterval = 60},
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7037},
		ChangeUnit { Unit = 1339, NpcId = 7037},
		
		ChangeUnit { Unit = 1340, NpcId = 7044},
		ChangeRace { Race = 179, NpcId = 7044},
		
		ChangeRace { Race = 179, NpcId = 7053},
		ChangeUnit { Unit = 1341, NpcId = 7053},
		ChangeRace { Race = 179, NpcId = 7047},
		ChangeUnit { Unit = 1338, NpcId = 7047},
		
	}
}


--Geisterbrecher
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		PlayerBuildingExists { BuildingId = 103 , Amount = 1 , OnlyWhenBuiltUp = FALSE , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7034},
		FigureAlive { NpcId = 7039},
		FigureAlive { NpcId = 7042},
		FigureAlive { NpcId = 7045}, 
		FigureAlive { NpcId = 7050},
		FigureAlive { NpcId = 7048},
		
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "GeisterbrecherP111" },
	
	}
}

--Geisterbrecher
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7034},
		FigureAlive { NpcId = 7039},
		FigureAlive { NpcId = 7042},
		FigureAlive { NpcId = 7045}, 
		FigureAlive { NpcId = 7050},
		FigureAlive { NpcId = 7048},
		IsGlobalTimeElapsed {Name = "GeisterbrecherP111", Seconds = 2, UpdateInterval = 60},
		
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7034},
		ChangeUnit { Unit = 1338, NpcId = 7034},
		ChangeRace { Race = 179, NpcId = 7039},
		ChangeUnit { Unit = 1339, NpcId = 7039},
		ChangeRace { Race = 179, NpcId = 7042},
		ChangeUnit { Unit = 1341, NpcId = 7042},
	
		ChangeUnit { Unit = 1340, NpcId = 7045},
		ChangeRace { Race = 179, NpcId = 7045},
		
	
		ChangeRace { Race = 179, NpcId = 7050},
		ChangeUnit { Unit = 1340, NpcId = 7050},
		ChangeRace { Race = 179, NpcId = 7048},
		ChangeUnit { Unit = 1339, NpcId = 7048},
	}
}



--Hexerturm
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		PlayerBuildingExists { BuildingId = 102 , Amount = 1 , OnlyWhenBuiltUp = FALSE , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7035},
		FigureAlive { NpcId = 7038},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7046}, 
		FigureAlive { NpcId = 7052},
		FigureAlive { NpcId = 7049},
		
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "HexerTurmP111" },
		
	}
}

--Hexerturm
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7035},
		FigureAlive { NpcId = 7038},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7046}, 
		FigureAlive { NpcId = 7052},
		FigureAlive { NpcId = 7049},
		IsGlobalTimeElapsed {Name = "HexerTurmP111", Seconds = 2, UpdateInterval = 60},
		
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7035},
		ChangeUnit { Unit = 1339, NpcId = 7035},
		ChangeRace { Race = 179, NpcId = 7038},
		ChangeUnit { Unit = 1338, NpcId = 7038},
		ChangeRace { Race = 179, NpcId = 7041},
		ChangeUnit { Unit = 1339, NpcId = 7041},
		ChangeRace { Race = 179, NpcId = 7046},
		ChangeUnit { Unit = 1338, NpcId = 7046},
		
		ChangeUnit { Unit = 1340, NpcId = 7052},
		ChangeRace { Race = 179, NpcId = 7052},
		
		ChangeRace { Race = 179, NpcId = 7049},
		ChangeUnit { Unit = 1341, NpcId = 7049},
	}
}



--Onyxturm
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		PlayerBuildingExists { BuildingId = 100 , Amount = 1 , OnlyWhenBuiltUp = TRUE , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7037},
		FigureAlive { NpcId = 7043},
		FigureAlive { NpcId = 7047}, 
		FigureAlive { NpcId = 7052},
		
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "OnyxturmP111" },
		
		
	}
}

--Onyxturm
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7037},
		FigureAlive { NpcId = 7043},
		FigureAlive { NpcId = 7047}, 
		FigureAlive { NpcId = 7052},
		IsGlobalTimeElapsed {Name = "OnyxturmP111", Seconds = 2, UpdateInterval = 60},
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7036},
		ChangeUnit { Unit = 1338, NpcId = 7036},
		ChangeRace { Race = 179, NpcId = 7037},
		ChangeUnit { Unit = 1339, NpcId = 7037},
		
		ChangeUnit { Unit = 1340, NpcId = 7043},
		ChangeRace { Race = 179, NpcId = 7043},
		
		ChangeRace { Race = 179, NpcId = 7047},
		ChangeUnit { Unit = 1341, NpcId = 7047},
		ChangeRace { Race = 179, NpcId = 7052},
		ChangeUnit { Unit = 1339, NpcId = 7052},
		
	}
}


--Schattenschmiede
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		PlayerBuildingExists { BuildingId = 133 , Amount = 1 , OnlyWhenBuiltUp = TRUE , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7037},
		FigureAlive { NpcId = 7035},
		FigureAlive { NpcId = 7040},
		FigureAlive { NpcId = 7043},
		FigureAlive { NpcId = 7049},
		  
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "SchattenschmiedeP111" },
				
	}
}


--Schattenschmiede
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7037},
		FigureAlive { NpcId = 7035},
		FigureAlive { NpcId = 7040},
		FigureAlive { NpcId = 7043},
		FigureAlive { NpcId = 7049},
		IsGlobalTimeElapsed {Name = "SchattenschmiedeP111", Seconds = 2, UpdateInterval = 60},
		  
    },
	Actions =
	{
		
		ChangeRace { Race = 179, NpcId = 7037},
		ChangeUnit { Unit = 1339, NpcId = 7037},
		
		ChangeRace { Race = 179, NpcId = 7035},
		ChangeUnit { Unit = 1338, NpcId = 7035},
		
		ChangeUnit { Unit = 1340, NpcId = 7040},
		ChangeRace { Race = 179, NpcId = 7040},
		
		ChangeRace { Race = 179, NpcId = 7043},
		ChangeUnit { Unit = 1341, NpcId = 7043},
		ChangeRace { Race = 179, NpcId = 7049},
		ChangeUnit { Unit = 1340, NpcId = 7049},
		
	}
}


--Schwarze Schmiede
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		PlayerBuildingExists { BuildingId = 104 , Amount = 1 , OnlyWhenBuiltUp = TRUE , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7038},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7044}, 
		FigureAlive { NpcId = 7045},
		FigureAlive { NpcId = 7050},
		
		
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "SchwarzeschmiedeP111" },
			
	}
}

--Schwarze Schmiede
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7038},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7044}, 
		FigureAlive { NpcId = 7045},
		FigureAlive { NpcId = 7050},
		IsGlobalTimeElapsed {Name = "SchwarzeschmiedeP111", Seconds = 2, UpdateInterval = 60},
		
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7038},
		ChangeUnit { Unit = 1338, NpcId = 7038},
		ChangeRace { Race = 179, NpcId = 7036},
		ChangeUnit { Unit = 1339, NpcId = 7036},
		ChangeRace { Race = 179, NpcId = 7041},
		ChangeUnit { Unit = 1341, NpcId = 7041},
		
		ChangeUnit { Unit = 1340, NpcId = 7044},
		ChangeRace { Race = 179, NpcId = 7044},
	
		ChangeUnit { Unit = 1340, NpcId = 7045},
		ChangeRace { Race = 179, NpcId = 7045},
		
		ChangeRace { Race = 179, NpcId = 7050},
		ChangeUnit { Unit = 1338, NpcId = 7050},
	}
}

--Steinbruch
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		PlayerBuildingExists { BuildingId = 88 , Amount = 1 , OnlyWhenBuiltUp = TRUE , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7042},
	
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "SteinbruchP111" },
			
	}
}

--Steinbruch
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7042},
		IsGlobalTimeElapsed {Name = "SteinbruchP111", Seconds = 2, UpdateInterval = 60},
	
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7041},
		ChangeUnit { Unit = 1339, NpcId = 7041},
		
		ChangeRace { Race = 179, NpcId = 7042},
		ChangeUnit { Unit = 1340, NpcId = 7042},
			
	}
}



--Schmiede
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		PlayerBuildingExists { BuildingId = 96 , Amount = 1 , OnlyWhenBuiltUp = TRUE , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7036},
		
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "SchmiedeP111" },
	
	}
}

--Schmiede
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7036},
		IsGlobalTimeElapsed {Name = "SchmiedeP111", Seconds = 2, UpdateInterval = 60},
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7041},
		ChangeUnit { Unit = 1339, NpcId = 7041},
		
		ChangeRace { Race = 179, NpcId = 7036},
		ChangeUnit { Unit = 1338, NpcId = 7036},
	
	}
}

--ZufallsangriffeGeister

OnPlatformOneTimeEvent
{
	Conditions =
	{
		ODER(ODER(IsGlobalTimeElapsed { Name = "ZufallsangriffeGeisterP111", Seconds  = 600, UpdateInterval = 10}, IsGlobalTimeElapsed { Name = "ZufallsangriffeGeisterP111", Seconds  = 1000, UpdateInterval = 10}),
			ODER(IsGlobalTimeElapsed { Name = "ZufallsangriffeGeisterP111", Seconds  = 1600, UpdateInterval = 10}, IsGlobalTimeElapsed { Name = "ZufallsangriffeGeisterP111", Seconds  = 2000, UpdateInterval = 10})),
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7046},
		FigureAlive { NpcId = 7052},
		FigureAlive { NpcId = 7048}, 
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "ZufallP111" },
		
	}
}

--ZufallsangriffeGeister

OnPlatformOneTimeEvent
{
	Conditions =
	{
		
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7046},
		FigureAlive { NpcId = 7052},
		FigureAlive { NpcId = 7048}, 
		IsGlobalTimeElapsed {Name = "ZufallP111", Seconds = 2, UpdateInterval = 60},
		
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7036},
		ChangeUnit { Unit = 1339, NpcId = 7036},
		
		ChangeRace { Race = 179, NpcId = 7046},
		ChangeUnit { Unit = 1338, NpcId = 7046},
		
		ChangeRace { Race = 179, NpcId = 7052},
		ChangeUnit { Unit = 1340, NpcId = 7052},
		
		
		ChangeRace { Race = 179, NpcId = 7048},
		ChangeUnit { Unit = 1341, NpcId = 7048},
		
	
	}
}








--Zufallsangriffe Geister bei Ressourcenanzahl
OnPlatformOneTimeEvent
{
	Conditions =
	{
		PlayerHasGood{ Good = GoodStone, Amount = 200 , Side = SideDark , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7034},
		FigureAlive { NpcId = 7038},
		FigureAlive { NpcId = 7040},
		FigureAlive { NpcId = 7047},
		 
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "SteinP111" },
	
	}
}

--Zufallsangriffe Geister bei Ressourcenanzahl
OnPlatformOneTimeEvent
{
	Conditions =
	{
		
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7034},
		FigureAlive { NpcId = 7038},
		FigureAlive { NpcId = 7040},
		FigureAlive { NpcId = 7047},
		IsGlobalTimeElapsed {Name = "SteinP111", Seconds = 2, UpdateInterval = 60},
		 
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7034},
		ChangeUnit { Unit = 1339, NpcId = 7034},
		
		ChangeRace { Race = 179, NpcId = 7038},
		ChangeUnit { Unit = 1338, NpcId = 7038},
		
		ChangeRace { Race = 179, NpcId = 7040},
		ChangeUnit { Unit = 1340, NpcId = 7040},
		
		ChangeRace { Race = 179, NpcId = 7047},
		ChangeUnit { Unit = 1341, NpcId = 7047},
	
	}
}



--Zufallsangriffe Geister bei Ressourcenanzahl
OnPlatformOneTimeEvent
{
	Conditions =
	{
		PlayerHasGood{ Good = GoodIron, Amount = 200 , Side = SideDark , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7034},
		FigureAlive { NpcId = 7038},
		FigureAlive { NpcId = 7040},
		FigureAlive { NpcId = 7047}, 
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "EisenP111" },
	
	}
}
--Zufallsangriffe Geister bei Ressourcenanzahl
OnPlatformOneTimeEvent
{
	Conditions =
	{
	
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7034},
		FigureAlive { NpcId = 7038},
		FigureAlive { NpcId = 7040},
		FigureAlive { NpcId = 7047}, 
		IsGlobalTimeElapsed {Name = "EisenP111", Seconds = 2, UpdateInterval = 60},
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7034},
		ChangeUnit { Unit = 1339, NpcId = 7034},
		ChangeRace { Race = 179, NpcId = 7038},
		ChangeUnit { Unit = 1338, NpcId = 7038},
		
		ChangeUnit { Unit = 1340, NpcId = 7040},
		ChangeRace { Race = 179, NpcId = 7040},
		
		ChangeRace { Race = 179, NpcId = 7047},
		ChangeUnit { Unit = 1341, NpcId = 7047},
	
	}
}


--Zufallsangriffe Geister bei Ressourcenanzahl

OnPlatformOneTimeEvent
{
	Conditions =
	{
		PlayerHasGood{ Good = GoodStone, Amount = 500 , Side = SideDark , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7052},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7037}, 
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "Stein2P111" },
	
	}
}


--Zufallsangriffe Geister bei Ressourcenanzahl

OnPlatformOneTimeEvent
{
	Conditions =
	{
		
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7052},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7037}, 
		IsGlobalTimeElapsed {Name = "Stein2P111", Seconds = 2, UpdateInterval = 60},
		
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7036},
		ChangeUnit { Unit = 1339, NpcId = 7036},
		
		ChangeRace { Race = 179, NpcId = 7037},
		ChangeUnit { Unit = 1338, NpcId = 7037},
		
		
		ChangeUnit { Unit = 1340, NpcId = 7041},
		ChangeRace { Race = 179, NpcId = 7041},
		
		ChangeRace { Race = 179, NpcId = 7052},
		ChangeUnit { Unit = 1341, NpcId = 7052},
	
	}
}


--Zufallsangriffe Geister bei Ressourcenanzahl

OnPlatformOneTimeEvent
{
	Conditions =
	{
		PlayerHasGood{ Good = GoodIron, Amount = 1000 , Side = SideDark , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7052},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7037}, 
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "Eisen2P111" },
	
	}
}


--Zufallsangriffe Geister bei Ressourcenanzahl

OnPlatformOneTimeEvent
{
	Conditions =
	{
		
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7052},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7037}, 
		IsGlobalTimeElapsed {Name = "Eisen2P111", Seconds = 2, UpdateInterval = 60},
		
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7036},
		ChangeUnit { Unit = 1339, NpcId = 7036},
		
		ChangeRace { Race = 179, NpcId = 7037},
		ChangeUnit { Unit = 1338, NpcId = 7037},
		
		
		ChangeUnit { Unit = 1340, NpcId = 7041},
		ChangeRace { Race = 179, NpcId = 7041},
		
		ChangeRace { Race = 179, NpcId = 7052},
		ChangeUnit { Unit = 1341, NpcId = 7052},
	
	}
}





OnPlatformOneTimeEvent
{
	Conditions =
	{
		PlayerHasGood{ Good = GoodMithril, Amount = 200 , Side = SideDark , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7052},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7037}, 
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "MithrilP111" },
	
	}
}
OnPlatformOneTimeEvent
{
	Conditions =
	{
		
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7052},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7037}, 
		IsGlobalTimeElapsed {Name = "MithrilP111", Seconds = 2, UpdateInterval = 60},
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7036},
		ChangeUnit { Unit = 1339, NpcId = 7036},
	
		ChangeRace { Race = 179, NpcId = 7037},	
		ChangeUnit { Unit = 1338, NpcId = 7037},
	
		
		ChangeUnit { Unit = 1340, NpcId = 7041},
		ChangeRace { Race = 179, NpcId = 7041},
		
		ChangeRace { Race = 179, NpcId = 7052},
		ChangeUnit { Unit = 1341, NpcId = 7052},
	
	}
}

OnPlatformOneTimeEvent
{
	Conditions =
	{
		PlayerHasGood{ Good = GoodMithril, Amount = 1000 , Side = SideDark , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7052},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7037}, 
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "Mithril2P111" },
	
	}
}
OnPlatformOneTimeEvent
{
	Conditions =
	{
		
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7052},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7037}, 
		IsGlobalTimeElapsed {Name = "Mithril2P111", Seconds = 2, UpdateInterval = 60},
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7036},
		ChangeUnit { Unit = 1339, NpcId = 7036},
	
		ChangeRace { Race = 179, NpcId = 7037},	
		ChangeUnit { Unit = 1338, NpcId = 7037},
	
		
		ChangeUnit { Unit = 1340, NpcId = 7041},
		ChangeRace { Race = 179, NpcId = 7041},
		
		ChangeRace { Race = 179, NpcId = 7052},
		ChangeUnit { Unit = 1341, NpcId = 7052},
	
	}
}



OnPlatformOneTimeEvent
{
	Conditions =
	{
		PlayerHasGood{ Good = GoodManaElixir, Amount = 200 , Side = SideDark , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7052},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7037}, 
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "AriaP111" },
	}
}

OnPlatformOneTimeEvent
{
	Conditions =
	{
		
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7052},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7037}, 
		IsGlobalTimeElapsed {Name = "AriaP111", Seconds = 2, UpdateInterval = 60},
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7036},
		ChangeUnit { Unit = 1339, NpcId = 7036},
	
		ChangeRace { Race = 179, NpcId = 7037},	
		ChangeUnit { Unit = 1338, NpcId = 7037},
	
		
		ChangeUnit { Unit = 1340, NpcId = 7041},
		ChangeRace { Race = 179, NpcId = 7041},
		
		ChangeRace { Race = 179, NpcId = 7052},
		ChangeUnit { Unit = 1341, NpcId = 7052},
	
	}
}




OnPlatformOneTimeEvent
{
	Conditions =
	{
		PlayerHasGood{ Good = GoodFood, Amount = 250 , Side = SideDark , Player = self},
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7052},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7037}, 
    },
	Actions =
	{
		SetGlobalTimeStamp { Name = "LebensmittelP111" },
	}
}

OnPlatformOneTimeEvent
{
	Conditions =
	{
		
		IsGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		FigureAlive { NpcId = 7036},
		FigureAlive { NpcId = 7052},
		FigureAlive { NpcId = 7041},
		FigureAlive { NpcId = 7037}, 
		IsGlobalTimeElapsed {Name = "LebensmittelP111", Seconds = 2, UpdateInterval = 60},
    },
	Actions =
	{
		ChangeRace { Race = 179, NpcId = 7036},
		ChangeUnit { Unit = 1339, NpcId = 7036},
		
		ChangeRace { Race = 179, NpcId = 7037},
		ChangeUnit { Unit = 1338, NpcId = 7037},
		
		
		ChangeUnit { Unit = 1340, NpcId = 7041},
		ChangeRace { Race = 179, NpcId = 7041},
		
		ChangeRace { Race = 179, NpcId = 7052},
		ChangeUnit { Unit = 1341, NpcId = 7052},
	
	}
}





--Schattenring im Inventar

OnQuestItemFound
{
	ItemId = 4175,
	ItemFlagName = "PlayerHasItemSchattenring" ,
	Amount = 1,
	Actions = 
	{
		
	},
}


OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 20},
		IsMonumentInUse {X = 231, Y = 295, Range = 3, UpdateInterval = 20},
    },
	Actions =
	{
		SetGlobalFlagTrue { Name = "StartAngriffeSchattenP111"},
		SetGlobalTimeStamp {Name = "SchwierigkeitsGradMittelP111"},
		SetGlobalTimeStamp {Name = "SchwierigkeitsGradSchwerP111"},
	}
}
rem = [[
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring"},
    	IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"}, 
		Negated(IsMonumentInUse {X = 231, Y = 295, Range = 3, UpdateInterval = 60}),
    },
	Actions =
	{
		SetGlobalFlagFalse { Name = "StartAngriffeSchattenP111"},
		ClearGlobalTimeStamp {Name = "SchwierigkeitsGradMittelP111"},
		ClearGlobalTimeStamp {Name = "SchwierigkeitsGradSchwerP111"},

		-- darkelves heimschicken kann nicht schaden, oder?
		SetGlobalFlagTrue {Name = "DarkElvesIdleGoHomeP111"},
		ResetGlobalCounter { Name = "CounterGoHomeP111"},
	}
}
]]

--Schatten können nun getötet werden, sie respawnen nicht mehr!
OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
    },
	Actions =
	{
		SetGlobalFlagTrue { Name = "GeisterDespawnP111"},
	}
}

--Schatteneinheiten und Schattengebäude werden für den Spieler sichtbar!

OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
		
				
    },
	Actions =
	{
		PlaceObject {X = 336 , Y = 324 , Object = 2567, Angle = 90},	--Schrein
		PlaceObject {X = 97 , Y = 465 , Object = 2825, Angle = 0},		--DunkleKristalle Spawnpoint Schatten
		PlaceObject {X = 96 , Y = 430 , Object = 2825, Angle = 0},
		PlaceObject {X = 171 , Y = 427 , Object = 2825, Angle = 0},
		PlaceObject {X = 365 , Y = 384 , Object = 2825, Angle = 0},
		PlaceObject {X = 419 , Y = 337 , Object = 2825, Angle = 0},
		PlaceObject {X = 256 , Y = 129 , Object = 2825, Angle = 0},
		PlaceObject {X = 338 , Y = 98 , Object = 2825, Angle = 0},
		PlaceObject {X = 321 , Y = 151 , Object = 2825, Angle = 0},
		PlaceObject {X = 77 , Y = 149 , Object = 2825, Angle = 0},
		PlaceObject {X = 115 , Y = 100 , Object = 2825, Angle = 0},
		PlaceObject {X = 118 , Y = 130 , Object = 2825, Angle = 0},
		--PlaceObject {X = 114 , Y = 451 , Object = 2883, Angle = 90},				--ElementarFeuer An
		--PlaceObject {X = 388 , Y = 377 , Object = 2883, Angle = 90},
		--PlaceObject {X = 306 , Y = 127 , Object = 2883, Angle = 90},
		--PlaceObject {X = 91 , Y = 126 , Object = 2883, Angle = 90},
		
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		
		
				
    },
	Actions =
	{
	
		PlaceObject {X = 114 , Y = 451 , Object = 2883, Angle = 90},				--ElementarFeuer An
		PlaceObject {X = 388 , Y = 377 , Object = 2883, Angle = 90},
		PlaceObject {X = 306 , Y = 127 , Object = 2883, Angle = 90},
		PlaceObject {X = 91 , Y = 126 , Object = 2883, Angle = 90},
		
	}
}













-- SchwierigkeitsgradEinstellung

OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},  
		IsGlobalTimeElapsed { Name = "SchwierigkeitsGradMittelP111", Seconds  = SchwierigkeitsGradMittel, UpdateInterval = 10},
	
    },
	Actions =
	{
		IncreaseGlobalCounter {Name = "SchwierigkeitsgradP111"},
		--Outcry { NpcId = 6948, String = "Schwierigkeitsgrad Mittel!" , Tag ="" , Color = ColorWhite},
	}
}

-- SchwierigkeitsgradEinstellung

OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"}, 
		IsGlobalTimeElapsed { Name = "SchwierigkeitsGradSchwerP111", Seconds  = SchwierigkeitsGradSchwer, UpdateInterval = 10},
	
    },
	Actions =
	{
		IncreaseGlobalCounter {Name = "SchwierigkeitsgradP111"},
		--Outcry { NpcId = 6948, String = "Schwierigkeitsgrad Schwer!" , Tag ="" , Color = ColorWhite},
	}
}

-- Wahl des SpawnCamps für den Angriff CAMP2

OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "StartAngriffeSchattenP111"},
		IsGlobalCounter { Name = "AuswahlCampP111", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Schwierigkeitsgrad (0 --> Leicht, 1 --> Mittel, 2 --> Schwer)
		IsGlobalCounter { Name = "EinmalSchleifeCamp02P111", Operator = IsEqual, Value = 0, UpdateInterval = 60},
		IsGlobalFlagFalse { Name = "DarkElvesIdleGoHomeP111"},
    },
	Actions =
	{
		--Outcry { NpcId = 6948, String = "AuswahlCamp02" , Tag ="" , Color = ColorWhite},
		SetGlobalTimeStamp {Name = "AngriffsZeitLeichtSpawnCamp02P111"},
		SetGlobalTimeStamp {Name = "AngriffsZeitMittelSpawnCamp02P111"},
		SetGlobalTimeStamp {Name = "AngriffsZeitSchwerSpawnCamp02P111"},
		IncreaseGlobalCounter {Name = "EinmalSchleifeCamp02P111"},
		
	}
}




-- Wahl des SpawnCamps für den Angriff CAMP4
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "StartAngriffeSchattenP111"},
		IsGlobalCounter { Name = "AuswahlCampP111", Operator = IsEqual, Value = 1, UpdateInterval = 60}, --Schwierigkeitsgrad (0 --> Leicht, 1 --> Mittel, 2 --> Schwer)
		IsGlobalCounter { Name = "EinmalSchleifeCamp04P111", Operator = IsEqual, Value = 0, UpdateInterval = 60},
		IsGlobalFlagFalse { Name = "DarkElvesIdleGoHomeP111"},
    },
	Actions =
	{
		--Outcry { NpcId = 6948, String = "AuswahlCamp04" , Tag ="" , Color = ColorWhite},
		SetGlobalTimeStamp {Name = "AngriffsZeitLeichtSpawnCamp04P111"},
		SetGlobalTimeStamp {Name = "AngriffsZeitMittelSpawnCamp04P111"},
		SetGlobalTimeStamp {Name = "AngriffsZeitSchwerSpawnCamp04P111"},
		IncreaseGlobalCounter {Name = "EinmalSchleifeCamp04P111"},
	}
}



-- Wahl des SpawnCamps für den Angriff CAMP1
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "StartAngriffeSchattenP111"},
		IsGlobalCounter { Name = "AuswahlCampP111", Operator = IsEqual, Value = 2, UpdateInterval = 60}, --Schwierigkeitsgrad (0 --> Leicht, 1 --> Mittel, 2 --> Schwer)
		IsGlobalCounter { Name = "EinmalSchleifeCamp01P111", Operator = IsEqual, Value = 0, UpdateInterval = 60},
		IsGlobalFlagFalse { Name = "DarkElvesIdleGoHomeP111"},
    },
	Actions =
	{
		--Outcry { NpcId = 6948, String = "AuswahlCamp01" , Tag ="" , Color = ColorWhite},
		SetGlobalTimeStamp {Name = "AngriffsZeitLeichtSpawnCamp01P111"},
		SetGlobalTimeStamp {Name = "AngriffsZeitMittelSpawnCamp01P111"},
		SetGlobalTimeStamp {Name = "AngriffsZeitSchwerSpawnCamp01P111"},
		IncreaseGlobalCounter {Name = "EinmalSchleifeCamp01P111"},
	}
}


-- Wahl des SpawnCamps für den Angriff CAMP3
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "StartAngriffeSchattenP111"},
		IsGlobalCounter { Name = "AuswahlCampP111", Operator = IsEqual, Value = 3, UpdateInterval = 60}, --Schwierigkeitsgrad (0 --> Leicht, 1 --> Mittel, 2 --> Schwer)
		IsGlobalCounter { Name = "EinmalSchleifeCamp03P111", Operator = IsEqual, Value = 0, UpdateInterval = 60},
		IsGlobalFlagFalse { Name = "DarkElvesIdleGoHomeP111"},
    },
	Actions =
	{
		--Outcry { NpcId = 6948, String = "AuswahlCamp03" , Tag ="" , Color = ColorWhite},
		SetGlobalTimeStamp {Name = "AngriffsZeitLeichtSpawnCamp03P111"},
		SetGlobalTimeStamp {Name = "AngriffsZeitMittelSpawnCamp03P111"},
		SetGlobalTimeStamp {Name = "AngriffsZeitSchwerSpawnCamp03P111"},
		IncreaseGlobalCounter {Name = "EinmalSchleifeCamp03P111"},
	}
}



-- Rücksetzen des AuswahlCampZaehlers
OnEvent
{
	Conditions =
	{
		IsGlobalCounter { Name = "AuswahlCampP111", Operator = IsGreaterOrEqual, Value = 4, UpdateInterval = 60}, --Schwierigkeitsgrad (0 --> Leicht, 1 --> Mittel, 2 --> Schwer)
		
    },
	Actions =
	{
		--Outcry { NpcId = 6948, String = "Rücksetzen AuswahlCamp" , Tag ="" , Color = ColorWhite},
		ResetGlobalCounter { Name = "AuswahlCampP111" },
	}
}

















-----------------------------------------------------------------------------------
------	   		SpawnCamp01 greift an, Schwierigkeitsgrad Leicht         ----------
-----------------------------------------------------------------------------------

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		
		IsGlobalTimeElapsed { Name = "AngriffsZeitLeichtSpawnCamp01P111", Seconds = AngriffsZeitenLeichtSpawnCamp01, UpdateInterval = 10}, --Wenn nach dem TimeStmap, 2 Stunden vergangen sind wird die Bedingung ein.
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp01P111", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht wird angegriffen 
		IsGlobalCounter { Name = "SchwierigkeitsgradP111", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Schwierigkeitsgrad (0 --> Leicht, 1 --> Mittel, 2 --> Schwer)
	},
	Actions =	
	{
		--Outcry { NpcId = 6948, String = "Angriff Camp01 Leicht" , Tag ="" , Color = ColorWhite},
		Goto { X = 230 , Y = 286 , NpcId = 6884 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, --MoonUnits greifen an
		Goto { X = 230 , Y = 286 , NpcId = 6886 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6890 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitLeichtSpawnCamp01P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitMittelSpawnCamp01P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitSchwerSpawnCamp01P111"},
		IncreaseGlobalCounter {Name = "AngriffsZaehlerSpawnCamp01P111"},
		IncreaseGlobalCounter {Name = "AuswahlCampP111"},
		ResetGlobalCounter { Name = "EinmalSchleifeCamp01P111"}, 
	}
	
}


OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp01P111", Operator = IsEqual, Value = 1, UpdateInterval = 60}, -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		--SetGlobalTimeStamp{Name = "AngriffsZeitSpawnCamp01P111"},
		ResetGlobalCounter { Name = "AngriffsZaehlerSpawnCamp01P111" }, --Der Angriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal ein Angriff innerhalb von 4h gestartet wird 
		
	}
	
}

-----------------------------------------------------------------------------------
------	   		SpawnCamp01 greift an, Schwierigkeitsgrad Mittel         ----------
-----------------------------------------------------------------------------------

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		
		IsGlobalTimeElapsed { Name = "AngriffsZeitMittelSpawnCamp01P111", Seconds = AngriffsZeitenMittelSpawnCamp01, UpdateInterval = 10}, --Wenn nach dem TimeStmap, 2 Stunden vergangen sind wird die Bedingung ein.
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp01P111", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht wird angegriffen 
		IsGlobalCounter { Name = "SchwierigkeitsgradP111", Operator = IsEqual, Value = 1, UpdateInterval = 60}, --Schwierigkeitsgrad (0 --> Leicht, 1 --> Mittel, 2 --> Schwer)
	},
	Actions =	
	{
	
		--Outcry { NpcId = 6948, String = "Angriff Camp01 Mittel" , Tag ="" , Color = ColorWhite},
		Goto { X = 230 , Y = 286 , NpcId = 6884 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, --MoonUnits greifen an
		Goto { X = 230 , Y = 286 , NpcId = 6881 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6886 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6887 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6890 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6892 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitLeichtSpawnCamp01P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitMittelSpawnCamp01P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitSchwerSpawnCamp01P111"},
		IncreaseGlobalCounter {Name = "AngriffsZaehlerSpawnCamp01P111"},
		IncreaseGlobalCounter {Name = "AuswahlCampP111"},
		ResetGlobalCounter { Name = "EinmalSchleifeCamp01P111"}, 
	}
	
}


OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp01P111", Operator = IsEqual, Value = 1, UpdateInterval = 60}, -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		--SetGlobalTimeStamp{Name = "AngriffsZeitSpawnCamp01P111"},
		ResetGlobalCounter { Name = "AngriffsZaehlerSpawnCamp01P111" }, --Der Angriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal ein Angriff innerhalb von 4h gestartet wird 
		
	}
	
}

-----------------------------------------------------------------------------------
------	   		SpawnCamp01 greift an, Schwierigkeitsgrad Schwer         ----------
-----------------------------------------------------------------------------------


OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		
		IsGlobalTimeElapsed { Name = "AngriffsZeitSchwerSpawnCamp01P111", Seconds = AngriffsZeitenSchwerSpawnCamp01, UpdateInterval = 10}, --Wenn nach dem TimeStmap, 2 Stunden vergangen sind wird die Bedingung ein.
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp01P111", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht wird angegriffen 
		IsGlobalCounter { Name = "SchwierigkeitsgradP111", Operator = IsEqual, Value = 2, UpdateInterval = 60}, --Schwierigkeitsgrad (0 --> Leicht, 1 --> Mittel, 2 --> Schwer)
	},
	Actions =	
	{
		--Outcry { NpcId = 6948, String = "Angriff Camp01 Schwer" , Tag ="" , Color = ColorWhite},
		Goto { X = 230 , Y = 286 , NpcId = 6881 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, --MoonUnits greifen an
		Goto { X = 230 , Y = 286 , NpcId = 6882 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6883 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6884 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6885 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6886 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6887 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, --MoonUnits greifen an
		Goto { X = 230 , Y = 286 , NpcId = 6888 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6889 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6890 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6891 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6892 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitLeichtSpawnCamp01P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitMittelSpawnCamp01P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitSchwerSpawnCamp01P111"},
		
		IncreaseGlobalCounter {Name = "AngriffsZaehlerSpawnCamp01P111"},
		IncreaseGlobalCounter {Name = "AuswahlCampP111"},
		ResetGlobalCounter { Name = "EinmalSchleifeCamp01P111"}, 
	}
	
}


OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp01P111", Operator = IsEqual, Value = 1, UpdateInterval = 60}, -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		--SetGlobalTimeStamp{Name = "AngriffsZeitSpawnCamp01P111"},
		ResetGlobalCounter { Name = "AngriffsZaehlerSpawnCamp01P111" }, --Der Angriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal ein Angriff innerhalb von 4h gestartet wird 
		
	}
	
}



-----------------------------------------------------------------------------------
------	   		SpawnCamp02 greift an, Schwierigkeitsgrad Leicht         ----------
-----------------------------------------------------------------------------------

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		
		IsGlobalTimeElapsed { Name = "AngriffsZeitLeichtSpawnCamp02P111", Seconds = AngriffsZeitenLeichtSpawnCamp02, UpdateInterval = 10}, --Wenn nach dem TimeStmap, 2 Stunden vergangen sind wird die Bedingung ein.
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp02P111", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht wird angegriffen 
		IsGlobalCounter { Name = "SchwierigkeitsgradP111", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Schwierigkeitsgrad (0 --> Leicht, 1 --> Mittel, 2 --> Schwer)
	},
	Actions =	
	{
		--Outcry { NpcId = 6948, String = "Angriff Camp02 Leicht" , Tag ="" , Color = ColorWhite},
		Goto { X = 230 , Y = 286 , NpcId = 7099, Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, --MoonUnits greifen an
		Goto { X = 230 , Y = 286 , NpcId = 6897 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitLeichtSpawnCamp02P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitMittelSpawnCamp02P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitSchwerSpawnCamp02P111"},
		IncreaseGlobalCounter {Name = "AngriffsZaehlerSpawnCamp02P111"},
		IncreaseGlobalCounter {Name = "AuswahlCampP111"},
		ResetGlobalCounter { Name = "EinmalSchleifeCamp02P111"}, 
	}
	
}


OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp02P111", Operator = IsEqual, Value = 1, UpdateInterval = 60}, -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		--SetGlobalTimeStamp{Name = "AngriffsZeitSpawnCamp02P111"},
		ResetGlobalCounter { Name = "AngriffsZaehlerSpawnCamp02P111" }, --Der Angriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal ein Angriff innerhalb von 4h gestartet wird 
		
	}
	
}


-----------------------------------------------------------------------------------
------	   		SpawnCamp02 greift an, Schwierigkeitsgrad Mittel         ----------
-----------------------------------------------------------------------------------

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		
		IsGlobalTimeElapsed { Name = "AngriffsZeitMittelSpawnCamp02P111", Seconds = AngriffsZeitenMittelSpawnCamp02, UpdateInterval = 10}, --Wenn nach dem TimeStmap, 2 Stunden vergangen sind wird die Bedingung ein.
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp02P111", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht wird angegriffen 
		IsGlobalCounter { Name = "SchwierigkeitsgradP111", Operator = IsEqual, Value = 1, UpdateInterval = 60}, --Schwierigkeitsgrad (0 --> Leicht, 1 --> Mittel, 2 --> Schwer)
	},
	Actions =	
	{
		--Outcry { NpcId = 6948, String = "Angriff Camp02 Mittel" , Tag ="" , Color = ColorWhite},
		Goto { X = 230 , Y = 286 , NpcId = 7099 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, --MoonUnits greifen an
		Goto { X = 230 , Y = 286 , NpcId = 6895 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6897 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6899 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitLeichtSpawnCamp02P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitMittelSpawnCamp02P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitSchwerSpawnCamp02P111"},
		
		
		IncreaseGlobalCounter {Name = "AngriffsZaehlerSpawnCamp02P111"},
		IncreaseGlobalCounter {Name = "AuswahlCampP111"},
		ResetGlobalCounter { Name = "EinmalSchleifeCamp02P111"}, 
	}
	
}


OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp02P111", Operator = IsEqual, Value = 1, UpdateInterval = 60}, -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		--SetGlobalTimeStamp{Name = "AngriffsZeitSpawnCamp02P111"},
		ResetGlobalCounter { Name = "AngriffsZaehlerSpawnCamp02P111" }, --Der Angriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal ein Angriff innerhalb von 4h gestartet wird 
		
	}
	
}

-----------------------------------------------------------------------------------
------	   		SpawnCamp02 greift an, Schwierigkeitsgrad Schwer         ----------
-----------------------------------------------------------------------------------

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		
		IsGlobalTimeElapsed { Name = "AngriffsZeitSchwerSpawnCamp02P111", Seconds = AngriffsZeitenSchwerSpawnCamp02, UpdateInterval = 10}, --Wenn nach dem TimeStmap, 2 Stunden vergangen sind wird die Bedingung ein.
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp02P111", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht wird angegriffen 
		IsGlobalCounter { Name = "SchwierigkeitsgradP111", Operator = IsEqual, Value = 2, UpdateInterval = 60}, --Schwierigkeitsgrad (0 --> Leicht, 1 --> Mittel, 2 --> Schwer)
	},
	Actions =	
	{
		--Outcry { NpcId = 6948, String = "Angriff Camp02 Schwer" , Tag ="" , Color = ColorWhite},
		Goto { X = 230 , Y = 286 , NpcId = 7099 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, --MoonUnits greifen an
		Goto { X = 230 , Y = 286 , NpcId = 6894 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6895 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 7098 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6897 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, --MoonUnits greifen an
		Goto { X = 230 , Y = 286 , NpcId = 6898 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6899 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6900 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitLeichtSpawnCamp02P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitMittelSpawnCamp02P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitSchwerSpawnCamp02P111"},
		
		IncreaseGlobalCounter {Name = "AngriffsZaehlerSpawnCamp02P111"},
		IncreaseGlobalCounter {Name = "AuswahlCampP111"},
		ResetGlobalCounter { Name = "EinmalSchleifeCamp02P111"}, 
	}
	
}


OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp02P111", Operator = IsEqual, Value = 1, UpdateInterval = 60}, -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		--SetGlobalTimeStamp{Name = "AngriffsZeitSpawnCamp02P111"},
		ResetGlobalCounter { Name = "AngriffsZaehlerSpawnCamp02P111" }, --Der Angriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal ein Angriff innerhalb von 4h gestartet wird 
	
	}
	
}

-----------------------------------------------------------------------------------
------	   		SpawnCamp03 greift an, Schwierigkeitsgrad Leicht         ----------
-----------------------------------------------------------------------------------

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		
		IsGlobalTimeElapsed { Name = "AngriffsZeitLeichtSpawnCamp03P111", Seconds = AngriffsZeitenLeichtSpawnCamp03, UpdateInterval = 10}, --Wenn nach dem TimeStmap, 2 Stunden vergangen sind wird die Bedingung ein.
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp03P111", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht wird angegriffen 
		IsGlobalCounter { Name = "SchwierigkeitsgradP111", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Schwierigkeitsgrad (0 --> Leicht, 1 --> Mittel, 2 --> Schwer)
	},
	Actions =	
	{
		--Outcry { NpcId = 6948, String = "Angriff Camp03 Leicht" , Tag ="" , Color = ColorWhite},
		Goto { X = 230 , Y = 286 , NpcId = 7096 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 230 , Y = 286 , NpcId = 6905 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 7097 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitLeichtSpawnCamp03P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitMittelSpawnCamp03P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitSchwerSpawnCamp03P111"},		
		
		IncreaseGlobalCounter {Name = "AngriffsZaehlerSpawnCamp03P111"},
		IncreaseGlobalCounter {Name = "AuswahlCampP111"},
		ResetGlobalCounter { Name = "EinmalSchleifeCamp03P111"}, 
	}
	
}


OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp03P111", Operator = IsEqual, Value = 1, UpdateInterval = 60}, -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		--SetGlobalTimeStamp{Name = "AngriffsZeitSpawnCamp03P111"},
		ResetGlobalCounter { Name = "AngriffsZaehlerSpawnCamp03P111" }, --Der Angriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal ein Angriff innerhalb von 4h gestartet wird 
		
	}
	
}


-----------------------------------------------------------------------------------
------	   		SpawnCamp03 greift an, Schwierigkeitsgrad Mittel         ----------
-----------------------------------------------------------------------------------

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		
		IsGlobalTimeElapsed { Name = "AngriffsZeitMittelSpawnCamp03P111", Seconds = AngriffsZeitenMittelSpawnCamp03, UpdateInterval = 10}, --Wenn nach dem TimeStmap, 2 Stunden vergangen sind wird die Bedingung ein.
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp03P111", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht wird angegriffen 
		IsGlobalCounter { Name = "SchwierigkeitsgradP111", Operator = IsEqual, Value = 1, UpdateInterval = 60}, --Schwierigkeitsgrad (0 --> Leicht, 1 --> Mittel, 2 --> Schwer)
	},
	Actions =	
	{
		--Outcry { NpcId = 6948, String = "Angriff Camp03 Mittel" , Tag ="" , Color = ColorWhite},
		Goto { X = 230 , Y = 286 , NpcId = 7096 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 230 , Y = 286 , NpcId = 6904 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 7097 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6907 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 7095 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6911 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitLeichtSpawnCamp03P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitMittelSpawnCamp03P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitSchwerSpawnCamp03P111"},
		IncreaseGlobalCounter {Name = "AngriffsZaehlerSpawnCamp03P111"},
		IncreaseGlobalCounter {Name = "AuswahlCampP111"},
		ResetGlobalCounter { Name = "EinmalSchleifeCamp03P111"}, 
	}
	
}


OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp03P111", Operator = IsEqual, Value = 1, UpdateInterval = 60}, -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		--SetGlobalTimeStamp{Name = "AngriffsZeitSpawnCamp03P111"},
		ResetGlobalCounter { Name = "AngriffsZaehlerSpawnCamp03P111" }, --Der Angriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal ein Angriff innerhalb von 4h gestartet wird 
		
	}
	
}


-----------------------------------------------------------------------------------
------	   		SpawnCamp03 greift an, Schwierigkeitsgrad Schwer         ----------
-----------------------------------------------------------------------------------

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		
		IsGlobalTimeElapsed { Name = "AngriffsZeitSchwerSpawnCamp03P111", Seconds = AngriffsZeitenSchwerSpawnCamp03, UpdateInterval = 10}, --Wenn nach dem TimeStmap, 2 Stunden vergangen sind wird die Bedingung ein.
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp03P111", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht wird angegriffen 
		IsGlobalCounter { Name = "SchwierigkeitsgradP111", Operator = IsEqual, Value = 2, UpdateInterval = 60}, --Schwierigkeitsgrad (0 --> Leicht, 1 --> Mittel, 2 --> Schwer)
	},
	Actions =	
	{
		--Outcry { NpcId = 6948, String = "Angriff Camp03 Schwer" , Tag ="" , Color = ColorWhite},
		Goto { X = 230 , Y = 286 , NpcId = 6901 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 230 , Y = 286 , NpcId = 7096 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6903 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6904 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 7097 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6906 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6907 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 230 , Y = 286 , NpcId = 6908 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6909 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 7095 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6911 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6912 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitLeichtSpawnCamp03P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitMittelSpawnCamp03P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitSchwerSpawnCamp03P111"},
		
		IncreaseGlobalCounter {Name = "AngriffsZaehlerSpawnCamp03P111"},
		IncreaseGlobalCounter {Name = "AuswahlCampP111"},
		ResetGlobalCounter { Name = "EinmalSchleifeCamp03P111"}, 
	}
	
}


OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp03P111", Operator = IsEqual, Value = 1, UpdateInterval = 60}, -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		--SetGlobalTimeStamp{Name = "AngriffsZeitSpawnCamp03P111"},
		ResetGlobalCounter { Name = "AngriffsZaehlerSpawnCamp03P111" }, --Der Angriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal ein Angriff innerhalb von 4h gestartet wird 
		
	}
	
}


-----------------------------------------------------------------------------------
------	   		SpawnCamp04 greift an, Schwierigkeitsgrad Leicht         ----------
-----------------------------------------------------------------------------------

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		
		IsGlobalTimeElapsed { Name = "AngriffsZeitLeichtSpawnCamp04P111", Seconds = AngriffsZeitenLeichtSpawnCamp04, UpdateInterval = 10}, --Wenn nach dem TimeStmap, 2 Stunden vergangen sind wird die Bedingung ein.
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp04P111", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht wird angegriffen 
		IsGlobalCounter { Name = "SchwierigkeitsgradP111", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Schwierigkeitsgrad (0 --> Leicht, 1 --> Mittel, 2 --> Schwer)
	},
	Actions =	
	{
		--Outcry { NpcId = 6948, String = "Angriff Camp04 Leicht" , Tag ="" , Color = ColorWhite},
		Goto { X = 230 , Y = 286 , NpcId = 6870 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 230 , Y = 286 , NpcId = 6877 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6875 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitLeichtSpawnCamp04P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitMittelSpawnCamp04P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitSchwerSpawnCamp04P111"},
		
		
		IncreaseGlobalCounter {Name = "AngriffsZaehlerSpawnCamp04P111"},
		IncreaseGlobalCounter {Name = "AuswahlCampP111"},
		ResetGlobalCounter { Name = "EinmalSchleifeCamp04P111"}, 
	}
	
}


OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp04P111", Operator = IsEqual, Value = 1, UpdateInterval = 60}, -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		--SetGlobalTimeStamp{Name = "AngriffsZeitSpawnCamp04P111"},
		ResetGlobalCounter { Name = "AngriffsZaehlerSpawnCamp04P111" }, --Der Angriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal ein Angriff innerhalb von 4h gestartet wird 
		
	}
	
}


-----------------------------------------------------------------------------------
------	   		SpawnCamp04 greift an, Schwierigkeitsgrad Mittel         ----------
-----------------------------------------------------------------------------------

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		
		IsGlobalTimeElapsed { Name = "AngriffsZeitMittelSpawnCamp04P111", Seconds = AngriffsZeitenMittelSpawnCamp04, UpdateInterval = 10}, --Wenn nach dem TimeStmap, 2 Stunden vergangen sind wird die Bedingung ein.
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp04P111", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht wird angegriffen 
		IsGlobalCounter { Name = "SchwierigkeitsgradP111", Operator = IsEqual, Value = 1, UpdateInterval = 60}, --Schwierigkeitsgrad (0 --> Leicht, 1 --> Mittel, 2 --> Schwer)
	},
	Actions =	
	{
		--Outcry { NpcId = 6948, String = "Angriff Camp04 Mittel" , Tag ="" , Color = ColorWhite},
		Goto { X = 230 , Y = 286 , NpcId = 6870 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 230 , Y = 286 , NpcId = 6871 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6873 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6875 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 230 , Y = 286 , NpcId = 6878 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6877 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitLeichtSpawnCamp04P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitMittelSpawnCamp04P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitSchwerSpawnCamp04P111"},
		
		IncreaseGlobalCounter {Name = "AngriffsZaehlerSpawnCamp04P111"},
		IncreaseGlobalCounter {Name = "AuswahlCampP111"},
		ResetGlobalCounter { Name = "EinmalSchleifeCamp04P111"}, 
	}
	
}


OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp04P111", Operator = IsEqual, Value = 1, UpdateInterval = 60}, -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		--SetGlobalTimeStamp{Name = "AngriffsZeitSpawnCamp04P111"},
		ResetGlobalCounter { Name = "AngriffsZaehlerSpawnCamp04P111" }, --Der Angriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal ein Angriff innerhalb von 4h gestartet wird 
		
	}
	
}

-----------------------------------------------------------------------------------
------	   		SpawnCamp04 greift an, Schwierigkeitsgrad Schwer         ----------
-----------------------------------------------------------------------------------

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		
		IsGlobalTimeElapsed { Name = "AngriffsZeitSchwerSpawnCamp04P111", Seconds = AngriffsZeitenSchwerSpawnCamp04, UpdateInterval = 10}, --Wenn nach dem TimeStmap, 2 Stunden vergangen sind wird die Bedingung ein.
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp04P111", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht wird angegriffen 
		IsGlobalCounter { Name = "SchwierigkeitsgradP111", Operator = IsEqual, Value = 2, UpdateInterval = 60}, --Schwierigkeitsgrad (0 --> Leicht, 1 --> Mittel, 2 --> Schwer)
	},
	Actions =	
	{
		--Outcry { NpcId = 6948, String = "Angriff Camp04 Schwer" , Tag ="" , Color = ColorWhite},
		Goto { X = 230 , Y = 286 , NpcId = 6869 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 230 , Y = 286 , NpcId = 6870 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6871 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6872 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 230 , Y = 286 , NpcId = 6873 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6874 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6865 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 230 , Y = 286 , NpcId = 6876 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6877 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6878 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 230 , Y = 286 , NpcId = 6879 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 230 , Y = 286 , NpcId = 6880 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitLeichtSpawnCamp04P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitMittelSpawnCamp04P111"},
		ClearGlobalTimeStamp{ Name = "AngriffsZeitSchwerSpawnCamp04P111"},
		
		IncreaseGlobalCounter {Name = "AngriffsZaehlerSpawnCamp04P111"},
		IncreaseGlobalCounter {Name = "AuswahlCampP111"},
		ResetGlobalCounter { Name = "EinmalSchleifeCamp04P111"}, 
	}
	
}


OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "AngriffsZaehlerSpawnCamp04P111", Operator = IsEqual, Value = 1, UpdateInterval = 60}, -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		--SetGlobalTimeStamp{Name = "AngriffsZeitSpawnCamp04P111"},
		ResetGlobalCounter { Name = "AngriffsZaehlerSpawnCamp04P111" }, --Der Angriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal ein Angriff innerhalb von 4h gestartet wird 
	}
	
}

-- _________________________________________________________________________
--*																		    *
--*  DARKELF EINHEITEN WERDEN ZURÜCKGESCHICKT WENN MONUMENT VERLOREN WURDE  *
--*_________________________________________________________________________*


--Wenn der Spieler sein Monument verliert
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "DarkElvesIdleGoHomeP111"},
		IsGlobalCounter { Name = "CounterGoHomeP111", Value = 0, Operator = IsEqual, UpdateInterval = 60},
		
    },
	Actions =
	{
		
		Goto { X = 120 , Y = 445 , NpcId = 6881 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, --Angriffgruppe1
		Goto { X = 120 , Y = 445 , NpcId = 6882 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 120 , Y = 445 , NpcId = 6883 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 120 , Y = 445 , NpcId = 6884 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 120 , Y = 445 , NpcId = 6885 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 120 , Y = 445 , NpcId = 6886 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 120 , Y = 445 , NpcId = 6887 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 120 , Y = 445 , NpcId = 6888 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 120 , Y = 445 , NpcId = 6889 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 120 , Y = 445 , NpcId = 6890 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 120 , Y = 445 , NpcId = 6891 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 120 , Y = 445 , NpcId = 6892 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},	
	
		Goto { X = 392 , Y = 362 , NpcId = 7099 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, --Angriffsgruppe2
		Goto { X = 392 , Y = 362 , NpcId = 6894 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 392 , Y = 362 , NpcId = 6895 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 392 , Y = 362 , NpcId = 7098 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 392 , Y = 362 , NpcId = 6897 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 392 , Y = 362 , NpcId = 6898 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 392 , Y = 362 , NpcId = 6899 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 392 , Y = 362 , NpcId = 6900 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
				
		Goto { X = 308 , Y = 129 , NpcId = 6869 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, --Angriffsgruppe3
		Goto { X = 308 , Y = 129 , NpcId = 6870 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 308 , Y = 129 , NpcId = 6871 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 308 , Y = 129 , NpcId = 6872 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 308 , Y = 129 , NpcId = 6873 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 308 , Y = 129 , NpcId = 6874 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 308 , Y = 129 , NpcId = 6865 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 308 , Y = 129 , NpcId = 6876 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 308 , Y = 129 , NpcId = 6877 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 308 , Y = 129 , NpcId = 6878 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 308 , Y = 129 , NpcId = 6879 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 308 , Y = 129 , NpcId = 6880 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		
		Goto { X = 96 , Y = 122 , NpcId = 6901 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, --Angriffsgruppe4
		Goto { X = 96 , Y = 122 , NpcId = 7096 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 96 , Y = 122 , NpcId = 6903 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 96 , Y = 122 , NpcId = 6904 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 96 , Y = 122 , NpcId = 7097 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 96 , Y = 122 , NpcId = 6906 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 96 , Y = 122 , NpcId = 6907 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 96 , Y = 122 , NpcId = 6908 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 96 , Y = 122 , NpcId = 6909 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 96 , Y = 122 , NpcId = 7095 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 96 , Y = 122 , NpcId = 6911 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 96 , Y = 122 , NpcId = 6912 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		IncreaseGlobalCounter { Name = "CounterGoHomeP111"},
	}
}

-- ________________________________________________________________________________________________________
--*                                                                                                        *
--*  Wenn der Spieler sein Monument Zwischenzeitlich verliert, werden die AngriffsTruppen zurückgeschickt  *
--*________________________________________________________________________________________________________*


OnEvent								
{
	Conditions = 
	{ 
		IsGlobalCounter { Name = "CounterMonumentP111", Value = 0, Operator = IsEqual, UpdateInterval = 10},
		Negated(IsMonumentInUse {X = 231, Y = 295, Range = 3, UpdateInterval = 10}),
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},
	 
	},
	Actions = 
	{
		SetGlobalFlagTrue { Name = "DarkElvesIdleGoHomeP111"},
		IncreaseGlobalCounter { Name = "CounterMonumentP111"},	
	},											
}							


OnEvent								
{
	Conditions = 
	{ 
		IsGlobalCounter { Name = "CounterMonumentP111", Value = 1, Operator = IsEqual, UpdateInterval = 10},
		IsMonumentInUse {X = 231, Y = 295, Range = 3, UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},
	 
	},
	Actions = 
	{
		ResetGlobalCounter  { Name = "CounterMonumentP111"},
		ResetGlobalCounter  { Name = "CounterGoHomeP111"},		
		SetGlobalFlagFalse { Name = "DarkElvesIdleGoHomeP111"},
		
	},											
}							



------------------------------------------------------------------------------------------------------
------				                    Obelisken und FireCamps                                  -----
------------------------------------------------------------------------------------------------------











--Initialisierung der Variablen Obelisken 1-4
--Dient dazu dass die Obelisken an sind von Anfang an.

OnOneTimeEvent
{
	Conditions =
	{
		
	
    },
	Actions =
	{
		SetGlobalFlagTrue { Name = "ObeliskOn1P111"},
		IncreaseGlobalCounter { Name = "ObeliskenZaehler1P111"},
		SetGlobalFlagTrue { Name = "ObeliskOn2P111"},
		IncreaseGlobalCounter { Name = "ObeliskenZaehler2P111"},
		SetGlobalFlagTrue { Name = "ObeliskOn3P111"},
		IncreaseGlobalCounter { Name = "ObeliskenZaehler3P111"},
		SetGlobalFlagTrue { Name = "ObeliskOn4P111"},
		IncreaseGlobalCounter { Name = "ObeliskenZaehler4P111"},
		SetGlobalFlagTrue { Name = "StartFireP111"},
		
	}
}


--Wenn Der Schattenring gefunden wurde verschwindet die Hälfte der Geister
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "MenschenMonumentGeclaimedP111" , UpdateInterval = 10},
	
    },
	Actions =
	{
		
		SetGlobalFlagFalse { Name = "GeisterinBewegungP111"},--Die Schattengeister bewegen sich
		SetGlobalFlagTrue { Name = "DespawnGeisterP111"},
	}
}



--Obelisken1Change
--Obelisk1 wird ausgeschaltet!
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{	
		IsGlobalFlagTrue { Name = "StartFireP111"},
		IsGlobalFlagFalse { Name = "ObeliskOn1P111"},
		IsGlobalCounter { Name = "ObeliskenZaehler1P111", Operator = IsEqual, Value = 0, UpdateInterval = 10}, --Wenn der Zähler auf 0 steht wird angegriffen 
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
	},
	Actions =	
	{
		ChangeObject { X = 114 , Y = 451, Object = 2882},
		SetGlobalTimeStamp { Name = "ObeliskOn1P111"}, --Beginn der Zeitnahme
		SetGlobalFlagTrue { Name = "Spawnpoint1ZerstoertP111" },
		IncreaseGlobalCounter { Name = "ObeliskenZaehler1P111"},
	}
	
}

--Obelisk1 wird angeschaltet!
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "StartFireP111"},
		IsGlobalFlagTrue { Name = "ObeliskOn1P111"},
		IsGlobalCounter { Name = "ObeliskenZaehler1P111", Operator = IsGreaterOrEqual, Value = 1, UpdateInterval = 10}, 
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
		IsGlobalFlagFalse { Name = "SpawnCampsZerstörtP111"},
	},
	Actions =	
	{
		ChangeObject { X = 114 , Y = 451, Object = 2883},
		ClearGlobalTimeStamp { Name = "ObeliskOn1P111"}, --Abbruch der Zeitnahme
		SetGlobalFlagFalse { Name = "Spawnpoint1ZerstoertP111" },
		ResetGlobalCounter { Name = "ObeliskenZaehler1P111"},
		SetGlobalFlagFalse { Name = "SpawnCamp1P111Out" },
		
	}
	
}


--Obelisken2Change
--Obelisk2 wird ausgeschaltet!
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{	
		IsGlobalFlagTrue { Name = "StartFireP111"},
		IsGlobalFlagFalse { Name = "ObeliskOn2P111"},
		IsGlobalCounter { Name = "ObeliskenZaehler2P111", Operator = IsEqual, Value = 0, UpdateInterval = 10}, --Wenn der Zähler auf 0 steht wird angegriffen 
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
	},
	Actions =	
	{
		ChangeObject { X = 388 , Y = 377, Object = 2882},
		SetGlobalTimeStamp { Name = "ObeliskOn2P111"}, --Beginn der Zeitnahme
		SetGlobalFlagTrue { Name = "Spawnpoint2ZerstoertP111" },
		IncreaseGlobalCounter { Name = "ObeliskenZaehler2P111"},
	}
	
}

--Obelisk2 wird angeschaltet!
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "StartFireP111"},
		IsGlobalFlagTrue { Name = "ObeliskOn2P111"},
		IsGlobalCounter { Name = "ObeliskenZaehler2P111", Operator = IsGreaterOrEqual, Value = 1, UpdateInterval = 10}, 
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
		IsGlobalFlagFalse { Name = "SpawnCampsZerstörtP111"},
	},
	Actions =	
	{
		ChangeObject { X = 388 , Y = 377, Object = 2883},
		ClearGlobalTimeStamp { Name = "ObeliskOn2P111"}, --Abbruch der Zeitnahme
		SetGlobalFlagFalse { Name = "Spawnpoint2ZerstoertP111" },
		ResetGlobalCounter { Name = "ObeliskenZaehler2P111"},
		SetGlobalFlagFalse { Name = "SpawnCamp2P111Out" },
		
	}
	
}

--Obelisken3Change
--Obelisk3 wird ausgeschaltet!
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{	
		IsGlobalFlagTrue { Name = "StartFireP111"},
		IsGlobalFlagFalse { Name = "ObeliskOn3P111"},
		IsGlobalCounter { Name = "ObeliskenZaehler3P111", Operator = IsEqual, Value = 0, UpdateInterval = 10}, --Wenn der Zähler auf 0 steht wird angegriffen 
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
	},
	Actions =	
	{
		ChangeObject { X = 306 , Y = 127, Object = 2882},
		SetGlobalTimeStamp { Name = "ObeliskOn3P111"}, --Beginn der Zeitnahme
		SetGlobalFlagTrue { Name = "Spawnpoint3ZerstoertP111" },
		IncreaseGlobalCounter { Name = "ObeliskenZaehler3P111"},
		
	}
	
}

--Obelisk3 wird angeschaltet!
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "StartFireP111"},
		IsGlobalFlagTrue { Name = "ObeliskOn3P111"},
		IsGlobalCounter { Name = "ObeliskenZaehler3P111", Operator = IsGreaterOrEqual, Value = 1, UpdateInterval = 10}, 
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
		IsGlobalFlagFalse { Name = "SpawnCampsZerstörtP111"},
	},
	Actions =	
	{
		ChangeObject { X = 306 , Y = 127, Object = 2883},
		ClearGlobalTimeStamp { Name = "ObeliskOn3P111"}, --Abbruch der Zeitnahme
		SetGlobalFlagFalse { Name = "Spawnpoint3ZerstoertP111" },
		ResetGlobalCounter { Name = "ObeliskenZaehler3P111"},
		SetGlobalFlagFalse { Name = "SpawnCamp3P111Out" },
		
		
	}
	
}

--Obelisken4Change
--Obelisk4 wird ausgeschaltet!
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{	
		IsGlobalFlagTrue { Name = "StartFireP111"},
		IsGlobalFlagFalse { Name = "ObeliskOn4P111"},
		IsGlobalCounter { Name = "ObeliskenZaehler4P111", Operator = IsEqual, Value = 0, UpdateInterval = 10}, --Wenn der Zähler auf 0 steht wird angegriffen 
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
	},
	Actions =	
	{
		ChangeObject { X = 91 , Y = 126, Object = 2882},
		SetGlobalTimeStamp { Name = "ObeliskOn4P111"}, --Beginn der Zeitnahme
		SetGlobalFlagTrue { Name = "Spawnpoint4ZerstoertP111" },
		IncreaseGlobalCounter { Name = "ObeliskenZaehler4P111"},
		
	}
	
}

--Obelisk4 wird angeschaltet!
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "StartFireP111"},
		IsGlobalFlagTrue { Name = "ObeliskOn4P111"},
		IsGlobalCounter { Name = "ObeliskenZaehler4P111", Operator = IsGreaterOrEqual, Value = 1, UpdateInterval = 10}, 
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
		IsGlobalFlagFalse { Name = "SpawnCampsZerstörtP111"},
	},
	Actions =	
	{
		ChangeObject { X = 91 , Y = 126, Object = 2883},
		ClearGlobalTimeStamp { Name = "ObeliskOn4P111"}, --Abbruch der Zeitnahme
		SetGlobalFlagFalse { Name = "Spawnpoint4ZerstoertP111" },
		ResetGlobalCounter { Name = "ObeliskenZaehler4P111"},
		SetGlobalFlagFalse { Name = "SpawnCamp4P111Out" },
		
	}
	
}


--Wenn das Feuer mind. 3 min gehalten wurde gilt das Camp4 als eliminiert

OnEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed { Name = "ObeliskOn4P111", Seconds = 180, UpdateInterval = 10}, 
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
		IsGlobalFlagFalse { Name = "SpawnCamp4P111Out" },
	},
	Actions =	
	{
		SetGlobalFlagTrue { Name = "SpawnCamp4P111Out" },
		Outcry { NpcId = 6991, String = "Bald sind sie wieder in unserem Bann!" , Tag ="ocFeuerengelP111_007" , Color = ColorWhite},
	}
	
}

--Wenn das Feuer mind. 3 min gehalten wurde gilt das Camp1 als eliminiert

OnEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed { Name = "ObeliskOn1P111", Seconds = 180, UpdateInterval = 10},
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
		IsGlobalFlagFalse { Name = "SpawnCamp1P111Out" },
	},
	Actions =	
	{
		SetGlobalFlagTrue { Name = "SpawnCamp1P111Out" },
		Outcry { NpcId = 6991, String = "Gut! Zerstört die Quellen der Schatten! Wenn ihre Verstecke vernichtet sind, müssen sie in das Schwert zurückkehren!" , Tag ="ocFeuerengelP111_004" , Color = ColorWhite},
	}
	
}
--Wenn das Feuer mind. 3 min gehalten wurde gilt das Camp2 als eliminiert

OnEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed { Name = "ObeliskOn2P111", Seconds = 180, UpdateInterval = 10}, 
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
		IsGlobalFlagFalse { Name = "SpawnCamp2P111Out" },
	},
	Actions =	
	{
		SetGlobalFlagTrue { Name = "SpawnCamp2P111Out" },
		Outcry { NpcId = 6991, String = "Sehr gut! Aber achtet darauf, dass die Lichter nicht erlöschen!" , Tag ="ocFeuerengelP111_005" , Color = ColorWhite},

	}
	
}
--Wenn das Feuer mind. 3 min gehalten wurde gilt das Camp3 als eliminiert

OnEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed { Name = "ObeliskOn3P111", Seconds = 180, UpdateInterval = 10},
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 10},
		IsGlobalFlagFalse { Name = "SpawnCamp3P111Out" },
	},
	Actions =	
	{
		SetGlobalFlagTrue { Name = "SpawnCamp3P111Out" },
		Outcry { NpcId = 6991, String = "Mein Herr hat mit Euch eine gute Wahl getroffen!" , Tag ="ocFeuerengelP111_006" , Color = ColorWhite},
	}
	
}



--Wenn alle Obelisken Out sind!
OnOneTimeEvent
{
	Conditions = 
	{
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring" , UpdateInterval = 60},
		IsGlobalFlagTrue { Name = "SpawnCamp1P111Out"},
		IsGlobalFlagTrue { Name = "SpawnCamp2P111Out"},
		IsGlobalFlagTrue { Name = "SpawnCamp3P111Out"},
		IsGlobalFlagTrue { Name = "SpawnCamp4P111Out"},
	},
	Actions =	
	{
		--Outcry { NpcId = 6997, String = "!!!Alles Zerstört!!!" , Tag ="" , Color = ColorWhite},
		SetGlobalFlagTrue { Name = "Spawnpoint1TotalZerstoertP111"},
		SetGlobalFlagTrue { Name = "Spawnpoint2TotalZerstoertP111"},
		SetGlobalFlagTrue { Name = "Spawnpoint3TotalZerstoertP111"},
		SetGlobalFlagTrue { Name = "Spawnpoint4TotalZerstoertP111"},
		SetGlobalFlagTrue { Name = "SpawnCampsZerstoertP111"},
		Outcry { NpcId = 6991, String = "Mein Herr hat mit Euch eine gute Wahl getroffen!" , Tag ="ocFeuerengelP111_006" , Color = ColorWhite},
		QuestSolve{QuestId = 675 },
		QuestBegin{QuestId = 680 },
		SetRewardFlagTrue { Name = "AlleVierFackelnAn" },
	}
	
}




--Spieler kommt zum Schattenschwert die letzten Lichter gehen an (oder aus :))!
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "SpawnCampsZerstoertP111"},
		PlayerUnitInRange{ X = 316, Y = 49, Range = 6 , FigureType = FigureAvatar , UpdateInterval = 10},

	},
	Actions =	
	{
		
	
		SetEffect { Effect = "Torch", X = 297, Y = 46, Length = 0}, --Fackel beim Schattenschwert
		SetEffect { Effect = "Torch", X = 297, Y = 52, Length = 0}, --Fackel beim Schattenschwert
		SetEffect { Effect = "Torch", X = 300, Y = 46, Length = 0}, --Fackel beim Schattenschwert
		SetEffect { Effect = "Torch", X = 300, Y = 52, Length = 0}, --Fackel beim Schattenschwert
		SetEffect { Effect = "Torch", X = 303, Y = 46, Length = 0}, --Fackel beim Schattenschwert
		SetEffect { Effect = "Torch", X = 303, Y = 52, Length = 0}, --Fackel beim Schattenschwert
		SetEffect { Effect = "Torch", X = 306, Y = 46, Length = 0}, --Fackel beim Schattenschwert
		SetEffect { Effect = "Torch", X = 306, Y = 52, Length = 0}, --Fackel beim Schattenschwert
				
	}
	
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "SchwertErhaltenP111"},
	},
	Actions =
	{
		TransferItem {GiveItem = 3764, Flag = Give},
		ChangeObject { X = 289, Y = 49, Object = 2852},
		
	}
}

REM=[[
--Schattschwert im Inventar

OnQuestItemFound
{
	ItemId = 3764,
	ItemFlagName = "PlayerHasItemSchattenschwert" ,
	Amount = 1,
	Actions = 
	{
		ChangeObject { X = 292, Y = 52, Object = 2852},
		QuestSolve{QuestId = 671 },
	},
}
]]
-------------------------------------------------------------------------------------
----------				             MAIN QUEST                            ----------
-------------------------------------------------------------------------------------

OnOneTimeEvent
{
	Conditions = 
	{
		
	},
	Actions =	
	{
		QuestSolve{QuestId = 744 },
		QuestSolve{QuestId = 615 },
		QuestBegin{QuestId = 671 },
		QuestBegin{QuestId = 672 },
		SetRewardFlagTrue { Name = "P111KarteErreicht" },
		
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsItemFlagTrue { Name = "PlayerHasItemSchattenring"},		
	},
	Actions =	
	{
		QuestSolve{QuestId = 673 },
		QuestBegin{QuestId = 674 },
		SetRewardFlagTrue { Name = "SchattenringBekommen" },
		
	}
}

OnOneTimeEvent
{
 	Conditions = 
	{ 
		--IsGlobalFlagTrue {Name = "EndKampfStartP111"},
		--FigureDead {NpcId = 6991},
		IsItemFlagTrue { Name = "PlayerHasItemSchattenschwert"},

	},
	Actions = 
	{
		SetGlobalFlagTrue{ Name = "WaechterTodP111"},	
		QuestSolve{QuestId = 680},
		SetRewardFlagTrue { Name = "WaechterGetoetet" },
		QuestBegin{QuestId = 745},
	}											
}				

OnOneTimeEvent
{
 	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "ElementarBeschwoertP111"},
	},
	Actions = 
	{
		SetRewardFlagTrue { Name = "ElementBeschworen" },	
	}											
}				


OnOneTimeEvent
{
 	Conditions = 
	{ 
		IsItemFlagTrue{Name = "PlayerHasItemSchattenringhaelfte1"},
		IsItemFlagTrue{Name = "PlayerHasItemSchattenringhaelfte2"},
	},
	Actions = 
	{
		TransferItem {GiveItem = 4175, Flag = Give},
		SetItemFlagFalse{Name = "PlayerHasItemSchattenringhaelfte1"},
		SetItemFlagFalse{Name = "PlayerHasItemSchattenringhaelfte2"},
	}											
}	
			
--FeuerengelEndkampfStart
OnPlatformOneTimeEvent
{
 
	Conditions = 
	{
		QuestState { QuestId = 671, State = StateActive, UpdateInterval  = 1},
		IsGlobalFlagTrue { Name = "EndCutSceneEndP111", UpdateInterval  = 1},
		FigureAlive {NpcId = 6991}, 	
	} , 
	Actions = 
	{
		
		SetGlobalFlagTrue {Name = "EndKampfStartP111"},
		
	} 
}



EndDefinition()
end
                                                                                                                                                                                                                                                                                                                                                                                                               
                                                                                                                                                                                                                                                                                                                                                                                                               
                                                                                                                                                                                                                                                                                                                                                                                                               
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          