function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 168, Y = 117, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 163, Y = 142, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 137, Y = 151, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 152, Y = 129, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
--!EDS PATROL END




EndDefinition()

end
