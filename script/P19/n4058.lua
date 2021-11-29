function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 196, Y = 171, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 204, Y = 170, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 205, Y = 175, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 196, Y = 180, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 195, Y = 195, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 189, Y = 197, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 185, Y = 191, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 193, Y = 186, Radius = 2}

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
