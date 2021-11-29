--------------------------------------------------------
--
--	Trokan
--
--------------------------------------------------------

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- Chage Race auf Feindliche Dervische
OnOneTimeEvent
{
	Actions = 
	{
		ChangeRace {Race = 209}
	}
}

EndDefinition()

end
