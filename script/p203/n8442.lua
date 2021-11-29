function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Portal direkt am Eingang von Onyx Shore, wird geöffnet wenn der Grabräuber tot ist
OnPortalEvent
{
	UpdateInterval = 20,
	X = 56, Y = 425,		-- exact position of portal object!
	Type = SteinTorGross,		-- type of portal
	OpenConditions = 
	{ 
		ODER
		(
			IsPlatformFlagTrue {Name = "p_n_P203GrabraeuberTot"},
			IsGlobalFlagTrue {Name = "g_P204_TorOnyxOffen"}
		)
		
	},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
