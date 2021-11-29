function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen 
{
	X =_X, Y = _Y,
	Conditions =
	{
		PlayerUnitInRange {X = 268, Y = 253, Radius = 8},
		IsNpcFlagFalse {Name = "GroupTwoBlocker"},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "GroupTwoBlocker"},
	}
}


EndDefinition()

end
