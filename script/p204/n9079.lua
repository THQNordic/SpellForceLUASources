function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--!EDS RESPAWN BEGIN
Respawn{WaitTime=120, X=_X, Y=_Y}
--!EDS RESPAWN END

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 182, Y = 290, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 186, Y = 288, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 190, Y = 290, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 189, Y = 299, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 179, Y = 289, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 167, Y = 290, Radius = 2}
DefineLocationCircle{Name = "Point007", X = 159, Y = 299, Radius = 2}
DefineLocationCircle{Name = "Point008", X = 158, Y = 288, Radius = 2}
DefineLocationCircle{Name = "Point009", X = 166, Y = 288, Radius = 2}
DefineLocationCircle{Name = "Point010", X = 168, Y = 290, Radius = 2}

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


--- Wache wird lieb wenn Alyah Kaiserin ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_AlyahKaiserin"},
	},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
	}
}



EndDefinition()

end
