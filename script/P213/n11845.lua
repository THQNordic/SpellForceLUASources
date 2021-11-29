function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPlatformOneTimeEvent
{
	Conditions =
	{
	},
	Actions =
	{
		ChangeRace {Race = 152},
	}
}

EndDefinition()

end
