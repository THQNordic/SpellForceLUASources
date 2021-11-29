function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
		LookAtDirection{Direction = East},
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

EndDefinition()

end
