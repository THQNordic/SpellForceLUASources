--Tor zu HadekoSpiel

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = _X, Y = _Y, StayOpen = TRUE, EnableClosing = FALSE, Type = DunkelelfenTor,
	OpenConditions =
	{
		IsRewardFlagTrue {Name = "AschetaenzerTot", UpdateInterval = 10}

	},
	OpenActions = {},
}


EndDefinition()

end
