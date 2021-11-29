function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209ClockworkTold", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler", UpdateInterval = 10},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "npc_sP201PhoenixAvatarGespawned"},
	}
}


OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_sP209PhoenixLaufLos", UpdateInterval = 10},
		IsNpcFlagTrue {Name = "npc_sP201PhoenixAvatarGespawned", UpdateInterval = 10},
	},
	Actions = 
	{ 
		Goto {X = 477, Y = 301, NpcId = self, Range = 3, WalkMode = Walk, GotoMode = GotoForced},
	}
}
EndDefinition()

end
