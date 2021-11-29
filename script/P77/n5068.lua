function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	Conditions = {
		-- wenn zwischen 0 und 4 uhr ...
		-- wenn Plot == JourneyFour oder höher
		FigureInRange{X = _X, Y = _Y, NpcId = Avatar, Range = 2},
	},
	Actions = {
		--Outcry{String = "R.I.P. Steffen"},
		SetGlobalFlagTrue{Name = "SpawnSkelettSteffen"},
	},
}

EndDefinition()

end
