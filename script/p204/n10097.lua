function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 10097},
	}
}

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 252, Y = 154, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 252, Y = 161, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 255, Y = 163, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 254, Y = 176, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 257, Y = 178, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 268, Y = 176, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 268, Y = 154, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 226, Y = 154, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
