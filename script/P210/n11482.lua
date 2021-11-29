function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 20,
	Conditions =
	{
		ODER9
		{
			IsGlobalCounter{Name = "g_P210_Binaercounter", Value = 24, Operator = IsEqual, UpdateInterval = 20},
			IsGlobalCounter{Name = "g_P210_Binaercounter", Value = 5, Operator = IsEqual,UpdateInterval = 20},
			IsGlobalCounter{Name = "g_P210_Binaercounter", Value = 12, Operator = IsEqual, UpdateInterval = 20},
		},
	},
	Actions =
	{
		ChangeRace{Race = 121, NpcId = self}
	},
}

EndDefinition()

end             