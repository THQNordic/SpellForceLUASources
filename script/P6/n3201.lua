-- Blades Attack Rohen
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)


Despawn
{
	Conditions =
	{
		FigureAlive {NpcId = _NpcId},	
		IsGlobalFlagTrue {Name = "CutscenRohenBladesAttackOver"},
	},
}
EndDefinition()

end