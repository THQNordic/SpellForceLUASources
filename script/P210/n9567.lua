function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_210_CutsceneXalabarArmyVanish"}
	},
}

EndDefinition()

end
