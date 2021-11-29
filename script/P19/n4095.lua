function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 369, Y = 224, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 378, Y = 233, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 381, Y = 265, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 377, Y = 267, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 376, Y = 262, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 380, Y = 251, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 374, Y = 233, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
