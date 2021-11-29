--Feuerarmee 3
--spawnt nur, wenn Spieler von Flle to Ice zurück kommt

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)     

--Feuerarmee3, (6511-6528)
SpawnOnlyWhen
{
	X = _X , Y = _Y , Clan = 0 , UnitId = 0 , NoSpawnEffect = FALSE , 
	Conditions = 
	{
		
		IsGlobalFlagTrue{Name = "PlayerWarAufFleeToIce" ,  UpdateInterval = 20 },
		
	} , 
	Actions = 
	{ 
		Goto{X = 410, Y = 425, NpcId = 6513, Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
		Goto{X = 410, Y = 425, NpcId = 6514, Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
		Goto{X = 410, Y = 425, NpcId = 6523, Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
		Goto{X = 424, Y = 424, NpcId = 6528, Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
		Goto{X = 424, Y = 424, NpcId = 6512, Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
		Goto{X = 430, Y = 436, NpcId = 6515, Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
		Goto{X = 430, Y = 436, NpcId = 6516, Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
		Goto{X = 431, Y = 444, NpcId = 6522, Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
		Goto{X = 431, Y = 444, NpcId = 6527, Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
		
		Goto{X = 366, Y = 460, NpcId = 6511, Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
		Goto{X = 366, Y = 460, NpcId = 6517, Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0}, 
		Goto{X = 366, Y = 460, NpcId = 6518, Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
		Goto{X = 366, Y = 473, NpcId = 6519, Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
		Goto{X = 366, Y = 473, NpcId = 6520, Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
		Goto{X = 368, Y = 478, NpcId = 6521, Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
		Goto{X = 368, Y = 478, NpcId = 6524, Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},                   
		Goto{X = 375, Y = 477, NpcId = 6525, Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},                   
		Goto{X = 375, Y = 477, NpcId = 6526, Range = 3 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},                   
		
	
	},        
}            
             
-- wenn Elfengebäude platt, ab vor die Orkstadt
OnIdleGoHome
{
	X = 323, Y = 220, Direction = 0, Range = 6 , WalkRange = 2 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoNormal,
	Conditions = 
	{
		Negated(BuildingInRange{X = 364, Y = 460, Range = 3 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60}),
		Negated(BuildingInRange{X = 364, Y = 474, Range = 3 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60}),
		Negated(BuildingInRange{X = 371, Y = 481, Range = 3 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60}),
		Negated(BuildingInRange{X = 381, Y = 485, Range = 3 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60}),
		Negated(BuildingInRange{X = 404, Y = 481, Range  = 3 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60}),
		                                                  
		Negated(BuildingInRange{X = 432, Y = 435, Range = 3 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60}),
		Negated(BuildingInRange{X = 434, Y = 446, Range = 3 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60}),
		Negated(BuildingInRange{X = 429, Y = 419, Range = 3 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60}),
		Negated(BuildingInRange{X = 411, Y = 420, Range = 3 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60}),
	},
	Actions = {  },
	HomeActions = {  },
}

--Flucht: Wenn Statthalter tot 
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{ 
		IsGlobalFlagTrue{ Name = "P101_DunkelElfBossKilled", UpdateInterval = 10}
	},
	Actions = 
	{ 
		Goto {X = 402, Y = 248, NpcId = self , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous , XRand = 0 , YRand = 0},
	},
}	


Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions =
	{ 
		FigureInRange{X = 402, Y = 248, NpcId = self , Range = 2},
	} , 
	Actions = {}
}
 EndDefinition()

end       
        
