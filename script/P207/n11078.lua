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
		IsGlobalFlagTrue{Name = "g_P207_This_Gate_Will_Never_Be_Opened"},
	},
	OpenActions = 
	{
	},
}

EndDefinition()

end
