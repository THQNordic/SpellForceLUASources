function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- portal events zum öffnen/schliessen von portalen und toren
OnPortalEvent
{
	X = 250, Y = 180,
	Type = SteinTorGross,
	OpenConditions = {
		IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 5},
		--PlayerUnitInRange{X = 250, Y = 180, Range = 5, UpdateInterval = 5}
	},
	OpenActions = {
		SetGlobalFlagTrue{Name = "Door3331NowOpen"},
	},
	StayOpen = TRUE,
}

EndDefinition()

end
