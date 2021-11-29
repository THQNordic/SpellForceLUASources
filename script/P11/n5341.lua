function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X , Y = _Y , 
	Conditions = { 
		IsPlayerFlagTrue {Name = "FlagTworsnikChestOpened", UpdateInterval = 20},
	}, 
	Actions = { },
}

EndDefinition()

end
