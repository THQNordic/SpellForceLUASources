function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Steintor öffen Menschen/Orks

OnPortalEvent
{
	X = 156, Y = 130, 
	StayOpen = TRUE, 
	Type = SteinTorKlein, 
	OpenConditions = {Negated(IsClanSize{Clan = 15, Size = 1}), IsGlobalTimeElapsed{Name = "DoorOpen", Seconds = 10}},
	CloseConditions = {},
	OpenActions = {},
	CloseActions = {},
}

EndDefinition()

end
