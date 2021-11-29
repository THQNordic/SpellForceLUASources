function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 69, Y = 153, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 86, Y = 146, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 92, Y = 140, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 79, Y = 120, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 80, Y = 98, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 87, Y = 81, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 74, Y = 60, Radius = 2}

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
