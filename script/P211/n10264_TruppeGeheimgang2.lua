-- Truppe Geheimgang2 (nördlich)

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Spawnen und erstes Stück
SpawnOnlyWhen
{
	X = 362, Y = 127, Clan = 0, UnitId = 0, NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211AngriffGeheimgangLos", UpdateInterval = 20},
		IsGlobalTimeElapsed {Name = "gt_P211GeheimgangTrupp2", Seconds = 15}
	}, 
	Actions = 
	{
		Goto {X = _X, Y = _Y, NpcId = self, Range = 2, WalkMode = Run, GotoMode = GotoContinuous},
	} 
}


--Angriff Aufbauplatz Zwerge1
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		FigureInRange {X = _X, Y = _Y, NpcId = self, Range = 2}
	},
	Actions = 
	{
		Goto {X = 236, Y = 420, NpcId = self, Range = 8, WalkMode = Run, GotoMode = GotoContinuous}
	}
}

EndDefinition()

end










