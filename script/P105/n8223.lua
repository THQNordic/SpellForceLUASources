function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 252, Y = 267, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 243, Y = 268, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 243, Y = 284, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 260, Y = 284, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 276, Y = 268, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 276, Y = 244, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 266, Y = 235, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 234, Y = 236, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 234, Y = 243, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 245, Y = 243, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 255, Y = 253, Radius = 2}

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
--!EDS PATROL END



EndDefinition()

end
