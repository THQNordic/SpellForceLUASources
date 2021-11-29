function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Das Portal gibt den Canyon erst frei wenn der Karawanenboss die Karawane losgeschickt
OnPortalEvent
{
	UpdateInterval = 20,
	X = 252, Y = 188,		-- exact position of portal object!
	Type = SteinTorGross,		-- type of portal
	OpenConditions = 
	{ 
		-- Nur wenn die Karawane losläuft soll auch das Tor aufgehen
		IsGlobalFlagTrue{Name = "c_P206_KarawaneAmTor", UpdateInterval = 10},
	},	
	OpenActions =
	{
		SetGlobalFlagTrue {Name = "g_P206_TorAuf"},
		ChangeRace {NpcId = 9870, Race = 4},
	},
	CloseConditions = {},
	StayOpen = TRUE,
}


EndDefinition()

end
