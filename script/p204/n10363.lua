function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--!EDS RESPAWN BEGIN
Respawn{WaitTime=120, X=_X, Y=_Y}
--!EDS RESPAWN END

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
		LookAtDirection{Direction = North},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		   IsGlobalFlagTrue {Name = "g_P204_GartenwacheAttacke", UpdateInterval = 10},
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
