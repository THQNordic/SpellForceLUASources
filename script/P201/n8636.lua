function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		AvatarLevel {Level = 28, Player = self , UpdateInterval = 60},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
		IsGlobalFlagFalse{Name = "g_sP201CutszeneStartEnded"},
	},
	Actions = 
	{
	
	}
} 
EndDefinition()

end
