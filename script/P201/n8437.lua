function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
SpawnOnlyWhen
{
	NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201EndeVomAnfangCutszeneOutpost"},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},		
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "npc_sP201StartUmspawnOrdensritter"},
	}
} 

Umspawn
{
	UnitId = 2058,
	X = 82,
	Y = 62, 
	NoSpawnEffect = TRUE ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201EndeCutszeneOutpost"},
		IsNpcFlagTrue {Name = "npc_sP201StartUmspawnOrdensritter"},
			ODER (IsGlobalCounter { Name = "g_cnP201Mitstreiter", Operator = IsEqual, Value = 3, UpdateInterval = 10}, IsGlobalCounter { Name = "g_cnP201Mitstreiter", Operator = IsEqual, Value = 2, UpdateInterval = 10}),
			 
	},
	Actions =
	{
		
		ChangeFigureOwner {NpcId = self},
		IncreaseNpcCounter {Name = "npc_cnP201ZustandOrdensritter"},
		DecreaseGlobalCounter {Name = "g_cnP201AnzahlUnterstützenderOrdensritter"},
		ChangeRace {Race = 1, NpcId = self},
		Follow {Target = 0, NpcId = self},	
	}
}
dofile("script/P201/n8410_Gestaltenwandler.lua")
EndDefinition()

end



