--Onyxgolem


function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--erst spawnen, wenn neutraler Golem weg
SpawnOnlyWhen
{
	X = 198, Y = 108, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P202OnyxGolemGewaehlt", UpdateInterval = 2},
		IsGlobalFlagTrue {Name = "g_P202NeutralerGolemIstWeg", UpdateInterval = 2}
	}, 
	Actions = 
	{
		ChangeRace {NpcId = self, Race = 185},
		ChangeFigureOwner {NpcId = self},
		TransferItem {TakeItem = 7073, GiveItem = 0, Amount = 1, Flag = Take}
	}
}

--Respawn, bis Türme weg oder tor Gargoyle auf
Respawn
{
	WaitTime = 15, UnitId = self, Clan = 0, Target = none, X = 198, Y = 108, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsRewardFlagFalse{Name = "ExtinctTuermeWeg", UpdateInterval = 20},
		IsGlobalFlagFalse{Name = "P202GargoyleGetReadyToExplode", UpdateInterval = 20},
	}, 
	Actions = 
	{
		ChangeRace{Race = 185},	
		ChangeFigureOwner {NpcId = self}
	}, 
	DeathActions = {} 
}


--wenn zu wenig mana, neu
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
		FigureHasMana {Percent = 50, NpcId = self, UpdateInterval = 30}
	},
	Actions = 
	{
		SetMana {Mana = 35, NpcId = self, Decrease = FALSE}
	}
}

--nach Platformwechsel immer noch Change Owner
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions =
	{
		ODER9
		{
			IsGlobalFlagTrue {Name = "g_P202BergkristallGolemGewaehlt", UpdateInterval = 10},
			IsGlobalFlagTrue{Name = "g_P202OnyxGolemGewaehlt", UpdateInterval = 10}
		}
	},
	Actions = 
	{ 
	 	ChangeRace {NpcId = self, Race = 185},
	 	ChangeFigureOwner {NpcId = self}
	}
}

EndDefinition()

end
