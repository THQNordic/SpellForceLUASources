function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 342, Y = 206, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 339, Y = 198, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 335, Y = 193, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 330, Y = 186, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 326, Y = 179, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 319, Y = 166, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 314, Y = 153, Radius = 2}

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
