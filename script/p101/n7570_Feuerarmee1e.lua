--Feuerarmee 1e
--NpcId 7570-7581

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Feuerarmee1, Truppe3
SpawnOnlyWhen
{
	X = 403 , Y = 248 , Clan = 0 , UnitId = 0 , NoSpawnEffect = TRUE , 
	Conditions = 
	{
		--IsGlobalFlagTrue{Name = "FeuerArmeeFälltEin", UpdateInterval = 30},
		IsGlobalTimeElapsed{Name = "CounterFeuerarmee1" , Seconds = 120, UpdateInterval = 20 },
		
	} , 
	Actions = 
	{ 
		Goto {X = _X, Y = _Y, NpcId = self , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		
		
	} 
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