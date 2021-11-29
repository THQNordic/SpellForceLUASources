function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 205, Y = 175, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 226, Y = 181, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 238, Y = 168, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 230, Y = 152, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 218, Y = 141, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
