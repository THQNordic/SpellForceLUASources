function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 90, Y = 99, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 91, Y = 159, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 118, Y = 183, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 146, Y = 179, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 165, Y = 159, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 165, Y = 96, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 143, Y = 78, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 110, Y = 79, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk}
--!EDS PATROL END

OneTimeInitAction (ChangeRace {Race = 152, NpcId = self})

EndDefinition()

end
