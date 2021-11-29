--Tor zum Endkampf

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = _X, Y = _Y, StayOpen = TRUE, EnableClosing = FALSE, Type = SteinTorKlein,
	OpenConditions = 
	{
		ODER9
		{
			IsGlobalFlagTrue {Name = "g_P211CSBefreiungGelaufen", UpdateInterval = 20},
			IsGlobalFlagTrue {Name = "g_P211CSPhoenixAuftrittGelaufen", UpdateInterval = 20}
		},
			
	} ,
	OpenActions = 
	{
		SetGlobalFlagTrue {Name = "g_P211TorZumForgerAuf"}
	},
}

EndDefinition()

end
