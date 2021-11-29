function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 182 , Y = 298,		-- exact position of portal object!
	Type = PalisadenTor,		-- type of portal
	OpenConditions = 
	{
	IsGlobalFlagTrue {Name = "TorOeffnerKitharFestung"}, --Wenn die Wasserquelle vergiftet wurde und Haupttor geöffnet wurde
	},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
