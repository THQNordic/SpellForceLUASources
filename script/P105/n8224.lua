function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 224, Y = 246, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 224, Y = 231, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 229, Y = 229, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 228, Y = 242, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 234, Y = 243, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 234, Y = 235, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 266, Y = 236, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 277, Y = 245, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 277, Y = 268, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 259, Y = 284, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 243, Y = 285, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 243, Y = 288, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 226, Y = 288, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 227, Y = 267, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 221, Y = 260, Radius = 2}

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
