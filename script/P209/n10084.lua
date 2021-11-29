function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
Respawn
{
	WaitTime = 1,
	UnitId = self,
	X = 285,
	Y = 179,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "g_sP209SpawnstopSkeleton9", UpdateInterval = 60},
	},
	Actions = 
	{
		Goto {X = NpcX, Y = NpcY, NpcId = self, Range = 3, WalkMode = Run, GotoMode = GotoForced},
	},
	DeathActions = 
	{
	
	}
} 

--Sicherheitsabfrage, wenn sich die Skelette zurück ziehen und Idle werden, sollen sie sich wieder zum Kampfplatz begeben.
OnToggleEvent
{
	OnConditions = 
	{ 
		
		FigureJob {Job = JobIdle , NpcId = self},
	},
	OnActions = 
	{ 
		Goto {X = NpcX, Y = NpcY, NpcId = self, Range = 5, WalkMode = Run, GotoMode = GotoForced},
		
	},
	OffConditions = 
	{
	
	},
	OffActions =
	{
		
	},
}

EndDefinition()

end

