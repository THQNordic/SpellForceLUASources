function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 119, Y = 323, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 131, Y = 327, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 140, Y = 321, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 125, Y = 310, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 99, Y = 324, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 101, Y = 338, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 112, Y = 347, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 122, Y = 346, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 140, Y = 352, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 144, Y = 342, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 142, Y = 333, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 142, Y = 319, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 132, Y = 329, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 125, Y = 324, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 116, Y = 330, Radius = 2}

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
