--Kathai mit jenquai am Anfang

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = {},
	Actions = 
	{
		ChangeFigureOwner {NpcId = self},
		--ChangeRace {Race = 2, NpcId = self}
	},
}

EndDefinition()

end
