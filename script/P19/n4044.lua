function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 306, Y = 108, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 301, Y = 105, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 299, Y = 110, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 291, Y = 112, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 289, Y = 118, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 302, Y = 123, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 308, Y = 121, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 311, Y = 119, Radius = 2}

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
