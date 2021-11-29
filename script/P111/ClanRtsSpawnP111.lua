-- RTS Spawn:
-- P111 Weapon to Kill
--GlobalSpawnDuration = 90

--Wenn Orkmonument geclaimed wird


OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsMonumentInUse {X = 231, Y = 295, Range = 3, UpdateInterval = 20},
		
		
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "MenschenMonumentGeclaimedP111"},
				
	}
}

REM = [[


--TierSpawning


OrkAufbau1 =
{
	X = 70,
	Y = 272,
	Range = 2,
	Chief = 0,	
	WaitTime = TierSpawning,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}



OrkAufbau2 =
{
	X = 188,
	Y = 409,
	Range = 3,
	Chief = 0,	
	WaitTime = TierSpawning,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

TrollAufbau1 =
{
	X = 57,
	Y = 62,
	Range = 3,
	Chief = 0,	
	WaitTime = TierSpawning,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}



InitSpawn
{
	Clan = 19, 
	Groups = {OrkAufbau1}, --, OrkAufbau2, TrollAufbau1},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 19, MaxClanSize = 20,
	Groups = {OrkAufbau1}, --, OrkAufbau2, TrollAufbau1},
	Conditions = 	
	{
	},
}

]]