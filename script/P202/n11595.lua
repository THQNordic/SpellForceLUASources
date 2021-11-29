--neutraler Golem

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = _X, Y = _Y, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P202GolemNeutralSpawnt", UpdateInterval = 20},
	}, 
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_P202GolemNeutralLebt"},
		SetFreezeFlagTrue {},
		TransferItem {TakeItem = 7072, GiveItem = 0, Amount = 1, Flag = Take},
		TransferItem {TakeItem = 7070, GiveItem = 0, Amount = 1, Flag = Take},
		TransferItem {TakeItem = 7071, GiveItem = 0, Amount = 1, Flag = Take}
	}
}


-----------------------------------------------
--Bergkristallgolem gewählt

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_P202BergkristallGolemGewaehlt", UpdateInterval = 10},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_11060"},
		SetGlobalFlagTrue {Name = "g_P202NeutralerGolemDespawn"}
	}
}


------------------------------------------------
--Onxgolem gewählt

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P202OnyxGolemGewaehlt", UpdateInterval = 10}
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_11060"},
		SetGlobalFlagTrue {Name = "g_P202NeutralerGolemDespawn"}
	}
}

----------------------------
----------------------------

Despawn
{
	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P202NeutralerGolemDespawn", UpdateInterval = 5}
	}, 
	Actions = 
	{
		SetEffect {Effect = "OccludeWhite", X = 198, Y = 108, Length = 2500, TargetType = World},
		SetGlobalFlagTrue {Name = "g_P202NeutralerGolemIstWeg"}
	}
}








EndDefinition()

end
