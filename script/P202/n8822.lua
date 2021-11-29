--Tor rechts nach Extict-Türmen

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = _X, Y = _Y, StayOpen = TRUE, EnableClosing = FALSE, Type = DunkelelfenTor,
	OpenConditions = 
	{
		ODER9
		{
			IsRewardFlagTrue{Name = "ExtinctTuermeWeg"},
			FigureInRange {X = 176, Y = 182, NpcId = 0, Range = 5},
		},
	},
	OpenActions = {},
}

EndDefinition()

end
