function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--Cutscene begins here
if PLAYCUTSCENE then
OnOneTimeEvent
{
Conditions =	{
				},
Actions =		{
				CutSceneBegin(),
				SetGlobalTimeStamp{Name = "Q242PortalFlightTimer"},
				}
}
OnOneTimeEvent
{
Conditions =	{
				IsGlobalTimeElapsed{Name = "Q242PortalFlightTimer" , Seconds = 4, UpdateInterval = 10},
				},
Actions =		{
				CutSceneSay{NpcId = 1363 , String = "That's a test."},
				}
}

OnOneTimeEvent
{
Conditions =	{
				IsGlobalTimeElapsed{Name = "Q242PortalFlightTimer" , Seconds = 8 , UpdateInterval = 10},
				},
Actions =		{
				CutSceneEnd() ,
				}
}
end -- if PLAYCUTSCENE
----Cutscene ends here
EndDefinition()
end
