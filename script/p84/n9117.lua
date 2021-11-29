function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {IsGlobalFlagTrue{Name = "p84_second_wave_battle"}},
	Actions = {ChangeRace{Race = 152}} -- Wechsel der Race in eine auf den Avatar neutrale race
}

SpawnOnlyWhen
{X = 106 , Y = 95 , NoSpawnEffect = TRUE ,
	Conditions = {IsGlobalFlagTrue{Name = "p84_second_wave_battle"}},
	Actions = {}
}

EndDefinition()

end
