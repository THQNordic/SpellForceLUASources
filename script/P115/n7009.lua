function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 75 , Y = 182,		-- exact position of portal object!
	Type = SteinTorKlein,		-- type of portal
	OpenConditions = 
	{
		IsGlobalFlagTrue { Name = "ArynTorOeffnenP115" }, 
	},	
	CloseConditions = {}, 	-- Standartmaessig zu
	StayOpen = TRUE,
}


EndDefinition()

end
