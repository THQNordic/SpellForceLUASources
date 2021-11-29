function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 361, Y = 256, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 357, Y = 266, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 350, Y = 264, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 347, Y = 255, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 337, Y = 254, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 333, Y = 252, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 336, Y = 244, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 344, Y = 242, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 345, Y = 253, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 348, Y = 260, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 353, Y = 266, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 358, Y = 265, Radius = 2}
DefineLocationCircle{Name = "Point013", X = 361, Y = 258, Radius = 2}
DefineLocationCircle{Name = "Point014", X = 362, Y = 252, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk}
AddControlPoint{Name = "009", Location = "Point009",WalkMode = Walk}
AddControlPoint{Name = "010", Location = "Point010",WalkMode = Walk}
AddControlPoint{Name = "011", Location = "Point011",WalkMode = Walk}
AddControlPoint{Name = "012", Location = "Point012",WalkMode = Walk}
AddControlPoint{Name = "013", Location = "Point013",WalkMode = Walk}
AddControlPoint{Name = "014", Location = "Point014",WalkMode = Walk}
--!EDS PATROL END

OnToggleEvent
{
	OnConditions = 
	{
		IsGlobalFlagTrue {Name = "g_P205_CutsceneGartentor", UpdateInterval = 10},
	},
	OnActions = 
	{
		SetNoFightFlagTrue{NpcId = self},	
	},
	OffConditions = 
	{
		IsGlobalFlagFalse {Name = "g_P205_CutsceneGartentor", UpdateInterval = 10},
	},
	OffActions = 
	{
		SetNoFightFlagFalse{NpcId = self},
	}
}



Respawn
{
		WaitTime = 20,
		UnitId = self ,
		Target = none ,
		X = startX ,
		Y = startY ,
		Chief = none,
		NoSpawnEffect = TRUE ,
		Conditions =
		{ 
			IsGlobalFlagFalse {Name = "g_P205_Hunde1StopSpawn"}, 
		},
		Actions = {} ,
		DeathActions = { }
}

EndDefinition()

end
