function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--!EDS RESPAWN BEGIN
Respawn{WaitTime=120, X=_X, Y=_Y}
--!EDS RESPAWN END

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 224, Y = 291, Radius = 0}
DefineLocationCircle{Name = "Point002", X = 242, Y = 291, Radius = 0}
DefineLocationCircle{Name = "Point003", X = 256, Y = 291, Radius = 0}
DefineLocationCircle{Name = "Point004", X = 267, Y = 291, Radius = 0}
DefineLocationCircle{Name = "Point005", X = 279, Y = 291, Radius = 0}
DefineLocationCircle{Name = "Point006", X = 291, Y = 291, Radius = 0}
DefineLocationCircle{Name = "Point007", X = 304, Y = 291, Radius = 0}
DefineLocationCircle{Name = "Point008", X = 317, Y = 291, Radius = 0}
DefineLocationCircle{Name = "Point009", X = 332, Y = 291, Radius = 0}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
AddControlPoint{Name = "007", Location = "Point007",WalkMode = Walk}
AddControlPoint{Name = "008", Location = "Point008",WalkMode = Walk}
AddControlPoint{Name = "009", Location = "Point009",WalkMode = Walk}
--!EDS PATROL END

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
