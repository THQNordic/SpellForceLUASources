function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 250 , Y = 223,		-- exact position of portal object!
	Type = SteinTorGross,		-- type of portal
	OpenConditions = 
			{
			IsGlobalFlagTrue {Name = "DialogWasserquelleEnded"}, --Wenn die Wasserquelle vergiftet wurde
			FigureInRange{ X = 250 , Y = 223 , NpcId = Avatar , Range = 4},
			},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	OpenActions = {
					SetGlobalFlagTrue {Name = "TorGeoeffnetWaldlaeufer"},
					QuestSolve{QuestId = 566},
					QuestBegin{QuestId = 564}
					},
	StayOpen = TRUE,
}

EndDefinition()

end
