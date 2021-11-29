--> INFO: Janina 's Geist
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = _X, Y = _Y,
	Conditions =
	{
		-- FigureDead {NpcId = 5461}, -- janina muss tot sein - bzw. ihr level 0 klon !!!
		IsGlobalFlagTrue {Name = "janinaghost", UpdateInterval = 10},
	},
	Actions = 
	{
		
	},
}
		
OnOneTimeEvent
{
	Actions =
	{
		AttackTarget{ Target = 5635 , NpcId = self, FriendlyFire = TRUE },
	}
}

EndDefinition()

end
