function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome{WalkMode = Run, X = 40, Y = 20, Direction = 4}
OnIdleGoHome{
Conditions = { IsNpcFlagTrue{Name = "nevertrue"}},
WalkMode = Run, X = 80, Y = 30, Direction = 4
}

OneTimeInitAction( SetNpcTimeStamp{Name = "test"} )
--OneTimeInitAction( SetEffect{Effect = "Spawnboss", NpcId = 0, Length = 11111} )
Despawn
{
	Conditions = {
		IsNpcTimeElapsed{Name = "test", Seconds = 6, UpdateInterval = 1},
	},
	Actions = {
		--SetEffect{Effect = "Fog", X = 25, Y = 15, Length = 3000},
	},
}
Despawn
{
	Conditions = {
		IsNpcFlagTrue{Name = "neverevertrue"},
	},
}
--Respawn{X = _X, Y = _Y, WaitTime = 3, Actions = {SetNpcTimeStamp{Name = "test"}} }


REM = [[
OnOneTimeEvent
{
	Conditions = {
		IsNpcTimeElapsed{Name = "test", Seconds = 8, UpdateInterval = 10},
	},
	Actions = {
		SetEffect{Effect = "Spawnboss", Length = 33333},
		SetEffect{Effect = "IcePackForever"},
		SetEffect{Effect = "Fog", X = 25, Y = 15, Length = 30000},
	},
}


OnOneTimeEvent
{
	Conditions = {
	},
	Actions = {
		Goto{X = 250, Y = 12, GotoMode = GotoContinous, WalkMode = Run},
		SetEffect{Effect = "Spawnboss"},
	},
}
]]

EndDefinition()

end
