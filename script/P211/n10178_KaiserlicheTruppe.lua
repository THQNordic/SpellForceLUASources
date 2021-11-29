-- KAiserliche Truppe

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	--X = 269, Y = 455, Clan = 0, UnitId = 0, NoSpawnEffect = TRUE,
	X = 285, Y = 200, Clan = 0, UnitId = 0, NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211_IshtarFaelltEin", UpdateInterval = 20},
		
	}, 
	Actions = 
	{
		Goto {X = _X, Y = _Y, NpcId = self, Range = 2, WalkMode = Run, GotoMode = GotoContinuous},
		ChangeRace {Race = 185, NpcId = self},
		SetNoFightFlagTrue {NpcId = self}
	} 
}

OnIdleGoHome
{
	X = _X, Y = _Y, Direction = 4, Range = 0, WalkRange = 10, WaitTime = 0, WalkMode = Walk, GotoMode = GotoNormal,
	Conditions = {},
	Actions = { },
	HomeActions = { },
	AbortConditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_P211TruppeRuecktAb", UpdateInterval = 20}
	},
	AbortActions = { },
}


--Abrücken während CS Ishtar
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211TruppeRuecktAb", UpdateInterval = 20}
	},
	Actions = 
	{
		Goto {X = 269, Y = 455, NpcId = self, Range = 1, WalkMode = Run, GotoMode = GotoContinuous},
	}
}


Despawn
{
 	PlayDeathAnim = FALSE,
	Conditions = 
	{
		FigureInRange {X = 269, Y = 455, NpcId = self, Range = 1},
		IsGlobalFlagTrue {Name = "g_P211TruppeRuecktAb", UpdateInterval = 20},
	}, 
	Actions =
	{
		SetEffect {Effect = "DeMaterialize", Length = 2000, TargetType = Figure, NpcId = self},
		SetGlobalFlagTrue {Name = "P211_KaiserTruppeDespawned"},
		
	}
}

Despawn
{
 	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "GDS_PlayerWasOnPlatform_P212"},
		IsGlobalFlagFalse {Name = "P211_KaiserTruppeDespawned", UpdateInterval = 20},
		IsGlobalFlagTrue {Name = "g_P211TruppeRuecktAb", UpdateInterval = 20}
	}, 
	Actions = {}
}

EndDefinition()

end










