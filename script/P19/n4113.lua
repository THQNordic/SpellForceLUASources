function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 351, Y = 312, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 348, Y = 316, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 364, Y = 326, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 401, Y = 340, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 410, Y = 336, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 404, Y = 329, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 386, Y = 326, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 364, Y = 316, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk}
--!EDS PATROL END




EndDefinition()

end
