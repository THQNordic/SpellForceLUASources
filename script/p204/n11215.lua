function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--OnOneTimeEvent
--{
--	Conditions = 
--	{
--	},
--	Actions = 
--	{
--		TransferItem{GiveItem = 7338, Amount = 12, Flag = Give},
--		TransferItem{GiveItem = 7339, Amount = 1, Flag = Give},
--		TransferItem{GiveItem = 7340, Amount = 12, Flag = Give},
--		TransferItem{GiveItem = 3458, Amount = 12, Flag = Give},
--		SetEffect{Effect = "Spawnboss", NpcId = Avatar, Length = 55555},
--	}
--}

OnIdleGoHome
{
	X = 176, Y = 315, WalkMode = Run, Direction = East,

	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_IrfitPortal"},
	},
	Actions =
	{
		ChangeRace{Race = 152, NpcId = 11215},
	},
	HomeActions =
	{
		SetNpcFlagTrue{Name = "DespawnIrfit"},
	}
}


Despawn
{
Conditions =	{
				ODER(
					IsNpcFlagTrue{Name = "DespawnIrfit"},
					IsGlobalFlagTrue{Name = "g_P204_IrfitAlreadyInCove"}
					)
				}
}


EndDefinition()

end
