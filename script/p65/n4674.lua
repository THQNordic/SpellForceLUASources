function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Steintor öffen Zwerge/Menschen

OnPortalEvent
{
	X = 130, Y = 154, 
	StayOpen = TRUE, 
	Type = SteinTorKlein, 
	OpenConditions = {Negated(IsClanSize{Clan = 14, Size = 1}), IsGlobalTimeElapsed{Name = "DoorOpen", Seconds = 10}},
	CloseConditions = {},
	OpenActions = {},
	CloseActions = {},
}

EndDefinition()

end
