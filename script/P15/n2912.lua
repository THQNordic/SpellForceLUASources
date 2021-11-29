function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	Conditions =
	{
		QuestState {QuestId = 391, State = StateActive},
		FigureDead {NpcId = 5100},
		IsGlobalFlagTrue {Name = "EndHopeSpawn"}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "AmraSpawn"},
	}
}

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 5}
--!EDS ONIDLEGOHOME END

EndDefinition()

end
