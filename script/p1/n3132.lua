function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	UpdateInterval = 20,
	X = 66, Y = 203,		-- exact position of portal object!
	Type = PortalKeep,		-- type of portal
	OpenConditions = { 
		IsPlayerFlagTrue{Name = "QuestGetToEloniSolved", UpdateInterval = 10},
	},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
