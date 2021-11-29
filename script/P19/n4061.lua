function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 134, Y = 201, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 131, Y = 192, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 140, Y = 187, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 153, Y = 192, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 148, Y = 207, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
