function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 238, Y = 215, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 219, Y = 215, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 209, Y = 224, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 209, Y = 238, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 203, Y = 242, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 203, Y = 263, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 209, Y = 269, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 211, Y = 277, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 223, Y = 288, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 227, Y = 279, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 227, Y = 266, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 221, Y = 248, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 224, Y = 237, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 225, Y = 230, Radius = 2}
DefineLocationCircle{Name = "Point015", X = 229, Y = 230, Radius = 2}
DefineLocationCircle{Name = "Point016", X = 229, Y = 243, Radius = 2}
DefineLocationCircle{Name = "Point017", X = 234, Y = 242, Radius = 2}
DefineLocationCircle{Name = "Point018", X = 234, Y = 236, Radius = 2}
DefineLocationCircle{Name = "Point019", X = 238, Y = 236, Radius = 2}

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
