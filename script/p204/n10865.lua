function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=120, X=304, Y=226}
--!EDS RESPAWN END


--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 299, Y = 222, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 292, Y = 220, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 300, Y = 221, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 305, Y = 226, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
