function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = _X,
	Y = _Y,
	StayOpen = TRUE,
	Type = DunkelelfenTor,
	OpenConditions = 
	{
		IsGlobalFlagTrue{Name = "g_P207_Undead_Rohen_And_His_Army_Has_Entered_The_Building"},
	},
	OpenActions = 
	{
	},
}

EndDefinition()

end
