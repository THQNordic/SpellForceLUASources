function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = 425, Y = 286, StayOpen = TRUE , Type = PortalKeep, 
	OpenConditions = { Negated(QuestState{QuestId = 86 , State = StateUnknown}) },
	OpenActions = {},
}


EndDefinition()

end
