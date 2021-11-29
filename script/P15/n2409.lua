function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 4}
--!EDS ONIDLEGOHOME END

Respawn
{
	X = 230, Y = 208, 
	WaitTime = 20,
	Chief = 0, 	
	Conditions = 
	{
		BuildingInRange {X = 223, Y = 242, Range = 0, Owner = OwnerNpc},
	},
}

EndDefinition()

end
