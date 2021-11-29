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
		--Follow{Target = 0, NpcId = self},
	},

}

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 236, Y = 166, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 249, Y = 167, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 258, Y = 166, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 267, Y = 160, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 273, Y = 159, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 280, Y = 163, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 285, Y = 171, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 276, Y = 174, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 269, Y = 169, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 258, Y = 167, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 241, Y = 167, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 232, Y = 167, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk}
AddControlPoint{Name = "009", Location = "Point009",WalkMode = Walk}
AddControlPoint{Name = "010", Location = "Point010",WalkMode = Walk}
AddControlPoint{Name = "011", Location = "Point011",WalkMode = Walk}
AddControlPoint{Name = "012", Location = "Point012",WalkMode = Walk}
--!EDS PATROL END


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
