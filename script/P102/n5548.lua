function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
Rem = [[
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "PoisonStart" }, --Wenn die Wasserquelle vergiftet wurde
			
	},
	Actions =
	{
		SetEffect {Effect = "Spawnboss", NpcId = self}, --Setzt den Kithar auf Amok
		ChangeRace {Race = 153, NpcId = self}, --Kämpft nun auch gegen seine eigenen Landsleute 
	}
}

]]
EndDefinition()

end
