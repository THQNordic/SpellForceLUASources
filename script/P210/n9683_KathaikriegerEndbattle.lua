
OnOneTimeEvent
{
	Actions =
	{
		ChangeRace{ Race = 152 , NpcId = self }, -- Kathaikrieger sind zu Beginn TestNeutral 
	}
}




OnToggleEvent 
{
	UpdateInterval = 20,
	OnConditions =
	{
		IsGlobalFlagTrue{Name = "g_P210_AtWarWithKathai", UpdateInterval = 250},
	},
	OnActions	=
	{
		ChangeRace{ Race = 105 , NpcId = self }, -- die Kathaikrieger kriegen Orc-Race
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "g_P210_AtWarWithKathai", UpdateInterval = 20},
	},
	OffActions	=
	{
		ChangeRace{ Race = 152 , NpcId = self }, -- die Kathaikrieger werden TestNeutral
	}
}
