function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=60}
--!EDS RESPAWN END





--DefineLocationCircle{Name = "Point001", X = 58, Y = 48, Radius = 3}
--DefineLocationCircle{Name = "Point002", X = 65, Y = 45, Radius = 3}
--DefineLocationCircle{Name = "Point003", X = 66, Y = 38, Radius = 3}
--DefineLocationCircle{Name = "Point004", X = 66, Y = 33, Radius = 3}

--AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
--AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
--AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
--AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}

--AddGotoLocation{X = 60, Y = 50, Radius = 1}
--AddGotoLocation{X = 63, Y = 50, Radius = 1}
--AddGotoLocation{X = 66, Y = 50, Radius = 1}
--AddGotoLocation{X = 70, Y = 50, Radius = 1}


--OnIdleDoTorchJob
--{
--	Name = "FackelTest", X = 57, Y = 49, Direction = 6,
--	TurnOff = TRUE , WaitForIdle = TRUE , UpdateInterval = 60
--}


EndDefinition()

end
