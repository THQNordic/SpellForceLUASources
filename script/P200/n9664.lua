function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OneTimeInitAction (ChangeRace {Race = 152, NpcId = self})

--Monster schaut nach Westen.
OnOneTimeEvent
{
	Conditions =
	{
			
    },
	Actions =
	{
	   LookAtDirection {Direction = West, NpcId = self},
	}
}
Umspawn
{
	UnitId = self,
	Clan = 0,
	X = 139,
	Y = 128,
	NoSpawnEffect = TRUE,
	OnlyOnce = TRUE,
	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200ZwergGekauft"},
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "npc_sP200ZwergChangeFigure"},
		ChangeRace {Race = 152, NpcId = self},
		
	}
}

OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsNpcFlagTrue {Name = "npc_sP200ZwergChangeFigure"},
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
	},
	Actions = 
	{
		ChangeFigureOwner {NpcId = self},
		ChangeRace {Race = 0, NpcId = self},	
	}
}

EndDefinition()

end
