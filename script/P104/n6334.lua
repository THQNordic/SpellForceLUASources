function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Das Tor öffnet sich kurz bevor die Flüchtlinge loslaufen
OnPortalEvent
{
	UpdateInterval = 20,
	X = 297, Y = 218,		-- exact position of portal object!
	Type = ElfenTor,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue{Name = "FugitivesReachedPosition2", UpdateInterval = 10},
	},	-- no conditions: open when player unit approaches
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	OpenActions =
	{
		SetGlobalTimeStamp {Name = "FugitivesGate1"},
		SetGlobalFlagFalse{Name = "FugitivesMovingToPosition2"},
	},
	StayOpen = TRUE,
}

EndDefinition()

end
