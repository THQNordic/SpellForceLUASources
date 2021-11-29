function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 276, Y = 268, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 276, Y = 245, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 266, Y = 236, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 258, Y = 235, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 266, Y = 236, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 277, Y = 245, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 276, Y = 269, Radius = 2}

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
