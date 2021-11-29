function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X,
	Y = _Y,
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP209Stadttor", Value = 1, Operator = IsGreaterOrEqual}, 
	},
	Actions =
	{
		Goto {X = 267, Y = 88, NpcId = self, Range = 0, WalkMode = Run, GotoMode = GotoContinuous},
	}
} 


EndDefinition()

end
