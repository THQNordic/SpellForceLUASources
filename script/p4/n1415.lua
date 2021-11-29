function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Umwandlung Killbefehl Orcs in Attacken
OnOneTimeEvent
{
Conditions = 	{
		IsGlobalFlagTrue{Name = "KillComandGiven" , UpdateInterval = 10}
		},
Actions =	{
		-- hier würde ich mal sagen das es safe ist, da das gemetzel nur stattfindet
		-- wenn spielereinheiten in der nähe sind, zumal die orks ohnehin aggro auf die elfen sind
		AttackTarget{Target = 1370 , NpcId = self , FriendlyFire = TRUE}
		}
}





EndDefinition()

end
