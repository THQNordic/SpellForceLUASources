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
DefineLocationCircle{Name = "Point001", X = 289, Y = 281, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 285, Y = 266, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 285, Y = 254, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 275, Y = 254, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 268, Y = 266, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 259, Y = 276, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 218, Y = 276, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 193, Y = 279, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 195, Y = 290, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 210, Y = 298, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 220, Y = 302, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 235, Y = 310, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 254, Y = 301, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 272, Y = 294, Radius = 2}

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
AddControlPoint{Name = "014", Location = "Point014",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
