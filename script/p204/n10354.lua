function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 164, Y = 278, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 163, Y = 280, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 156, Y = 278, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 150, Y = 281, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 157, Y = 278, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 160, Y = 281, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
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
