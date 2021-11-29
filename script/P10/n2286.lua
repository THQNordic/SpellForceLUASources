function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 6}
--!EDS ONIDLEGOHOME END

Respawn
{
	X = 591, Y = 427 , 
	WaitTime = 90,
	Conditions = 
				{
					BuildingInRange {X = 591, Y = 427, Range = 2, Owner = OwnerNpc},
				}
}


EndDefinition()

end
