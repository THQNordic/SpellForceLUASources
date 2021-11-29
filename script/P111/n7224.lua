-->INFO: SchwertimStein
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p111\n7224_SchwertimStein.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "schwertimstein_P111_001", String = "(Eine Klinge aus dunklem Kristall ragt aus dem Stein. Schemen scheinen sich im Innern des Kristalls zu bewegen.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			UND(IsGlobalFlagTrue{Name = "SpawnCampsZerstoertP111"}, FigureDead{NpcId = 6991}),
		},
		Actions = {
			Say{Tag = "schwertimstein_P111_002", String = "(Ihr silberner Griff ist bedeckt mit seltsamen Symbolen einer unbekannten Schrift.)"},
			OfferAnswer{Tag = "schwertimstein_P111_003PC", String = "(Das Schattenschwert herausziehen.)", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(UND(IsGlobalFlagTrue{Name = "SpawnCampsZerstoertP111"}, FigureDead{NpcId = 6991})),
		},
		Actions = {
			Say{Tag = "schwertimstein_P111_002", String = "(Ihr silberner Griff ist bedeckt mit seltsamen Symbolen einer unbekannten Schrift.)"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "schwertimstein_P111_004", String = "(Die Klinge gleitet aus dem Stein. Sie bebt, als wolle sie aus Eurer Hand springen.)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "schwertimstein_P111_005", String = "(Aber als Ihr einen kalten Griff um Euer Herz spürt, beruhigt sich die Waffe und liegt nun gut in der Hand.)"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "schwertimstein_P111_006", String = "(Es ist, als wäre diese Klinge für Eure Hand gemacht worden.)"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "SchwertErhaltenP111"},
				SetItemFlagTrue{Name = "PlayerHasItemSchattenschwert"},
				RemoveDialog{NpcId = 7224},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end