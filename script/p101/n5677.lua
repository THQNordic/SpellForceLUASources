-- Steintor vor Portal nach Fire City

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 15,
	X = 351 , Y = 246,		-- exact position of portal object!
	Type = SteinTorGross,   -- type of portal
	OpenConditions = 
			{
			FigureInRange{ NpcId = 6116, X = 350, Y = 247, Range = 7},
			FigureInRange{ NpcId = 7011, X = 350, Y = 247, Range = 7},
			},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	OpenActions = {
--					SetGlobalFlagTrue {Name = "TorGeoeffnetFireCity"},
--					QuestSolve{QuestId = 566},
--					QuestBegin{QuestId = 564}
					},
	StayOpen = TRUE,
}

EndDefinition()

end
