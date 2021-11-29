function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnToggleEvent 
{
	UpdateInterval = 13,
	OnConditions =
	{
		IsGlobalFlagTrue{Name = "g_P210Room1aEye02On", UpdateInterval = 13},
	},
	OnActions	=
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3051},     
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "g_P210Room1aEye02On", UpdateInterval = 13},
	},
	OffActions	=
	{
		ChangeObject{ X = _X, Y = _Y, Object = 3052},
	}
}

EndDefinition()

end
