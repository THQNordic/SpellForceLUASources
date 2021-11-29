function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 261, Y = 78, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 271, Y = 82, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 283, Y = 87, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 278, Y = 97, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 264, Y = 95, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 258, Y = 83, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
