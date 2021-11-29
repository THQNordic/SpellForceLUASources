-->LAURIN

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}

SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201Auftrag2Erfuellt"}, 
		
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_sP201LaurinAmLeben"},
		SetMinimapAlert{ X = 165, Y = 214, Type = 6},
		RevealUnExplored {X = 165, Y = 214, Range = 10},
		PlaySound{Sound = SoundDragonSpawn},
		
	}
} 

EndDefinition()

end
