-->INFO ANDAR

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}

SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201SheehaAmLeben"}, 
		FigureDead {NpcId = 9207},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name= "g_sP201AndarAmLeben"},
		SetMinimapAlert{ X = 105, Y = 24, Type = 6},
		RevealUnExplored {X = 105, Y = 24, Range = 10},
		PlaySound{Sound = SoundDragonSpawn},
	}
} 

EndDefinition()

end
