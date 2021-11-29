function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{ 
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
	   		IsGlobalTimeElapsed{Name = "c_P204_YrmirDespawnNachOutcry", Seconds = 3, UpdateInterval = 10}, 
	},
	Actions = 
	{
	   		Outcry { NpcId = 11899, Tag = "oca2yrmirP204_001", String = "Der Dryadenhain wurde geschändet! Alarm!" },
	   		Outcry { NpcId = 11899, Tag = "oca2yrmirP204_002", String = "Palastwachen! Findet und tötet diesen Runenkrieger!!" },
			SetGlobalTimeStamp{Name = "c_P204_YrmirDespawnNachOutcry"},	   		
	},
}

Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
	   		IsGlobalTimeElapsed{Name = "c_P204_YrmirDespawnNachOutcry", Seconds = 20, UpdateInterval = 10}, 
	}
}

EndDefinition()

end