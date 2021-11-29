function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		   	IsGlobalTimeElapsed{Name = "c_P204_YrmirOutcry", Seconds = 2, UpdateInterval = 10}, 
	},
	
	Actions = 
	{

	},
}


OnOneTimeEvent
{
	Conditions = 
	{
		   	IsGlobalTimeElapsed{Name = "c_P204_YrmirOutcry", Seconds = 4, UpdateInterval = 10}, 
	},

	Actions =
	{
	   		Outcry { NpcId = 11901, Tag = "oca2yrmirP204_001", String = "Der Dryadenhain wurde geschändet! Alarm!" },
	   		Outcry { NpcId = 11901, Tag = "oca2yrmirP204_002", String = "Palastwachen! Findet und tötet diesen Runenkrieger!!" },			
	}
}


Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		   	IsGlobalTimeElapsed{Name = "c_P204_YrmirOutcry", Seconds = 30, UpdateInterval = 10}, 
	}
}

EndDefinition()

end
