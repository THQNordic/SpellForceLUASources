function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 285, Y = 118, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 298, Y = 121, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 306, Y = 112, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 303, Y = 103, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 294, Y = 92, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 280, Y = 91, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 271, Y = 98, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 273, Y = 112, Radius = 2}

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
