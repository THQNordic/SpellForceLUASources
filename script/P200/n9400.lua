function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
OnToggleEvent
{
	NotInDialog = FALSE ,
	UpdateInterval = 60 ,
	OnConditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
	},
	OnActions = 
	{
		LookAtFigure {Target = 0, NpcId = self},
	},
	OffConditions = 
	{
		IsGlobalFlagFalse {Name = "g_sP200AvatarInArena"},
	},
	OffActions = 
	{
		LookAtDirection {Direction = East, NpcId = self},
	},
}

EndDefinition()

end
