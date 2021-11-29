-->INFO: DwarfCart
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P108\n6061_DwarfCart.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "dwarfcart108_001", String = "(Dieser Karren ist gefüllt mit Waren.)"},
			OfferAnswer{Tag = "dwarfcart108_002PC", String = "(Die Waren vom Karren nehmen.)", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "dwarfcart108_003", String = "(Rohstoffe werden Ihrem Vorrat hinzugefügt.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			TransferResource{Resource = GoodIron, Amount = 300, Side = SideLight , Flag = Give},
				ChangeObject{X = 141, Y = 324, Object = 2437},
				RemoveDialog{},
			EndDialog(),
		}}


	EndDefinition()
end