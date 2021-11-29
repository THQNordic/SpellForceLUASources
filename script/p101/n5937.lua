--Elune


function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



--spawnt, wenn Gefängnis Cutscene
SpawnOnlyWhen
{
	X = 260 , Y = 133 , Clan = 0 , UnitId = 0 , NoSpawnEffect = TRUE , 
	Conditions = 
	{ 
		-- Negated(BuildingInRange {X = 226, Y = 290, Range = 0 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60},),
		IsGlobalFlagTrue {Name = "EluneSpawns", UpdateInterval = 15},
	} , 
	Actions = 
	{ 
		SetGlobalFlagFalse {Name = "EluneSpawns"},
		ChangeRace{Race = 192, NpcId = self},	--Elune von neutral auf Eiself-Gut
	}, 
}



OnIdleGoHome
{
	WalkMode = Walk, X = 370, Y = 422, Direction = 0,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "P101EluneZuEiselfen", UpdateInterval = 30},
		IsNpcFlagFalse {Name = "P101_EluneStop"},
	},
	Actions =
	{
		
	},
	HomeActions =
	{
		SetNpcFlagTrue {Name = "P101_EluneStop"},
	}
}


--Despawn, wenn Player auf Flee to Ice war
Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "PlayerWarAufFleeToIce", UpdateInterval = 20},
	} , 
	Actions = {}
}


EndDefinition()

end
