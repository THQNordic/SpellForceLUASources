function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 5}
--!EDS ONIDLEGOHOME END

Respawn
{
	X = 408, Y = 143, 
	WaitTime = 240,
	Conditions =
	{
		BuildingInRange  {X = 407, Y = 140, Range = 0, Owner = OwnerNpc},         
	}
}
EndDefinition()

end
