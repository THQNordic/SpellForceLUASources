function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	X = 203, Y = 463, Direction = random (0,7),
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "SouthernGodmarkMonumentClaimedTimer", Seconds = zweiterTrupp},
	}
}
--!EDS ONIDLEGOHOME END

EndDefinition()

end
