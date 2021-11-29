-->INFO ZANDARH

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}

SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201Auftrag2Erhalten"}, 
		
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name= "g_sP201ZandarhAmLeben"},
		SetMinimapAlert{ X = 170, Y = 159, Type = 6},
		RevealUnExplored {X = 170, Y = 159, Range = 10},
		PlaySound{Sound = SoundDragonSpawn},
	}
} 
EndDefinition()

end
