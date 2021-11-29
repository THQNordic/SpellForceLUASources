function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 127, Y = 124, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 117, Y = 131, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 111, Y = 121, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 115, Y = 110, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 125, Y = 115, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 129, Y = 120, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
--!EDS PATROL END




EndDefinition()

end
