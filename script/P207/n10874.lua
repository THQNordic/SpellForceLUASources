function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

----------------------------------------
-- Alte NpcId ohne Nutzen, glaube ich --
----------------------------------------

OnPortalEvent
{
	X = _X,
	Y = _Y,
	StayOpen = TRUE,
	Type = DunkelelfenTor,
	OpenConditions = 
	{
		IsGlobalFlagTrue {Name = "g_p207_Wird_Nie_Wahr", UpdateInterval = 750},
	},
	OpenActions = 
	{
	},
}

EndDefinition()

end
