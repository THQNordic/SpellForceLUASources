-- Truppe geheimgang1
--(südlich)

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Spawnen und erstes Stück
SpawnOnlyWhen
{
	X = 362, Y = 127, Clan = 0, UnitId = 0, NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211AngriffGeheimgangLos", UpdateInterval = 20},
		
	}, 
	Actions = 
	{
		Goto {X = _X, Y = _Y, NpcId = self, Range = 2, WalkMode = Run, GotoMode = GotoContinuous},
	} 
}




--
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		FigureInRange {X = _X, Y = _Y, NpcId = self, Range = 2}
	},
	Actions = 
	{
		--SetEffect {Effect = "OccludeBlack", Length = 2000, TargetType = World, X = 398, Y = 252},
		RemoveObject{X = 395, Y = 250, Object = 844},
		RemoveObject{X = 395, Y = 251, Object = 843},
		RemoveObject{X = 396, Y = 252, Object = 845},
		RemoveObject{X = 397, Y = 252, Object = 843},
		RemoveObject{X = 397, Y = 253, Object = 844},
		RemoveObject{X = 398, Y = 252, Object = 845},
		RemoveObject{X = 399, Y = 251, Object = 842},
		RemoveObject{X = 397, Y = 250, Object = 841},
		RemoveObject{X = 396, Y = 255, Object = 840},
	
		SetGlobalFlagTrue {Name = "g_P211GeheimgangGesprengt"}
	}
}

--Angriff Aufbauplatz elfen
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211GeheimgangGesprengt", UpdateInterval = 20}
	},
	Actions = 
	{
		
		Goto {X = 199, Y = 338, NpcId = self, Range = 8, WalkMode = Run, GotoMode = GotoContinuous}
	}
}

EndDefinition()

end










