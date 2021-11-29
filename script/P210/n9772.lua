function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = _X, Y = _Y,		-- exact position of portal object!
	Type = InnenTor,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P210_Room7ChessboardDone"}, 
		-- Tor öffnet sich, sobald Spieler das Schachbrett einmal durchschritten hat
	},
	OpenActions = 
	{ 
	},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
