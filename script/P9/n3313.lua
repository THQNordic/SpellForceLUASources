-->INFO: BlockerCart
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p9\n3313_BlockerCart.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "blockerCart001", String = "(Dieser Karren ist gefüllt mit Eisen.)"},
			OfferAnswer{Tag = "blockerCart001PC", String = "(Das Eisen vom Karren nehmen.)", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "blockerCart002", String = "(Das Eisen wird Ihrem Eisenvorrat hinzugefügt.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			TransferResource{Resource = GoodIron , Amount = 600 , Side = SideLight , Flag = Give},
				TransferXP{XP = 50 , Flag = Give},
				SetGlobalFlagTrue{Name = "Q468BlockerLooted"},
				ChangeObject{X = 209 , Y = 203 , Object = 2437},
				SetRewardFlagTrue{ Name = "Eisenkarren5"},
				RemoveDialog{},
			EndDialog(),
		}}


	EndDefinition()
end