function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 164, Y = 230, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 164, Y = 223, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 167, Y = 220, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 186, Y = 221, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 186, Y = 239, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 163, Y = 239, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 164, Y = 230, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 153, Y = 230, Radius = 2}

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
