function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 121, Y = 183, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 102, Y = 200, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 93, Y = 214, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 93, Y = 232, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 97, Y = 234, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 99, Y = 228, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 99, Y = 213, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 112, Y = 198, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 130, Y = 186, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 146, Y = 177, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 145, Y = 172, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 133, Y = 175, Radius = 2}

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
--!EDS PATROL END



EndDefinition()

end
