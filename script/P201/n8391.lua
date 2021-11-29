function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


Respawn 
{
	WaitTime = 1, 
	X = 127,
	Y = 161,
	NoSpawnEffect = FALSE ,
 	Conditions = 
 	{
 		Negated(FigureInRangeNpc {TargetNpcId = 8397, NpcId = 0, Range = 20, UpdateInterval = 10}),
 		IsGlobalFlagFalse {Name = "g_sP201Ordensritter1Verpflichtung"},	
 		IsGlobalFlagFalse {Name = "GDS_PlayerWasOnPlatform_P203"},
 		IsGlobalFlagFalse {Name = "g_sP201StartCutszeneOutpost"},
 	} ,
 	Actions = 
 	{
 		Goto {X = _X, Y = _Y, NpcId = self, Range = 5, WalkMode = Run, GotoMode = GotoForced},
 	} ,
 	DeathActions = 
 	{
 	
 	} 
}

--Sicherheitsabfrage, wenn sich ein Skelett zurück zieht und Idle wird, soll er sich wieder zum Kampfplatz begeben.
OnIdleEvent
{
	Conditions = 
	{ 
		IsGlobalCounter {Name = "g_cnP201OrdensritterStart1", Value = 0, Operator = IsEqual, UpdateInterval = 60},
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
