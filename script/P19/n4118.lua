function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 127, Y = 124, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 117, Y = 131, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 111, Y = 121, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 115, Y = 110, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 125, Y = 115, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 129, Y = 120, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 130, Y = 110, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 125, Y = 116, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 116, Y = 108, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 122, Y = 100, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 130, Y = 103, Radius = 2}

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
--!EDS PATROL END



EndDefinition()

end
