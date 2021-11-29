function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 20,
	X = _X, Y = _Y,		-- exact position of portal object!
	Type = SteinTorGross,		-- type of portal
	OpenConditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P210_PointerACorrectlySet"},
		IsGlobalFlagTrue{Name = "g_P210_PointerBCorrectlySet"},
		IsGlobalFlagTrue{Name = "g_P210_PointerCCorrectlySet"},
		IsGlobalFlagTrue{Name = "g_P210_PointerDCorrectlySet"},
	},
	OpenActions = 
	{ 
		SetGlobalFlagTrue{Name = "g_P210_UruDespawn"},
		SetRewardFlagTrue{Name = "EntryMenhirComboCorrect"},
		QuestSolve {QuestId = 901}, -- Unterquest "Öffne das Eingangstor"
	},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}

EndDefinition()

end
