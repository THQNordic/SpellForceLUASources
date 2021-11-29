function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 230, Y = 233, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 227, Y = 230, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 231, Y = 225, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 241, Y = 223, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 254, Y = 229, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 253, Y = 232, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 246, Y = 237, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 242, Y = 233, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk}
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
