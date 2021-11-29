-- Gargoyle resistent

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



--Explosion, wenn Tor aufgeht
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "P202GargoyleGetReadyToExplode", UpdateInterval = 10},
		FigureAlive {NpcId = 8808}
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "P202GargoyleExplodeNow"},
		SetEffect {Effect = "Explo", TargetType = Figure, NpcId = self, Length = 2500},
		SetEffect {Effect = "DarkMight", TargetType = Figure, NpcId = self, Length = 1500},
		SetEffect {Effect = "BuildingFire", TargetType = Figure, NpcId = self, Length = 2000},
	
	}
}


Despawn
{
 	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "P202GargoyleExplodeNow", UpdateInterval = 5},
		FigureAlive {NpcId = 8808}
	}, 
	Actions = {}
}
EndDefinition()

end
