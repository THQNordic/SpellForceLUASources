function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Rem = [[

OnOneTimeEvent
{
	
	Conditions = 
	{
		FigureAlive {NpcId = 6539},
	},
		
 	Actions = 
	{ 
		Follow {Target = 6539 , NpcId = self},
	},
}

]]
EndDefinition()

end
