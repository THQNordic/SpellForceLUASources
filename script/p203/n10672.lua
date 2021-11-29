function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Osttor des Lagers in der Kartenmitte wird geöffnet wenn alle Belagerer tot sind und der Spieler sich nähert

OnPortalEvent
{
	UpdateInterval = 20,
	X = 326, Y = 275,		-- exact position of portal object!
	Type = PalisadenTor,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_P203BlockadeVernichtet"},
		PlayerUnitInRange {X = 337,Y = 275, Range = 10},
		
	},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}


EndDefinition()

end
