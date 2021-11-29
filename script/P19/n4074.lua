function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 114, Y = 139, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 111, Y = 134, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 116, Y = 132, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 125, Y = 135, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 131, Y = 140, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 138, Y = 159, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 146, Y = 174, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 159, Y = 175, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 175, Y = 177, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 187, Y = 192, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 184, Y = 200, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 175, Y = 198, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 168, Y = 189, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 150, Y = 190, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 139, Y = 178, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 136, Y = 155, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 132, Y = 139, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 122, Y = 138, Radius = 2}

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
--!EDS PATROL END



EndDefinition()

end
