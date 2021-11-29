function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 368, Y = 234, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 359, Y = 234, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 355, Y = 224, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 347, Y = 217, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 355, Y = 224, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 358, Y = 232, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 368, Y = 235, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 377, Y = 241, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk}
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
