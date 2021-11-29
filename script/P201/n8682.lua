function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		Negated(AvatarLevel {Level = 28, Player = self , UpdateInterval = 60}),
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
	},
	Actions = 
	{
		SetEffect{Effect = "GroundWave", X = GolemSpawnPosX, Y = GolemSpawnPosY, Length = 0},
	}
} 

Respawn
{
	WaitTime = 20,
	UnitId = self,
	Conditions = 
	{
		Negated(AvatarLevel {Level = 28, Player = self , UpdateInterval = 60}),
		IsGlobalCounter {Name = "npc_cnP201ExpCounter", Value = 6, Operator = IsLessOrEqual, UpdateInterval = 60},
	},
	Actions = 
	{
		IncreaseGlobalCounter { Name = "npc_cnP201ExpCounter"},
	},
} 

OnOneTimeEvent
{
	Conditions = 
	{
		AvatarLevel {Level = 28, Player = self , UpdateInterval = 60},
	},
	Actions = 
	{
		StopEffect{X = GolemSpawnPosX, Y = GolemSpawnPosY},
	},
}

Despawn
{
	
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "GDS_PlayerWasOnPlatform_P203"},
	},
	Actions = 
	{
		StopEffect{X = GolemSpawnPosX, Y = GolemSpawnPosY},
	}
}



EndDefinition()

end
