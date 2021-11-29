-->IRIDON

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}

SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201ZandarhAmLeben"}, 
		FigureDead {NpcId = 9212},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name= "g_sP201IridonAmLeben"},
		SetMinimapAlert{ X = 115, Y = 170, Type = 6},
		RevealUnExplored {X = 115, Y = 170, Range = 10},
		PlaySound{Sound = SoundDragonSpawn},
	}
} 
EndDefinition()

end
