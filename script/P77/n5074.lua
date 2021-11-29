function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions = {
		IsGlobalFlagTrue{Name = "SpawnSkelettSteffen", UpdateInterval = 5},
	},
	Actions = {
		SetNpcFlagTrue{Name = "Init"},
		-- clear despawn flag
	},
}

Respawn
{
	WaitTime = 0.1,
	Conditions = {
		IsGlobalFlagTrue{Name = "SpawnSkelettSteffen", UpdateInterval = 5},
	},
	Actions = {
		SetNpcFlagTrue{Name = "Init"},
		-- clear despawn flag
	},
}


OnEvent
{
	Conditions = {
		IsNpcFlagTrue{Name = "Init", UpdateInterval = 10},
		FigureAlive{NpcId = Avatar},
	},
	Actions = {
		ChangeRace{Race = 152},
		Stop{},
		Follow{Target = Avatar},
		SetNpcTimeStamp{Name = "kill"},
		CGdsFigureSetHealth:new(_NpcId, 1),
		SetEffect{Effect = "Poison", Length = 0},
		SetNpcFlagFalse{Name = "Init"},
	},
}

OnEvent
{
	Conditions = {
		IsNpcTimeElapsed{Name = "kill", Seconds = 1},
		IsNpcFlagFalse{Name = "Init"},
		-- if not despawn flag
	},
	Actions = {
		SetNpcTimeStamp{Name = "kill"},
		CGdsFigureSetHealth:new(_NpcId, 1),
	},
}

OnEvent
{
	Conditions = {
		-- wenn 4 uhr oder später
	},
	Actions = {
		-- despawn skelett & fx
		-- set despawn flag & timer
		SetGlobalFlagFalse{Name = "SpawnSkelettSteffen"},
	},
}

-- despawn when timer elapsed...


EndDefinition()

end
