function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	X = 345, Y = 312, StayOpen = TRUE , Type = SteinTorGross, 
	OpenConditions = { QuestState{QuestId = 302 , State = StateActive} } ,
	OpenActions = {},
}

EndDefinition()

end
