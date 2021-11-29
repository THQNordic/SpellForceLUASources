function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 7}
--!EDS ONIDLEGOHOME END


Respawn
{
	X = 140, Y = 116, NoSpawnEffect = TRUE, WaitTime = 80,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "P101GoblinFakeSpawn"},
	}
}


--follow auf Avatar, falls einfach weiter
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {X = 136, Y = 155, NpcId = Avatar , Range = 5},
		
	},
	Actions =
	{
		Follow{Target = Avatar, NpcId = self},
	}
}


EndDefinition()

end
