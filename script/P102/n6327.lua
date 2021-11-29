function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 310, Y = 398, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 313, Y = 394, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 313, Y = 391, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
--!EDS PATROL END

--OneTimeInitAction (ChangeRace {Race = 152, NpcId = self})

EndDefinition()

end
