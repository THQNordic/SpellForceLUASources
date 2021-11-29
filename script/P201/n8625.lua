function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
		
	},
	Actions = 
	{
		
		
	}
} 

OnEvent
{
	Conditions = 
	{
		FigureInRange {X = 151, Y = 227, NpcId = self, Range = 3},
	},
	Actions = 
	{
		Goto {X = _X, Y = _Y, NpcId = self, Range = 5, WalkMode = Run, GotoMode = GotoForced},
	},
}



EndDefinition()

end
