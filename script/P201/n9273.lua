function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{

	Conditions = 
	{
		IsGlobalFlagTrue{Name = "GDS_PlayerWasOnPlatform_P203"},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
	},
	Actions = 
	{
	
	}
} 
EndDefinition()

end
