function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome{X = 164, Y = 154, Direction = SouthEast, Conditions = {IsNpcFlagFalse{Name = "HomeOff"}}}
OnOneTimeEvent
{
Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarFollow"},
				},
Actions = 	{
			SetNpcFlagTrue{Name = "HomeOff"},
			SetNpcFlagTrue{Name = "FollowPlayer"},
			}
}
OnPlatformOneTimeEvent
{
Conditions = {
				IsNpcFlagTrue{Name = "FollowPlayer"},
				FigureJob{Job = JobIdle , NpcId = self},
				FigureAlive{NpcId = Avatar},
				},
Actions = 	{
				-- safe, da nur über aggro und dem follow flag getoggled wird
				Follow{Target = 1362 , NpcId = self},
				},
}
EndDefinition()

end
