function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 245, Y = 283, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 208, Y = 241, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 267, Y = 223, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 273, Y = 274, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 213, Y = 253, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 208, Y = 270, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 199, Y = 237, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 241, Y = 213, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 253, Y = 291, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 234, Y = 228, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 209, Y = 276, Radius = 2}

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
