function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 154, Y = 104, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 156, Y = 110, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 154, Y = 106, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 151, Y = 101, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 150, Y = 95, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 151, Y = 86, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 153, Y = 78, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 149, Y = 72, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 152, Y = 77, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 152, Y = 86, Radius = 2}

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
