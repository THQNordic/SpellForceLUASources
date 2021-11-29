-->INFO: MonumentCart
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p9\n3314_MonumentCart.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "monumentCart001", String = "(Dieser Karren ist gefüllt mit Eisen.)"},
			OfferAnswer{Tag = "monumentCart001PC", String = "(Das Eisen vom Karren nehmen.)", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "monumentCart002", String = "(Das Eisen wird Ihrem Eisenvorrat hinzugefügt.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			TransferResource{Resource = GoodIron , Amount = 300 , Side = SideLight , Flag = Give},
				TransferXP{XP = 50 , Flag = Give},
				SetGlobalFlagTrue{Name = "Q468MonumentLooted"},
				ChangeObject{X = 371 , Y = 266 , Object = 2437},
				SetRewardFlagTrue{ Name = "Eisenkarren6"},
				RemoveDialog{},
			EndDialog(),
		}}


	EndDefinition()
end