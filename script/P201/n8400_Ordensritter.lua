-- _______________________________________
--I                                      I
--I   P201_Ordensritter_Zentralscript    I
--I______________________________________I


function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
		IsGlobalFlagTrue {Name = "g_sP201OrdensritterSpawn"},
	},
	Actions = 
	{
		Goto {X = 103, Y = 92, NpcId = self, Range = 3, WalkMode = Walk, GotoMode = GotoNormal},
		ChangeFigureOwner {NpcId = self},
		Follow {Target = 0, NpcId = self},	
	}
} 


Respawn  
{
	WaitTime = 30, 
	NoSpawnEffect = FALSE ,
 	Conditions = 
 	{
		IsGlobalFlagFalse {Name = "g_sP201StartCutszeneOutpost"},
		 		
 	},
 	Actions = 
 	{
 		ChangeFigureOwner {NpcId = self},
 		Follow {Target = 0, NpcId = self},	
 	},
 	DeathActions = 
 	{
 	
 	} 
}

Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201StartCutszeneOutpost"}, 
	},
	Actions =
	{
	
	}
}
	




EndDefinition()

end
