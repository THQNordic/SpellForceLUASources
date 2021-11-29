function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 177, Y = 278, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 171, Y = 278, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 164, Y = 277, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 161, Y = 279, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 164, Y = 279, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 166, Y = 277, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 171, Y = 278, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 171, Y = 284, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 172, Y = 286, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 177, Y = 285, Radius = 2}
DefineLocationCircle{Name = "Point011", X = 172, Y = 285, Radius = 2}
DefineLocationCircle{Name = "Point012", X = 170, Y = 278, Radius = 2}

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
--!EDS PATROL END

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_PalastgartenCutsceneStart", UpdateInterval = 10},	
	},
	
	Actions =
	{
		SetNoFightFlagTrue{NpcId = self},
	}
}








EndDefinition()

end
