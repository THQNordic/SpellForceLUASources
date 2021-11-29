function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{

	Conditions = 
	{
		ODER9
		{
			IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},
			UND(QuestState {QuestId = 777, State = StateSolved}, IsGlobalFlagTrue{Name = "GDS_PlayerWasOnPlatform_P203"}),
		},
	},
	Actions = 
	{
	
	}
} 
EndDefinition()

end
