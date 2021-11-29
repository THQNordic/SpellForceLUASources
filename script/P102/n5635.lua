--> INFO DUNHAN

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



SpawnOnlyWhen
{
	
	 
	NoSpawnEffect = TRUE, 
	
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "StartCutSzene03", UpdateInterval = 10}, --Wenn der Kithar General stirbt
	} ,
	Actions = 
	{
	   LookAtFigure { Target = 5462, NpcId = self},
	   --SetEffect { Effect = "BlackMagic" },
	}
} 


EndDefinition()

end
