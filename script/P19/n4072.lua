function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 140, Y = 82, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 143, Y = 82, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 140, Y = 93, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 133, Y = 101, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 130, Y = 117, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 129, Y = 131, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 132, Y = 145, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 142, Y = 165, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 139, Y = 178, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 129, Y = 178, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 127, Y = 172, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 133, Y = 165, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 134, Y = 153, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 129, Y = 139, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 130, Y = 112, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 136, Y = 92, Radius = 2}

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
