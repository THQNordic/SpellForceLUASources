--Soulforger mini

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}


SpawnOnlyWhen
{
	X = 85, Y = 100, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
		{
			IsGlobalTimeElapsed {Name = "gt_P211_MiniforgerAufAuf", Seconds = 8}
		}, 
	Actions = 
		{
			Goto {X = _X, Y = _Y, NpcId = self, Range = 1, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0},
			SetGlobalFlagTrue {Name = "g_P211Soulforgerlebt"},
			Outcry {NpcId = 9719, String = "Dieser Dschungel wird Euer Grab, Runenknechte!" , Tag = "oca2soulforgerP211_002" , Delay = TRUE , Color = ColorWhite}
		} 
}


OnIdleGoHome
{
	X = _X, Y = _Y, Direction = 0, Range = 0, WalkRange = 4, WaitTime = 0, WalkMode = Walk, GotoMode = GotoNormal,
	Conditions = {},
	Actions = {},
	HomeActions = {},
	AbortConditions = {},
	AbortActions = {},
}


OnDeath
{
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_P211EndgegnerEnde"}
	}
}

EndDefinition()

end
