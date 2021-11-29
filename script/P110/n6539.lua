function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Rem = [[

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 414, Y = 224, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 408, Y = 215, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 393, Y = 224, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 374, Y = 238, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 358, Y = 255, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 359, Y = 276, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 375, Y = 288, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 390, Y = 304, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 399, Y = 315, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 397, Y = 342, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 392, Y = 325, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 388, Y = 301, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 363, Y = 279, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 360, Y = 254, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 382, Y = 238, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 408, Y = 232, Radius = 2}

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
--!EDS PATROL END


]]

EndDefinition()

end
