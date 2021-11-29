--INFO: John Dundred

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "DundredIsInGame"},
	},
}

dofile ("script/p101/n5538_FlüchtlingeGerettet.lua")  -- gerettete Flüchtlinge



EndDefinition()

end
