function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- portal events zum �ffnen/schliessen von portalen und toren
OnPortalEvent
{
	X = 232, Y = 299,
	Type = SteinTorGross,
	OpenConditions = {
		IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 5},
		--PlayerUnitInRange{X = 232, Y = 299, Range = 5, UpdateInterval = 5}
	 },
	StayOpen = TRUE,
}

EndDefinition()

end
