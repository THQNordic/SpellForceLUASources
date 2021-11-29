function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 286, Y = 253, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 296, Y = 258, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 307, Y = 248, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 302, Y = 236, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 285, Y = 238, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
--!EDS PATROL END

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MedusaSpawnEnd"},
	},
}



EndDefinition()

end
