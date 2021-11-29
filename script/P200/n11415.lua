function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Goblin Rot schaut nach Osten.
OnOneTimeEvent
{
	Conditions =
	{
			
    },
	Actions =
	{
	   LookAtDirection {Direction = East, NpcId = self},
	}
}

Despawn
{
	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_sP200CutszeneGoblinAufstellung"},	
	},
	Actions = 
	{
	
	}
}

EndDefinition()

end
