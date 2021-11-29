function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

--SpawnOnlyWhen
--{
--	Conditions = 
--	{
--		IsGlobalFlagTrue{Name = "Q484SpawnDryads"},
--	},
--	Actions =
--	{
--		SetNpcFlagTrue {Name = "Aufi"},
--	}
--}
--OnOneTimeEvent
--{
--	Conditions = 
--	{
--		IsNpcFlagTrue {Name = "Aufi"},
--	},
--	Actions =
--	{
--		Goto{X = 453, Y = 280, NpcId = _NpcId, WalkMode = Run, GotoMode = GotoForced},
--	}
--}


SpawnOnlyWhen
{
	Conditions = {IsGlobalFlagTrue {Name = "OtherDryadsMaySpawn", UpdateInterval = 10}},
	Actions = { SetNpcFlagTrue{Name = "DryadsCanNowFollow"} },
}
OnToggleEvent
{
	OnConditions = 
	{
		FigureJob{Job = JobIdle , NpcId = self},
		IsNpcFlagTrue{Name = "DryadsCanNowFollow"},
	},
	OnActions = 	
	{
		-- safe, da reiner aggro-toggle
		Follow{Target = 3433 , NpcId = self},
	},

	OffConditions = 
	{
		FigureHasAggro{NpcId = self , UpdateInterval = 10},
	},		
	OffActions = 	
	{
		StopFollow{Target = 3433 , NpcId = self},
	}
}
EndDefinition()

end
