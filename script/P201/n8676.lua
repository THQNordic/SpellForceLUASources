-->INFO Lichtkönig

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201CutszeneGrabStart", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 10},		
	},
	Actions =
	{
		
	}
} 



--Lichtkönig verschwindet am Portal
OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 188, Y = 34, NpcId = self , Range = 3},
	},
	Actions = 
	{ 
		SetEffect {Effect = "DeMaterialize", Length = 2250},
		SetNpcTimeStamp {Name = "g_tnP201DespawnLichtkoenigTimer"},
	}
}

Despawn
{
	
	Conditions = 
	{
		ODER(IsNpcTimeElapsed{Name = "g_tnP201DespawnLichtkoenigTimer", Seconds = 2, UpdateInterval = 10}, IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"}),
	},
	Actions = 
	{
		
	}
}

Umspawn
{
	X = 191,
	Y = 42,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201LightKingUmspawnCutszeneOutpost"},
	},
	Actions = 
	{
		
	}
}

Umspawn
{
	X = 207,
	Y = 120,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201LightKingStartPosition"},
	},
	Actions = 
	{
		
	}
}

Umspawn
{
	X = 188,
	Y = 40,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201LightKingUmspawnCutszeneGrab", UpdateInterval = 10},
	},
	Actions = 
	{
		
	}
}
EndDefinition()
end
