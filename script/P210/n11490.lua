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
		IsGlobalFlagTrue{Name = "g_P210_Room3GateFOpen"},
	},
	Actions =
	{
		ChangeRace{Race = 121, NpcId = self}
	},
}


EndDefinition()

end
