function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagFalse{Name = "g_P204_Hinterhalt2b", UpdateInterval = 60},
	}
}

Respawn
{
	WaitTime = 1, UnitId = self , NoSpawnEffect = TRUE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_Hinterhalt2b", UpdateInterval = 10},
	},
	
		DeathActions =
	{
		SetGlobalFlagFalse{Name = "g_P204_Hinterhalt2b"},
	}

}
EndDefinition()

end
