function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 295, Y = 150, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 302, Y = 173, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 272, Y = 181, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 252, Y = 155, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 240, Y = 191, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 231, Y = 161, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 274, Y = 145, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
--!EDS PATROL END


Respawn
{
	X = 233, Y = 174, NoSpawnEffect = FALSE, WaitTime = 20,
	Conditions = 
	{ 
		BuildingInRange {X = 233, Y = 174, Range = 0}
	},
	Actions = 
	{
	},
}


EndDefinition()

end
