
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201EndeVomAnfangCutszeneOutpost", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 10},		
	},
	Actions =
	{
		IncreaseNpcCounter {Name = "npc_cnP201ZustandOrdensritter"},
		DecreaseGlobalCounter {Name = "g_cnP201AnzahlUnterstützenderOrdensritter"},
		ChangeFigureOwner {NpcId = self},
		Follow {Target = 0, NpcId = self},	
	}
} 



dofile("script/P201/n8410_Gestaltenwandler.lua")

EndDefinition()
end