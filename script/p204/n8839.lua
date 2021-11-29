function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=120, X=_X, Y=_Y}
--!EDS RESPAWN END

--!EDS PATROL BEGIN
DefineLocationCircle{Name = "Point001", X = 257, Y = 227, Radius = 2}
DefineLocationCircle{Name = "Point002", X = 269, Y = 228, Radius = 2}

AddControlPoint{Name = "001", Location = "Point001",WalkMode = Walk}
AddControlPoint{Name = "002", Location = "Point002",WalkMode = Walk}
--!EDS PATROL END


OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
	}
}


--- Wache wird agro nach cutscene Alyah Dryade ---
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_EmpyriaAlarmiert"},
	},

	Actions =
	{
		ChangeRace{Race = 150, NpcId = self},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
	   IsGlobalFlagTrue {Name = "g_P204_SuedtorAttacke"},
	},

	Actions =
	{
		ChangeRace{Race = 150, NpcId = self},
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
