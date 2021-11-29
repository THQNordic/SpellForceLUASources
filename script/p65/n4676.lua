function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Steintor öffen Dunkelelfen/Orks

OnPortalEvent
{
	X = 131, Y = 110, 
	StayOpen = TRUE, 
	Type = SteinTorKlein, 
	OpenConditions = {Negated(IsClanSize{Clan = 16, Size = 1}), IsGlobalTimeElapsed{Name = "DoorOpen", Seconds = 10}},
	CloseConditions = {},
	OpenActions = {},
	CloseActions = {},
}

EndDefinition()

end
