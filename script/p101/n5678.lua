-- Steintor vor Ork-TrollStadt

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 314 , Y = 219,		-- exact position of portal object!
	Type = SteinTorGross,   -- type of portal
	OpenConditions = 
			{
			IsGlobalFlagTrue {Name = "TorZurStadtAuf"}, -- Grim hat zum Angriff aufgerufen
			
			},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	OpenActions = {},
	StayOpen = TRUE,
}

EndDefinition()

end
