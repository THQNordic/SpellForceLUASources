function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 116 , Y = 173,		-- exact position of portal object!
	Type = SteinTorKlein,		-- type of portal
	OpenConditions = 
			{
				IsGlobalFlagTrue { Name = "P110_SunGateOpened"},--Wenn der Schlüssel vom SternenMentalist erhalten wurde
			},
	OpenActions = 
			{
				SetGlobalFlagTrue {Name = "P110_Gargoyles"},
			},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
