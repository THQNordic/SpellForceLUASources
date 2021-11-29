function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {IsGlobalFlagTrue{Name = "p84_start_goblin_battle"}},
	Actions = {ChangeRace{Race = 152}} -- Wechsel der Race in eine auf den Avatar neutrale race
}

SpawnOnlyWhen
{X = 114 , Y = 85 , NoSpawnEffect = TRUE ,
	Conditions = {IsGlobalFlagTrue{Name = "p84_start_goblin_battle"}},
	Actions = {}
}

EndDefinition()

end
