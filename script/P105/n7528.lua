function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 237, Y = 162, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 271, Y = 146, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 268, Y = 175, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
--!EDS PATROL END



Respawn
{
	X = 305, Y = 174, NoSpawnEffect = FALSE, WaitTime = 20,
	Conditions = 
	{ 
		BuildingInRange {X = 307, Y = 174, Range = 0}
	},
	Actions = 
	{
	},
}


EndDefinition()

end
