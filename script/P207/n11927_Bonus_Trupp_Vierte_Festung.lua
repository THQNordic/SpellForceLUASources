function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen 
{
	X = _X, 
	Y = _Y, 
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_p207_Bonustruppe_go_for_gold"},
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "n_p207_Bonustruppe_spawned"},
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "n_p207_Bonustruppe_spawned"},
	},
	Actions =
	{
		Goto {X = 338, Y = 96, WalkMode = Run, GotoMode = GotoForced},
	},
}

EndDefinition()

end
