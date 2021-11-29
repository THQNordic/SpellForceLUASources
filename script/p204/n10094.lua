function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 10094},
	}
}

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 374, Y = 195, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 367, Y = 188, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 347, Y = 189, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 347, Y = 234, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 330, Y = 250, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 347, Y = 233, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 347, Y = 188, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 368, Y = 188, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 374, Y = 194, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk}
AddControlPoint{Name = "009", Location = "Point009",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
