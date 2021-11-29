function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 10096},
	}
}

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 290, Y = 198, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 295, Y = 194, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 311, Y = 195, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 311, Y = 202, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 329, Y = 218, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 311, Y = 202, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 311, Y = 195, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 294, Y = 194, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 289, Y = 198, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 256, Y = 198, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk}
AddControlPoint{Name = "009", Location = "Point009",WalkMode = Walk}
AddControlPoint{Name = "010", Location = "Point010",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
