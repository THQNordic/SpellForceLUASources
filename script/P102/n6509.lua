--> INFO: Janina killable
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Cutscene Init Arena
SpawnOnlyWhen
{
	NoSpawnEffect = TRUE, 
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "StartFinish", UpdateInterval = 10},
	} ,
	Actions = 
	{
		

	},
} 


EndDefinition()

end
