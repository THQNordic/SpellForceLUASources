function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile ("script/p101/n5538_FlüchtlingeGerettet.lua")  -- Counter für gerettete Flüchtlinge


--Umspawnen nacheinander in Lager West, wenn Questarmee übergeben 
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{ 
		IsGlobalTimeElapsed{Name = "AbSpielerHatQuestarmee", Seconds = 120, UpdateInterval = 60},
		
	},
	Actions = 
	{ 
		Goto {X = 225, Y = 98, NpcId = self , Range = 1 , WalkMode = Walk , GotoMode = GotoNormal , XRand = 0 , YRand = 0},
	},
}	


Umspawn
{
	UnitId = self , Clan = 0 , X = 283 , Y = 104 , Target = none , NoSpawnEffect = FALSE , OnlyOnce = TRUE ,
	Conditions = 
	{ 
	FigureInRange{X = 225, Y = 98, NpcId = self , Range = 1},
	} , 
	Actions = 
	{ 
	Goto {X = 301, Y = 115, NpcId = self , Range = 3 , WalkMode = Walk , GotoMode = GotoNormal , XRand = 0 , YRand = 0},
	},
}

EndDefinition()

end
