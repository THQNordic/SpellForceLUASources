function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS RESPAWN BEGIN
Respawn{WaitTime=20}
--!EDS RESPAWN END


-- mach ihn neutral, sonst k�nnte er vor oder w�hrend der cutscene sterben !!!
OneTimeInitAction( ChangeRace{Race = 152} )

OnOneTimeEvent
{
	Conditions =	
	{
		IsGlobalFlagTrue {Name = "WulfgarGuardNowAggressive"},
	},
	Actions =	
	{
		ChangeRace{Race = 139},
	}
}



EndDefinition()
end
