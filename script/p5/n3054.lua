function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = 6,
	Conditions =
	{
		Negated(QuestState{QuestId = 467 , State = StateSolved , UpdateInterval = 50}),
	}
}
--!EDS ONIDLEGOHOME END

--!EDS RESPAWN BEGIN
Respawn
{
	WaitTime = 120,
	X = 144, Y = 291,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "ShielFakeSpawn"},
	},
}
--!EDS RESPAWN END


EndDefinition()

end
