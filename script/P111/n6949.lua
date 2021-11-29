function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPlatformOneTimeEvent
{
	Conditions =
	{
		
    },
	Actions =
	{
		SetEffect { Effect = "Torch", X = 112, Y = 45, Length = 5000 , TargetType = Object},
		
	},
}



EndDefinition()

end
