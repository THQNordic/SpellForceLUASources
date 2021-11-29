function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)
OnPortalEvent
{
	UpdateInterval = 20,
	X = 450 , Y = 242,		-- exact position of portal object!
	Type = SteinTorGross,		-- type of portal
	OpenConditions = {
						IsGlobalFlagTrue{Name = "Q18EinarToPortalFinal" , UpdateInterval = 1}
						},	-- no conditions: open when player unit approaches
	OpenActions = {	SetGlobalFlagTrue{Name = "Q18EinarToPortalFinalGo"}},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	CloseActions = {},
	StayOpen = TRUE,
}

EndDefinition()

end
