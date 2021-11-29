function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "PlayerWarAufFleeToIce", UpdateInterval = 5},
	},
	Actions = 
	{
		Follow{Target = 8174, NpcId = self},
	},

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
