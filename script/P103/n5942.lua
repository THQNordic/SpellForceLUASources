function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "Kill den doppelten Reowys", UpdateInterval = 10},
	},
		
 	Actions = 
	{ 
		Vanish {}
	},
}

EndDefinition()

end
