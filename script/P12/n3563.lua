function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)
OnPortalEvent
{
	UpdateInterval = 20,
	X = 193, Y = 284,		-- exact position of portal object!
	Type = StadtTor,		-- type of portal
	StayOpen = TRUE,
	OpenConditions = {
						},	-- no conditions: open when player unit approaches
	OpenActions = {	
				QuestSolve{QuestId = 191},
	            QuestBegin{QuestId = 192},
	              },
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	CloseActions = {},
}

EndDefinition()

end
