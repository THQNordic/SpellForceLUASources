-- Aschet‰nzer 1

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--erst, wenn Gnomling tot
SpawnOnlyWhen
{
 	X = _X, Y = _Y, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE, Target = none,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P202Aschetaenzer1SpawnInit"}
	} , 
	Actions = {}
} 


--Umspawn bei 75% health
--hoch mit 75%
Umspawn
{
 	UnitId = self, Clan = 0, X = 164, Y = 248, Target = none, NoSpawnEffect = FALSE, OnlyOnce = TRUE, PlayDeathAnim = FALSE,
	Conditions = 
	{ 
		FigureHasHealth {Percent = 75, NpcId = self, UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "P202Aschetaenzer1Umspawn75", UpdateInterval = 10}
	} , 
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "P202Aschetaenzer1Umspawn75"},

		SetHealth {HitPoints = 2464, NpcId = self, Decrease = FALSE},
		ChangeRace {NpcId = self, Race = 152}
	}
}

--runter mit 75%, wenn kleine Skelette tot
Umspawn
{
 	UnitId = self, Clan = 0, X = _X, Y = _Y, Target = none, NoSpawnEffect = FALSE, OnlyOnce = TRUE, PlayDeathAnim = FALSE,
	Conditions = 
	{ 
		--IsGlobalFlagTrue {Name = "P202Aschetaenzer1Monster75Tot", UpdateInterval = 10},
		--IsGlobalFlagTrue {Name =  "g_P202AschetaenzerHelfer1HatGelebt", UpdateInterval = 10}
		IsGlobalFlagTrue {Name =  "g_P202HelferSkelett1Tot", UpdateInterval = 10},
		IsGlobalFlagTrue {Name =  "g_P202HelferSkelett2Tot", UpdateInterval = 10},
		IsGlobalFlagTrue {Name =  "g_P202HelferSkelett3Tot", UpdateInterval = 10},
		IsGlobalFlagTrue {Name =  "g_P202HelferSkelett4Tot", UpdateInterval = 10},
		IsGlobalFlagTrue {Name =  "g_P202HelferSkelett5Tot", UpdateInterval = 10},
		IsGlobalFlagTrue {Name =  "g_P202HelferSkelett6Tot", UpdateInterval = 10}
	} , 
	Actions = 
	{ 
		SetHealth {HitPoints = 2464, NpcId = self, Decrease = FALSE},
		--SetGlobalFlagFalse {Name = "P202Aschetaenzer1Monster75Tot"}
		ChangeRace {NpcId = self, Race = 114}
	}
}


------------------------------------
------------------------------------
--Umspawn bei 50% health
Umspawn
{
 	UnitId = self, Clan = 0, X = 164, Y = 248, Target = none, NoSpawnEffect = FALSE, OnlyOnce = TRUE, PlayDeathAnim = FALSE,
	Conditions = 
	{ 
		FigureHasHealth {Percent = 50, NpcId = self, UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "P202Aschetaenzer1Umspawn50", UpdateInterval = 10},
		
		
	} , 
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "P202Aschetaenzer1Umspawn50"},
		SetHealth {HitPoints = 1643, NpcId = self, Decrease = FALSE},
		ChangeRace {NpcId = self, Race = 152}
	}
}

--runter mit 50%, wenn groﬂe Skelette tot
Umspawn
{
 	UnitId = self, Clan = 0, X = _X, Y = _Y, Target = none, NoSpawnEffect = FALSE, OnlyOnce = TRUE, PlayDeathAnim = FALSE,
	Conditions = 
	{ 
		--IsGlobalFlagTrue {Name = "P202Aschetaenzer1Monster50Tot", UpdateInterval = 10},
		--IsGlobalFlagTrue {Name =  "g_P202AschetaenzerHelfer2HatGelebt", UpdateInterval = 10},
		IsGlobalFlagTrue {Name =  "g_P202HelferSkelett7Tot", UpdateInterval = 10},
		IsGlobalFlagTrue {Name =  "g_P202HelferSkelett8Tot", UpdateInterval = 10},
		IsGlobalFlagTrue {Name =  "g_P202HelferSkelett9Tot", UpdateInterval = 10},
		IsGlobalFlagTrue {Name =  "g_P202HelferSkelett10Tot", UpdateInterval = 10},
		IsGlobalFlagTrue {Name =  "g_P202HelferSkelett11Tot", UpdateInterval = 10},
		IsGlobalFlagTrue {Name =  "g_P202HelferSkelett12Tot", UpdateInterval = 10},
		IsGlobalFlagTrue {Name =  "g_P202HelferSkelett13Tot", UpdateInterval = 10},
		IsGlobalFlagTrue {Name =  "g_P202HelferSkelett14Tot", UpdateInterval = 10}
	} , 
	Actions = 
	{ 
		SetHealth {HitPoints = 1643, NpcId = self, Decrease = FALSE},
		--SetGlobalFlagFalse {Name = "P202Aschetaenzer1Monster75Tot"}
		ChangeRace {NpcId = self, Race = 114}
	}
}


-----------------------------------------------------------------------
-----------------------------------------------------------------------
--Aschet‰nzer2
-----------------------------------------------------------------------
------------------------------------------------------------------------
--Umspawn bei 25% health
--als Aschet‰nzer 2
Umspawn
{
 	UnitId = 2715, Clan = 0, X = 109, Y = 283, Target = none, NoSpawnEffect = FALSE, OnlyOnce = TRUE, PlayDeathAnim = FALSE,
	Conditions = 
	{ 
		FigureHasHealth {Percent = 25, NpcId = self, UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "P202Aschetaenzer2Gespawnt", UpdateInterval = 10}
	} , 
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "P202Aschetaenzer2Gespawnt"},
		LookAtDirection {Direction = 2, NpcId = self}
		
	}
}


--bei 5% Health noch 2 Duplikate erstellen
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{
		FigureHasHealth {Percent = 5, NpcId = self, UpdateInterval = 10}
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "P202Aschetaenzer2KopienSpawnInit"}
	}
}


OnDeath
{
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_P202Aschetaenzer2Tot"}
	}
}


EndDefinition()

end
