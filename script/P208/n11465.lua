function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Wenn alle Questengelöst sind geht das Tor zum letzten Teil auf damit der Spieler zum Colloseum kommt
OnPortalEvent
{
	UpdateInterval = 60,
	X = 339, Y = 399,		-- exact position of portal object!
	Type = SteinTorGross,		-- type of portal
	OpenConditions = 
	{ 
		QuestState {QuestId = 863, State = StateSolved}
	},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
