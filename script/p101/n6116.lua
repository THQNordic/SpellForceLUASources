--Fial Darg

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)




--SpawnOlyWhen
--{
--	X = 0 , Y = 0 , Clan = 0 , UnitId = 0 , NoSpawnEffect = FALSE , 
--	Conditions = 
--	{
--	IsGlobalFlagTrue{Name = "FialDargBefreit", UpdateInterval = 60},
--	} , 
--	Actions = 
--	{ 
--	} 
--},


-- Eingefroren fuer Gefaengnis - Cutscene
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 20 ,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "FialDargGefangen"},
	},
	Actions = 
	{ 
		SetEffect {Effect = "IcePackForever", Length = 0, TargetType = Figure, NpcId = self}, --Eisblock Effekt
		SetFreezeFlagTrue {}, --Fial Darg Anim freezed
	},
}

--Fial umspawnen, für Cutscene Gefängnis Teil II
Umspawn
{
	UnitId = self, X = 341, Y = 247, NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "FialZumTor", UpdateInterval = 10},
	}, 
	Actions = 
	{
		--SetGlobalFlagFalse{Name "FialZumTor"},
	},
}

--Despawn, wenn durch Portal nach Fire City
Despawn
{
	PlayDeathAnim = FALSE,
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "NachFireCity", UpdateInterval = 40},
		--FigureInRange {X = 403, Y = 248, NpcId = self , Range = 0},
	} , 
	Actions = 
	{ },
}

WatchStateMachine()

EndDefinition()

end

