function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = FALSE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "P104_CutsceneDraconSpawnen"},
	},
	Actions =
	{
		--Outcry {Tag = "ocArachP004_009", NpcId = 5379, String = "Warte Runenknecht! Dein Kopf gehört mir!", Color = ColorWhite}, 
		SetGlobalTimeStamp {Name = "DespawnLena"},
		SetGlobalFlagTrue {Name = "Bogenelfen"},
	}
}


OnDeath
{
	Actions =
	{
		SetGlobalFlagTrue {Name = "P104_DraconTot"},
	}
}


EndDefinition()

end
