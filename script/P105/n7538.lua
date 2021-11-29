function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 240, Y = 156, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 263, Y = 139, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 269, Y = 123, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 283, Y = 137, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 260, Y = 155, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
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
