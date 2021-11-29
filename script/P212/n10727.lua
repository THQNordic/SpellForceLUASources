function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
------OutcryDummy Event für Scriptparser
OnOneTimeEvent
{
Conditions = {
			IsGlobalFlagTrue{Name = "NeverTrue"}
			},
Actions = {
		Outcry { NpcId = 10727, Tag = "oca2soulforger_001", String = "Ich habe eine der heiligen Säulen wieder erweckt, Meister!"},	
		}
}

EndDefinition()

end
