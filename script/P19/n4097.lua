function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 230, Y = 287, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 224, Y = 286, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 232, Y = 278, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 248, Y = 272, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 245, Y = 262, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 225, Y = 260, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 225, Y = 250, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 243, Y = 243, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 243, Y = 238, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 235, Y = 244, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 222, Y = 249, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 232, Y = 261, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 249, Y = 266, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 250, Y = 276, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 236, Y = 283, Radius = 2}

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
AddControlPoint{Name = "015", Location = "Point015",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
