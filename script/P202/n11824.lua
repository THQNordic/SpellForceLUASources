--Gargoyle "Sonnenuhr"

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = { },
	Actions = 
	{ 
		HoldPosition {NpcId = 11249}, 
		
		ChangeRace {Race = 152, NpcId = self}
	}
}


EndDefinition()

end
