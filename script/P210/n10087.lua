function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnToggleEvent 
{
	UpdateInterval = 30,
	OnConditions =
	{
		IsGlobalFlagTrue{Name = "g_P210Room9zSwitch1bOn", UpdateInterval = 30},
	},
	OnActions	=
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3039},     
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "g_P210Room9zSwitch1bOn", UpdateInterval = 30},
	},
	OffActions	=
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3040},
	}
}


EndDefinition()

end
