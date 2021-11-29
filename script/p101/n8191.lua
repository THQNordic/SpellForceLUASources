function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 154, Y = 91, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 130, Y = 79, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 110, Y = 69, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 107, Y = 54, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 113, Y = 49, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
