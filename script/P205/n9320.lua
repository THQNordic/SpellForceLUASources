-- Kaiser für Dryadencutscene

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Kaiser auf neutral setzen
OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 9320},
	}
}

-- Kaiser despan conditions
Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
	   	FigureInRange {X = 230, Y = 255, Range = 0, NpcId = 9320, UpdateInterval = 10},
	}
}


EndDefinition()

end
