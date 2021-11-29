-->INFO: Tanar
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnIdleGoHome{X = _X, Y = _Y, Direction = NorthEast , 
Conditions = {IsGlobalFlagFalse{Name = "Q165TanarFollow"}}
}

OnDeadPlayerGoHome
{
X = _X, Y = _Y, Direction = NorthEast, KeepFollowing = FALSE ,
Conditions = {},
Actions = {
		EnableDialog{} , 
		SetGlobalFlagFalse{Name = "Q165TanarFollow"} , 
		SetNpcFlagFalse{Name = "ToggleSimul"}},
HomeActions = { },
}

--Toggle Follow
--on
OnEvent
{
Conditions = {
				IsGlobalFlagTrue{Name = "Q165TanarFollow"},
				IsNpcFlagFalse{Name = "ToggleSimul" , UpdateInterval = 10},
				FigureJob{Job = JobIdle , NpcId = self},
				IsGlobalFlagFalse{Name = "GDS_PlayerIsTalking", UpdateInterval = 1},
				FigureAlive{NpcId = Avatar},
				},
Actions = 	{
				-- ist ein aggro toggle follow, also safe
				Follow{Target = Avatar , NpcId = self},
				SetNpcFlagTrue{Name = "ToggleSimul"},
				}
}
--off
OnEvent
{
Conditions = {
				IsNpcFlagTrue{Name = "ToggleSimul" , UpdateInterval = 10},
				FigureHasAggro{NpcId = self , UpdateInterval = 10},
				IsGlobalFlagFalse{Name = "GDS_PlayerIsTalking", UpdateInterval = 1},
				FigureAlive{NpcId = Avatar},
				},		
Actions = 	{
				StopFollow{Target = Avatar , NpcId = self},
				SetNpcFlagFalse{Name = "ToggleSimul"},
			}
}

--Dialogsteuerung


OnToggleEvent
{
OnConditions = {
			IsGlobalFlagFalse{Name = "Q164WelpIsHome"}
			},
OnActions = {
	RemoveDialog{}
	},
OffConditions = {
		IsGlobalFlagTrue{Name = "Q164WelpIsHome", UpdateInterval = 10}
			},
OffActions = {
	LookAtFigure{Target = 2263},
	EnableDialog{},
	SetDialogType{Type = SideQuest},
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p10\n2262_Tanar.txt


	

	OnBeginDialog{
		Conditions = {
			QuestState{QuestId = 164 , State = StateActive},
		},
		Actions = {
			Say{Tag = "tanar001", String = "(Tanar, der Wolfsvater, hat etwas aus dem Boden gescharrt. Er legt es in Eure Hand.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(QuestState{QuestId = 164 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "tanar003", String = "(Tanar begrüßt Euch freudig.)"},
			OfferAnswer{Tag = "tanar003PC", String = "(Tanar mitnehmen.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			SetRewardFlagTrue{ Name = "WeisseSchatten2"},
					QuestSolve{QuestId = 164} , QuestBegin{QuestId = 165},
			Say{Tag = "tanar002", String = "(Tanar schiebt das Welpe mit der Schnauze zu seiner Mutter, und stellt sich dann aufmerksam vor Euch. Er scheint Euch begleiten zu wollen.)"},
			OfferAnswer{Tag = "tanar003PC", String = "(Tanar mitnehmen.)", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q165TanarFollow"} , ChangeRace{Race = 147 , NpcId = self},
				QuestSolve{QuestId = 165} , QuestSolve{QuestId = 161} , SetNpcFlagFalse{Name = "DeadPlayerGoHome"},
				RemoveDialog{},
			EndDialog(),
		}}


	EndDefinition()
end