function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 99, Y = 299, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 96, Y = 297, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 103, Y = 280, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 103, Y = 248, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 105, Y = 219, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 115, Y = 206, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 127, Y = 205, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 137, Y = 214, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 137, Y = 231, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 129, Y = 237, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 120, Y = 235, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 123, Y = 228, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 126, Y = 233, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 133, Y = 219, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 121, Y = 209, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 108, Y = 227, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 108, Y = 265, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 107, Y = 285, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 102, Y = 292, Radius = 2}

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
AddControlPoint{Name = "016", Location = "Point016",WalkMode = Walk}
AddControlPoint{Name = "017", Location = "Point017",WalkMode = Walk}
AddControlPoint{Name = "018", Location = "Point018",WalkMode = Walk}
AddControlPoint{Name = "019", Location = "Point019",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
