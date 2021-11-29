--Aedale, Statthalterin der Eiselfen


function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--spawnt, wenn Hauptquartier zertsört ist
SpawnOnlyWhen
{
	X = 223 , Y = 292 , Clan = 0 , UnitId = 0 , NoSpawnEffect = TRUE , 
	Conditions = 
	{ 
		--Negated(BuildingInRange {X = 226, Y = 290, Range = 0 , Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 60},),
		IsGlobalFlagTrue {Name = "HQistZerstört", UpdateInterval = 60},
	} , 
	Actions = 
	{ 
		--Outcry {NpcId = self, String = "Haltet ein! Schluß mit dem Gemetzel!" , Tag = "OutElfStattSwmpCity001" , Color = ColorWhite},
	}, 
}

EndDefinition()

end
