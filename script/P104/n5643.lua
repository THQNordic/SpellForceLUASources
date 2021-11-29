function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Das Tor öffnet sich wenn die EisElfenSchlampe dran rumfummelt
OnPortalEvent
{
	UpdateInterval = 20,
	X = 448, Y = 350,		-- exact position of portal object!
	Type = SteinTorKlein,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue{Name = "TorAuf", UpdateInterval = 10},
	},	-- no conditions: open when player unit approaches
	OpenActions =
	{
		SetGlobalFlagTrue {Name = "TorAufLeaLos"},
		QuestSolve {QuestId = 578}, 
		SetRewardFlagTrue {Name = "Schluesselmeisterin"},
		SetGlobalFlagFalse {Name = "SchluesselGegeben"},
		QuestBegin {QuestId = 583},
	},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
