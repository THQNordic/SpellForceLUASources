function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 147, Y = 137, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 151, Y = 115, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 145, Y = 104, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 134, Y = 114, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 139, Y = 124, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 152, Y = 133, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 155, Y = 143, Radius = 2}

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
