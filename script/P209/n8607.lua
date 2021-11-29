-->INFO ZwergenTor

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 357 , Y = 395,		-- exact position of portal object!
	Type = SteinTorGross,		-- type of portal
	OpenConditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209ZwergenSchluessel",  UpdateInterval = 10},
		
	},
	OpenActions = 
	{
		
	},	
	CloseConditions = {}, 	-- Standartmaessig zu
	StayOpen = TRUE,
}

EndDefinition()

end
