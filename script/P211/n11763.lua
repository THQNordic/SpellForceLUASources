-- Tor zu Ebene

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnPortalEvent
{
	X = _X, Y = _Y, StayOpen = TRUE, EnableClosing = FALSE, Type = SteinTorGross,
	OpenConditions = 
	{
		--IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen", UpdateInterval = 30},
		--FigureInRange {X = 245, Y = 165, NpcId = 0, Range = 4},
		IsGlobalFlagTrue {Name = "g_P211_CSIshtarTorAuf", UpdateInterval = 30},
	} ,
	OpenActions = 
	{
			SetGlobalFlagTrue {Name = "g_P211EbeneErrreicht"}
	},
}



EndDefinition()

end
