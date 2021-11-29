function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 130, Y = 82, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 134, Y = 77, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 139, Y = 72, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 140, Y = 68, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 147, Y = 71, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 151, Y = 75, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 153, Y = 81, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 150, Y = 88, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 146, Y = 94, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 130, Y = 95, Radius = 2}

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
