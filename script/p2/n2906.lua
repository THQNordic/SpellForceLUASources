function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 0}
--!EDS ONIDLEGOHOME END

OnOneTimeEvent
{
	Conditions = {
		FigureHasAggro{UpdateInterval = 10},
	},
	Actions = {
		SetEffect{Effect = "GroundWave", X = 67, Y = 194},
		SetEffect{Effect = "Spawnboss"},
		SetGlobalTimeStamp{Name = "SharknarSpawningActive"},
	},
}

OnDeath
{
	Actions = {
		StopEffect{X = 67, Y = 194},
		SetEffect{Effect = "Lightning", X = 67, Y = 194, Length = 2300},
		SetEffect{Effect = "AreaHit", X = 67, Y = 194, Length = 2000},
		-- spawn traumdieb
		Spawn{X = 67, Y = 194, UnitId = 720, NpcId = 1936},
	},
}

EndDefinition()

end
