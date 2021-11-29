function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 370, Y = 235, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 360, Y = 235, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 350, Y = 219, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 335, Y = 224, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 331, Y = 217, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 341, Y = 209, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 351, Y = 220, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 362, Y = 235, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 371, Y = 235, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 376, Y = 244, Radius = 2}

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
			IsGlobalFlagFalse {Name = "g_P205_Hunde2StopSpawn"}, 
		},
		Actions = {} ,
		DeathActions = { }
}







EndDefinition()

end
