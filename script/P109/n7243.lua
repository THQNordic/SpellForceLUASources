--INFO GARGOYLE 2

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



OnOneTimeEvent
{
	Conditions =
	{	
    },
	Actions =
	{
		LookAtDirection { Direction = South , NpcId = self},
		SetFreezeFlagTrue { NpcId = self },
		ChangeRace { Race = 152, NpcId = self},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange { X = 441 , Y = 433, Range = 10 , FigureType = FigureAll , UpdateInterval = 10},
		QuestState{ QuestId = 648, State = StateActive, UpdateInterval = 60}, 

	},
	Actions =
	{
		ChangeUnit { Unit = 1817, NpcId = self}, --Gargoyle kann nun Fliegen
		SetFreezeFlagFalse { NpcId = self },
		ChangeRace { Race = 179, NpcId = self},
	}
}


EndDefinition()

end
