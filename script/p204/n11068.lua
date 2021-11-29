function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 219, Y = 213, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 220, Y = 206, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 235, Y = 205, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 220, Y = 206, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 220, Y = 213, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 208, Y = 223, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 195, Y = 224, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 197, Y = 237, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 209, Y = 238, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 208, Y = 223, Radius = 2}

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
--!EDS PATROL END



EndDefinition()

end
