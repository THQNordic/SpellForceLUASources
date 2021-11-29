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
		--Follow{Target = 8129, NpcId = self},
	},

}


--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 206, Y = 274, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 218, Y = 276, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 244, Y = 279, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 264, Y = 276, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 286, Y = 266, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 286, Y = 280, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 278, Y = 291, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 262, Y = 294, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 244, Y = 300, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 235, Y = 312, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 216, Y = 302, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 202, Y = 293, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 194, Y = 287, Radius = 2}

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
AddControlPoint{Name = "013", Location = "Point013",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
