function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
SpawnOnlyWhen
{
	NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201EndeCutszeneOutpost"},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},		
	},
	Actions =
	{
		
	}
} 
dofile("script/P201/n8410_Gestaltenwandler.lua")
EndDefinition()

end




