function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


dofile ("script/p101/n5538_Fl�chtlingeGerettet.lua")  -- Counter f�r gerettete Fl�chtlinge


--Umspawnen nacheinander in Lager West, wenn Questarmee �bergeben 
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{ 
		IsGlobalTimeElapsed{Name = "AbSpielerHatQuestarmee", Seconds = 100, UpdateInterval = 60},
		
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
	Goto {X = 294, Y = 100, NpcId = self , Range = 5 , WalkMode = Walk , GotoMode = GotoNormal , XRand = 0 , YRand = 0},
	},
}


----Fl�chtlinge gehen zu Portal nach Flee to Ice
--OnOneTimeEvent
--{
--	NotInDialog = FALSE , UpdateInterval = 60 ,
--	Conditions = 
--	{ 
--		IsGlobalFlagTrue{Name = "p101EiselfenSindLieb",  UpdateInterval = 30},
--	},
--	Actions = 
--	{ 
--		Goto {X = 460, Y = 465, NpcId = self , Range = 1 , WalkMode = Walk , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
--	},
--}	
--
----Respawn bis 10 Fl�chtlinge gerettet
--Respawn
--{
--	WaitTime = 30, UnitId = self , Clan = 0 , Target = none , X = 283 , Y = 104 , Chief = none, NoSpawnEffect = FALSE , 
--	Conditions = 
--	{ 
--		IsGlobalFlagTrue {Name = "p101EiselfenSindLieb", UpdateInterval = 60},
--		IsGlobalFlagFalse {Name = "p101AlleFl�chtlingeGerettet", UpdateInterval = 20},
--		
--	} , 
--	Actions = 
--	{ 
--		Goto {X = 460, Y = 465, NpcId = self , Range = 1 , WalkMode = Walk , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
--
--	} , 
--	DeathActions = { },
--}
--
--
----Fl�chtlinge zonen nach Flee to Ice
--
--Despawn
--{
--PlayDeathAnim = FALSE ,
--	Conditions = 
--	{ 
--	 FigureInRange{X = 460, Y = 465, NpcId = self , Range = 1},
--	 } , 
--	 Actions = 
--	 {},
--}
EndDefinition()

end
