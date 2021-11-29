function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 129, Y = 95, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 137, Y = 94, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 149, Y = 94, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 151, Y = 100, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 155, Y = 106, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 156, Y = 110, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 152, Y = 117, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 149, Y = 119, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 147, Y = 121, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 140, Y = 120, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 138, Y = 117, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 132, Y = 113, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 131, Y = 110, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 130, Y = 105, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 129, Y = 100, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 129, Y = 96, Radius = 2}

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



EndDefinition()

end
