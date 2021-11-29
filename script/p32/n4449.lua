function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	Conditions = {
		FigureDead{NpcId = 4202},
	},
	Actions = {
		SetGlobalFlagTrue{Name = "SoulForgerStageTwo"},
		SetGlobalTimeStamp{Name = "StageTwoFreezeTimer"},
	},
}
OnOneTimeEvent
{
	Conditions = {
	},
	Actions = {
		ChangeRace{Race = 152},
		SetEffect{Effect = "MaterializeInMonument", NpcId = _NpcId, Length = 2000},
		ChangeEquipment{Slot = SlotChest, Item = 2717},
		CGdsFigureSetHealth:new(_NpcId, 600),
	},
}
OnOneTimeEvent
{
	Conditions = {
		IsGlobalTimeElapsed{Name = "StageTwoFreezeTimer", Seconds = 2.5, UpdateInterval = 2},
	},
	Actions = {
		ChangeRace{Race = 183},
	},
}

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


EndDefinition()
end
