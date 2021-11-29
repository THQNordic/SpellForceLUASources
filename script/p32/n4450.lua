function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	Conditions = {
		FigureDead{NpcId = 4449},
		IsGlobalFlagTrue{Name = "SoulForgerStageTwo", UpdateInterval = 5},
	},
	Actions = {
		SetGlobalFlagTrue{Name = "SoulForgerStageThree"},
		SetGlobalTimeStamp{Name = "StageThreeFreezeTimer"},
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
		CGdsFigureSetHealth:new(_NpcId, 400),
	},
}
OnOneTimeEvent
{
	Conditions = {
		IsGlobalTimeElapsed{Name = "StageThreeFreezeTimer", Seconds = 2.5, UpdateInterval = 2},
	},
	Actions = {
		ChangeRace{Race = 183},
	},
}

--OnOneTimeEvent
--{
--	Conditions = {
--		FigureHasHealth{Percent = 20, UpdateInterval = 10},
--	},
--	Actions = {
--		Outcry{ Tag = "outcryMaincharSwd001"     , NpcId =    0, String = "Wir sehen uns im nächsten Leben, Seelenschmied!"                                             , Color = ColorWhite },
--	},
--}

OnOneTimeEvent
{
	Conditions = {
		FigureHasHealth{Percent = 5, UpdateInterval = 2},
	},
	Actions = {
		Outcry{ Tag = "outcrySoulforgerSwd003"   , NpcId = 4450, String = "Aargh!"                                                                                      , Color = ColorWhite },
	},
}

OnDeath
{
	Actions = {
		SetGlobalFlagTrue{Name = "GameOver"},
	},
}

EndDefinition()
end
