function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- erzeuge variablen states für die plattform
OnOneTimeEvent
{
Conditions = 	{
				FigureInRange{X = 306, Y = 254, NpcId = Avatar , Range = 5}
				},
Actions =		{
				SetEffect{Effect = "Campfire", X = 306, Y = 254}
				}
}

OnOneTimeEvent
{
Conditions = 	{
				FigureInRange{X = 306, Y = 254, NpcId = Avatar , Range = 5}
				},
Actions =		{
				--ClanAttack{Number = 2, SourceClan = 1, TargetX = 270, TargetY = 210}
				SetNpcVIP{NpcId = 345, Set = 1},
				}
}

EndDefinition()
end
