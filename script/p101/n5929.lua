-- Kröte, die keinem in die Quere kommen soll


function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPlatformOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = { },
	Actions = 
	{ 
	HoldPosition{NpcId = self},
	}, 
}

EndDefinition()

end
