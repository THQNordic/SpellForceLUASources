function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 337, Y = 159, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 344, Y = 162, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 331, Y = 159, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 315, Y = 153, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 299, Y = 156, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 288, Y = 142, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 300, Y = 155, Radius = 2}

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
	X = 346, Y = 170, NoSpawnEffect = FALSE, WaitTime = 20,
	Conditions = 
	{ 
		BuildingInRange {X = 345, Y = 170, Range = 0}
	},
	Actions = 
	{
	},
}


EndDefinition()

end
