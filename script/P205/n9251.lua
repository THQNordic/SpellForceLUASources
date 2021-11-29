function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Spinnenkönig wird neutral
OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = 9251},
		SetNoFightFlagTrue{NpcId = 9251},
	}
}

-- Spinnenkönig despawnt nach seine ersten Cutscene
Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		FigureInRange {X = 150, Y = 327, Range = 3, FigureType = All , UpdateInterval = 10},
		IsGlobalFlagTrue{Name = "g_P205_SpinnenAttacke", UpdateInterval = 10},
	}
}


EndDefinition()

end
