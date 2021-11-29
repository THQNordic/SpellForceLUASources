-->INFO Kaiserl. Wache2

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen 
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209SpawnKaiserGarde"},
	},
	Actions = 
	{
	
	}
} 

EndDefinition()

end
