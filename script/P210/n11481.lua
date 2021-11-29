function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 5}
--!EDS ONIDLEGOHOME END

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
			IsGlobalCounter{Name = "g_P210_Faktorcounter", Value = 18, Operator = IsEqual, UpdateInterval = 20},
			IsGlobalCounter{Name = "g_P210_Faktorcounter", Value = 1, Operator = IsEqual,UpdateInterval = 20},
			IsGlobalCounter{Name = "g_P210_Faktorcounter", Value = 5, Operator = IsEqual, UpdateInterval = 20},
		},
	},
	Actions =
	{
		ChangeRace{Race = 121, NpcId = self}
	},
}


EndDefinition()

end
