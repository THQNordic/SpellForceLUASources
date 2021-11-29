--FialDarg-Wache 1

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


KillOnDominate{NpcId = self}

--Spieler mit oder ohne Schattenklinge
OnToggleEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	OnConditions = 
	{
		PlayerHasItemEquipped {ItemId = 3764, Amount = 1, UpdateInterval = 10},
	},
	OnActions = 
	{
		ChangeUnit{Unit = 2180, NpcId = 9038, ChangeLevel = FALSE}
	},
	OffConditions = 
	{
		Negated(PlayerHasItemEquipped {ItemId = 3764, Amount = 1 ,UpdateInterval = 10}),
	},
	OffActions = 
	{
		ChangeUnit{Unit = 2528, NpcId = 9038, ChangeLevel = FALSE}
	},
}


--respawn, mit Schattenklinge
Respawn
{
	WaitTime = 10, UnitId = 2180, Clan = 0, Target = none, X = startX , Y = startY, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_P202FialDargSpawn", UpdateInterval = 20},
		PlayerHasItemEquipped {ItemId = 3764, Amount = 1 ,UpdateInterval = 10},
		IsGlobalFlagFalse{Name = "g_P202Spawnpunktebesetzt", UpdateInterval = 20}
		
	} , 
	Actions = 
	{
		SetGlobalFlagFalse {Name = "g_P202FialDargSpawn"},
	
	} , 
	DeathActions = {} 
}


--respawn, ohne Schattenklinge
Respawn
{
	WaitTime = 10, UnitId = 2528, Clan = 0, Target = none, X = startX, Y = startY, Chief = none, NoSpawnEffect = FALSE, 
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_P202FialDargSpawn", UpdateInterval = 20},
		IsGlobalFlagFalse{Name = "g_P202Spawnpunktebesetzt", UpdateInterval = 20},
		Negated(PlayerHasItemEquipped {ItemId = 3764, Amount = 1, UpdateInterval = 10})
	} , 
	Actions = 
	{
		SetGlobalFlagFalse {Name = "g_P202FialDargSpawn"},
	
	} , 
	DeathActions = {} 
}


EndDefinition()

end
