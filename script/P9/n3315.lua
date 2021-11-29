-->INFO: SideRampCart
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p9\n3315_SideRampCart.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "sideRampCart001", String = "(Dieser Karren ist gef�llt mit Eisen.)"},
			OfferAnswer{Tag = "sideRampCart001PC", String = "(Das Eisen vom Karren nehmen.)", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "sideRampCart002", String = "(Das Eisen wird Ihrem Eisenvorrat hinzugef�gt.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			TransferResource{Resource = GoodIron , Amount = 600 , Side = SideLight , Flag = Give},
				TransferXP{XP = 50 , Flag = Give},
				SetGlobalFlagTrue{Name = "Q468SideRampLooted"},
				ChangeObject{X = 406 , Y = 146 , Object = 2437},
				SetRewardFlagTrue{ Name = "Eisenkarren7"},
				RemoveDialog{},
			EndDialog(),
		}}


	EndDefinition()
end