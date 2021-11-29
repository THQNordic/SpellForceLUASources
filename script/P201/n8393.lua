function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
		IsGlobalFlagTrue {Name = "g_sP201SpawnStartOrdensritter2"},
	},
	Actions = 
	{
		SetHealth {HitPoints = 120, NpcId = self},
	}
} 


--Sicherheitsabfrage, wenn sich ein Skelett zurück zieht und Idle wird, soll er sich wieder zum Kampfplatz begeben.
OnIdleEvent
{
	Conditions = 
	{ 
		IsGlobalCounter {Name = "g_cnP201OrdensritterStart2", Value = 0, Operator = IsEqual, UpdateInterval = 60},
	},
	Actions = 
	{ 
		Goto {X = _X, Y = _Y, NpcId = self, Range = 5, WalkMode = Run, GotoMode = GotoForced},
	},
}

Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "GDS_PlayerWasOnPlatform_P203"},
	},
	Actions = 
	{
	
	}
}

EndDefinition()

end
