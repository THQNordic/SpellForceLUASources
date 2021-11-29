function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 334, Y = 312, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 334, Y = 301, Radius = 2}
DefineLocationCircle{Name = "Point003", X = 279, Y = 300, Radius = 2}
DefineLocationCircle{Name = "Point004", X = 334, Y = 300, Radius = 2}
DefineLocationCircle{Name = "Point005", X = 334, Y = 312, Radius = 2}
DefineLocationCircle{Name = "Point006", X = 348, Y = 312, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
AddControlPoint{Name = "003", Location = "Point003",WalkMode = Walk}
AddControlPoint{Name = "004", Location = "Point004",WalkMode = Walk}
AddControlPoint{Name = "005", Location = "Point005",WalkMode = Walk}
AddControlPoint{Name = "006", Location = "Point006",WalkMode = Walk}
--!EDS PATROL END


--!EDS RESPAWN BEGIN
Respawn{WaitTime=120, X=_X, Y=_Y}
--!EDS RESPAWN END

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