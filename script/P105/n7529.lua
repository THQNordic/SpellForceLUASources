function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 255, Y = 158, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 259, Y = 129, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 273, Y = 125, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 287, Y = 145, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 251, Y = 148, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
--!EDS PATROL END


Respawn
{
	X = 275, Y = 124, NoSpawnEffect = FALSE, WaitTime = 20,
	Conditions = 
	{ 
		BuildingInRange {X = 275, Y = 124, Range = 0}
	},
	Actions = 
	{
	},
}


EndDefinition()

end
