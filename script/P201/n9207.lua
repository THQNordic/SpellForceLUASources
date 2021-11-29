-->INFO SHEEHA

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{NpcId = self}

SpawnOnlyWhen
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP201Auftrag1Erhalten"}, 
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name= "g_sP201SheehaAmLeben"},
		SetMinimapAlert{ X = 161, Y = 71, Type = 6},
		RevealUnExplored {X = 161, Y = 71, Range = 10},
		PlaySound{Sound = SoundDragonSpawn},
	}
} 

EndDefinition()

end
