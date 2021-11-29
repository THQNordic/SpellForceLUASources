function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 308, Y = 384, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 313, Y = 388, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 310, Y = 392, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 302, Y = 392, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 294, Y = 390, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 288, Y = 392, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
--!EDS PATROL END

--OneTimeInitAction (ChangeRace {Race = 152, NpcId = self})

EndDefinition()

end
