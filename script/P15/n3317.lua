function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnPortalEvent
{
	UpdateInterval = 20,
	X = 240, Y = 237,		-- exact position of portal object!
	Type = SteinTorKlein,		-- type of portal
	OpenConditions = {
						IsGlobalFlagTrue{Name = "Q237UndeadAttack" , UpdateInterval = 20},
						},	-- no conditions: open when player unit approaches
	OpenActions = {	},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	CloseActions = {},
}	

EndDefinition()

end
