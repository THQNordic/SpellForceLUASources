function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Walk, X = 377, Y = 361, Direction = 4, Conditions =
	{
		IsGlobalFlagTrue {Name = "SoulfRaithIdleOn"},
	},
}
--!EDS ONIDLEGOHOME END

REM = [[
OnDeath
{
	Actions = {
		SetEffect{Effect = "DeMaterialize", NpcId = _NpcId, Length = 1000},
	},
}
]]

OnOneTimeEvent
{
	Conditions = {
		FigureHasHealth{Percent = 25, UpdateInterval = 2},
	},
	Actions = {
		SetNpcTimeStamp{Name = "DespawnMe"},
		SetEffect{Effect = "DeMaterialize", NpcId = _NpcId, Length = 2000},
	},
}

Despawn
{
	Conditions = {
		IsNpcTimeElapsed{Name = "DespawnMe", Seconds = 2, UpdateInterval = 5},
	},
}

OnOneTimeEvent
{
	Conditions = {
		FigureInRange{X = 182, Y = 274, NpcId = Avatar, Range = 12, UpdateInterval = 20},
	},
	Actions = {
		Outcry{ Tag = "outcrySoulforgerSwd001"   , NpcId = 4202, String = "Wir haben Euch schon einmal besiegt! Du kannst nicht gewinnen!"                              , Color = ColorWhite },	
	},
}

EndDefinition()
end
