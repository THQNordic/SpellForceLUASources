--Ishtar

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--spawnt für die CS Ishtar
SpawnOnlyWhen
{
	X = 285, Y = 200, Clan = 0, UnitId = 0, NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211_IshtarFaelltEin", UpdateInterval = 10},
	
	}, 
	Actions = 
	{
		Goto {X = _X, Y = _Y, NpcId = self, Range = 1, WalkMode = Run, GotoMode = GotoContinuous},
		--ChangeRace {Race = 185, NpcId = self},
		
		
		-- zum testen...
		ChangeRace{Race = 152, NpcId = 10153},
		SetNoFightFlagTrue{NpcId = 10153},
	} 
}

--nach CS Ishtar ist er Alyah zum Portal gefolgt
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		FigureInRange {X = 268, Y = 466, NpcId = self, Range = 8},
	},
	Actions = 
	{
		Goto {X = 269, Y = 455, NpcId = self, Range = 0, WalkMode = Run, GotoMode = GotoContinuous},
	}
}


Despawn
{
 	PlayDeathAnim = FALSE,
	Conditions = 
	{
		FigureInRange {X = 269, Y = 455, NpcId = self, Range = 0},
		IsGlobalFlagTrue {Name = "g_P211TruppeRuecktAb", UpdateInterval = 20},
	}, 
	Actions =
	{
		SetEffect {Effect = "DeMaterialize", Length = 2000, TargetType = Figure, NpcId = self},
		SetGlobalFlagTrue {Name = "P211_IshtarDespawned"}
	}
}

Despawn
{
 	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "P211_IshtarDespawned", UpdateInterval = 20},
		IsGlobalFlagTrue {Name = "g_P211TruppeRuecktAb", UpdateInterval = 20}
	}, 
	Actions =
	{
		SetGlobalFlagTrue {Name = "P211_IshtarDespawned"}
	}
}

EndDefinition()

end
