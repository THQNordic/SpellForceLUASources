function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Wenn die Introcutscene zu Ende ist wird nur noch ein Hokan gabraucht
Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P213_HokanGeht", UpdateInterval = 2}
	}
}


EndDefinition()

end
