function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Ist die fleischliche Form tot spawnt der Geist
SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions =
	{
		FigureDead {NpcId = 9924},
	},
	Actions =
	{
		--Goto {X = 441, Y = 230, GotoMode = GotoNormal, WalkMode = Run}
		Follow {Target = 11190},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		FigureAlive {NpcId = _NpcId},
		IsGlobalFlagTrue {Name = "UmspawnExtroBone"},
	},
	Actions =
	{
		Kill {},
	}
}

EndDefinition()

end
