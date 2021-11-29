function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)
OnPortalEvent
{
	UpdateInterval = 20,
	X = 443, Y = 426,		-- exact position of portal object!
	Type = SteinTorKlein,		-- type of portal
	StayOpen = TRUE,
	OpenConditions = {
						IsGlobalFlagTrue{Name = "Q138GuardianOpeningGate", UpdateInterval = 10}
						},	-- no conditions: open when player unit approaches
	OpenActions = {	SetGlobalFlagTrue{Name = "Q138IsEastgateOpen"} },
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	CloseActions = {},
}	

EndDefinition()

end
