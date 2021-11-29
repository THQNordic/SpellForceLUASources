function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 372, Y = 461,		-- exact position of portal object!
	Type = SteinTorGross,		-- type of portal
	OpenConditions = {
						IsGlobalFlagTrue{Name = "WhisperGateHokanOpen" , UpdateInterval = 1}
						},	-- no conditions: open when player unit approaches
	OpenActions = {	},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	CloseActions = {},
	StayOpen = TRUE,
}
EndDefinition()

end
