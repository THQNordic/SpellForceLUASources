function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 10098},
	}
}

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 274, Y = 269, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 273, Y = 254, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 258, Y = 255, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 257, Y = 252, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 243, Y = 252, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 231, Y = 264, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
--!EDS PATROL END



EndDefinition()

end
