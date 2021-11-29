function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 96, Y = 234, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 95, Y = 212, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 133, Y = 178, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 168, Y = 174, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 145, Y = 178, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 126, Y = 184, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 102, Y = 204, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 95, Y = 220, Radius = 2}

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
