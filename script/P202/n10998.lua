-- Kreischer Wassertorwächter

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p202/n10994_BodenrankenWaechter.lua")

--OnDeath
--{
--	Actions = 
--	{ 
--		SetGlobalFlagTrue {Name = "g_P202WasserQuestErsteRundeVorbei"}
--	}
--}


EndDefinition()

end
