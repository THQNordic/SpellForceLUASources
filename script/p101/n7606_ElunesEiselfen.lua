--Elunes Trupp
--NpcId 7606-7617

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = 259 , Y = 136 , Clan = 0 , UnitId = 0 , NoSpawnEffect = TRUE , 
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "EluneSpawns", UpdateInterval = 20},
		
	} , 
	Actions = 
	{ 
		Goto {X = 261, Y = 134, NpcId = 7606 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous }, 
		Goto {X = 259, Y = 134, NpcId = 7607 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous }, 
		Goto {X = 261, Y = 135, NpcId = 7608 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous }, 
		Goto {X = 259, Y = 135, NpcId = 7609 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous }, 
		Goto {X = 261, Y = 136, NpcId = 7610 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous }, 
		Goto {X = 259, Y = 136, NpcId = 7611 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous }, 
		Goto {X = 261, Y = 137, NpcId = 7617 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous }, 
		Goto {X = 259, Y = 137, NpcId = 7613 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous }, 
		Goto {X = 261, Y = 138, NpcId = 7614 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous }, 
		Goto {X = 259, Y = 138, NpcId = 7615 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous }, 
		SetGlobalFlagTrue {Name = "P101EluneTruppFollowAn"},
		
	} 
}

--Follow auf Elune
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "P101EluneTruppFollowAn", UpdateInterval = 20},
		
	},
	Actions = 
	{ 
		Follow {NpcId = self, Target = 5937},
	}
}

--Ein Teil greift DE an
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{ 
		FigureInRange {X = 331, Y = 244, NpcId = 5937 , Range = 8},
		
	},
	Actions = 
	{ 
		Goto {X = 366, Y = 246, NpcId = 7610 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous }, 
		Goto {X = 366, Y = 246, NpcId = 7611 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous }, 
		Goto {X = 366, Y = 246, NpcId = 7617 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous }, 
		Goto {X = 366, Y = 246, NpcId = 7613 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous }, 
		Goto {X = 366, Y = 246, NpcId = 7614 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous }, 
		Goto {X = 366, Y = 246, NpcId = 7615 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous }, 
	}
}

EndDefinition()

end