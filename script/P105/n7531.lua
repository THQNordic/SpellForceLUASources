function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 297, Y = 170, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 296, Y = 184, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 270, Y = 182, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
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
