function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 109, Y = 304, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 106, Y = 301, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 107, Y = 296, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 102, Y = 292, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 100, Y = 286, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 89, Y = 278, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 85, Y = 281, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 78, Y = 272, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 74, Y = 264, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 69, Y = 253, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 67, Y = 250, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 76, Y = 268, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 86, Y = 281, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 82, Y = 285, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 85, Y = 282, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 91, Y = 289, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 89, Y = 291, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 91, Y = 289, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 96, Y = 297, Radius = 2}
DefineLocationCircle{Name = "Point020", X = 100, Y = 297, Radius = 2}

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
AddControlPoint{Name = "020", Location = "Point020",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
