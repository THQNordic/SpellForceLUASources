function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
 	X = _X , Y = _Y ,
	Conditions = {
			IsGlobalFlagTrue{Name = "EloniSupportRangersSpawning", UpdateInterval = 20},
		},
Actions =	{},
	
}


OnIdleGoHome
{
	Conditions = {
		IsGlobalFlagTrue{Name = "EloniSupportRangersSpawning", UpdateInterval = 20},
	},
	X = 186, Y = 238, WalkMode = Run, Direction = South
}

EndDefinition()

end
