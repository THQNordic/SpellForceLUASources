function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 289, Y = 167, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 270, Y = 179, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 271, Y = 160, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 256, Y = 150, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 236, Y = 178, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 265, Y = 179, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 289, Y = 171, Radius = 2}

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
	X = 319, Y = 147, NoSpawnEffect = FALSE, WaitTime = 20,
	Conditions = 
	{ 
		BuildingInRange {X = 319, Y = 146, Range = 0}
	},
	Actions = 
	{
	},
}


EndDefinition()

end
