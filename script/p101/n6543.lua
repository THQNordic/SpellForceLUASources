-->INFO: Kreischer
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = TRUE,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "P101_KreischerKnochenquestSpawn"}
	},
}

OnToggleEvent
{
	OnConditions = 
	{
		IsGlobalFlagFalse {Name ="P101_KreischerKannSprechen"},
	 },
	OnActions = 
	{
		 RemoveDialog { NpcId = self} ,
	},
	OffConditions = 
	{
		IsGlobalFlagTrue {Name ="P101_KreischerKannSprechen"},
	},
	OffActions = 
	{
		EnableDialog { NpcId = self} ,
	},
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p101\n6543_Kreischer.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "KreischerBekannt"},
		},
		Actions = {
			Say{Tag = "kreischer101_001", String = "Diebe! Diebe!"},
			Answer{Tag = "kreischer101_002PC", String = "Noch habe ich nichts gestohlen!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "KreischerBekannt"}),
			IsNpcFlagFalse{Name = "Ist_Rubin_vorhanden"},
			IsNpcFlagFalse{Name = "Ist_Smaragd_vorhanden"},
			IsNpcFlagFalse{Name = "Ist_Diamant_vorhanden"},
			IsNpcFlagFalse{Name = "Ist_anderer_Stein_vorhanden"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kreischer101_008PC", String = "Ich habe einen Rubin.", AnswerId = 6},
			OfferAnswer{Tag = "kreischer101_010PC", String = "Ein Smaragd?", AnswerId = 9},
			OfferAnswer{Tag = "kreischer101_012PC", String = "Ich gebe Euch einen Diamanten.", AnswerId = 12},
			OfferAnswer{Tag = "kreischer101_014PC", String = "Ich hab da einen Edelstein ...", AnswerId = 16},
			OfferAnswer{Tag = "kreischer101_016PC", String = "Ich habe nichts, was ich Euch geben könnte.", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "KreischerBekannt"}),
			IsNpcFlagFalse{Name = "Ist_Rubin_vorhanden"},
			IsNpcFlagFalse{Name = "Ist_Smaragd_vorhanden"},
			IsNpcFlagFalse{Name = "Ist_Diamant_vorhanden"},
			Negated(IsNpcFlagFalse{Name = "Ist_anderer_Stein_vorhanden"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kreischer101_008PC", String = "Ich habe einen Rubin.", AnswerId = 6},
			OfferAnswer{Tag = "kreischer101_010PC", String = "Ein Smaragd?", AnswerId = 9},
			OfferAnswer{Tag = "kreischer101_012PC", String = "Ich gebe Euch einen Diamanten.", AnswerId = 12},
			OfferAnswer{Tag = "kreischer101_016PC", String = "Ich habe nichts, was ich Euch geben könnte.", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "KreischerBekannt"}),
			IsNpcFlagFalse{Name = "Ist_Rubin_vorhanden"},
			IsNpcFlagFalse{Name = "Ist_Smaragd_vorhanden"},
			Negated(IsNpcFlagFalse{Name = "Ist_Diamant_vorhanden"}),
			IsNpcFlagFalse{Name = "Ist_anderer_Stein_vorhanden"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kreischer101_008PC", String = "Ich habe einen Rubin.", AnswerId = 6},
			OfferAnswer{Tag = "kreischer101_010PC", String = "Ein Smaragd?", AnswerId = 9},
			OfferAnswer{Tag = "kreischer101_014PC", String = "Ich hab da einen Edelstein ...", AnswerId = 16},
			OfferAnswer{Tag = "kreischer101_016PC", String = "Ich habe nichts, was ich Euch geben könnte.", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "KreischerBekannt"}),
			IsNpcFlagFalse{Name = "Ist_Rubin_vorhanden"},
			IsNpcFlagFalse{Name = "Ist_Smaragd_vorhanden"},
			Negated(IsNpcFlagFalse{Name = "Ist_Diamant_vorhanden"}),
			Negated(IsNpcFlagFalse{Name = "Ist_anderer_Stein_vorhanden"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kreischer101_008PC", String = "Ich habe einen Rubin.", AnswerId = 6},
			OfferAnswer{Tag = "kreischer101_010PC", String = "Ein Smaragd?", AnswerId = 9},
			OfferAnswer{Tag = "kreischer101_016PC", String = "Ich habe nichts, was ich Euch geben könnte.", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "KreischerBekannt"}),
			IsNpcFlagFalse{Name = "Ist_Rubin_vorhanden"},
			Negated(IsNpcFlagFalse{Name = "Ist_Smaragd_vorhanden"}),
			IsNpcFlagFalse{Name = "Ist_Diamant_vorhanden"},
			IsNpcFlagFalse{Name = "Ist_anderer_Stein_vorhanden"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kreischer101_008PC", String = "Ich habe einen Rubin.", AnswerId = 6},
			OfferAnswer{Tag = "kreischer101_012PC", String = "Ich gebe Euch einen Diamanten.", AnswerId = 12},
			OfferAnswer{Tag = "kreischer101_014PC", String = "Ich hab da einen Edelstein ...", AnswerId = 16},
			OfferAnswer{Tag = "kreischer101_016PC", String = "Ich habe nichts, was ich Euch geben könnte.", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "KreischerBekannt"}),
			IsNpcFlagFalse{Name = "Ist_Rubin_vorhanden"},
			Negated(IsNpcFlagFalse{Name = "Ist_Smaragd_vorhanden"}),
			IsNpcFlagFalse{Name = "Ist_Diamant_vorhanden"},
			Negated(IsNpcFlagFalse{Name = "Ist_anderer_Stein_vorhanden"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kreischer101_008PC", String = "Ich habe einen Rubin.", AnswerId = 6},
			OfferAnswer{Tag = "kreischer101_012PC", String = "Ich gebe Euch einen Diamanten.", AnswerId = 12},
			OfferAnswer{Tag = "kreischer101_016PC", String = "Ich habe nichts, was ich Euch geben könnte.", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "KreischerBekannt"}),
			IsNpcFlagFalse{Name = "Ist_Rubin_vorhanden"},
			Negated(IsNpcFlagFalse{Name = "Ist_Smaragd_vorhanden"}),
			Negated(IsNpcFlagFalse{Name = "Ist_Diamant_vorhanden"}),
			IsNpcFlagFalse{Name = "Ist_anderer_Stein_vorhanden"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kreischer101_008PC", String = "Ich habe einen Rubin.", AnswerId = 6},
			OfferAnswer{Tag = "kreischer101_014PC", String = "Ich hab da einen Edelstein ...", AnswerId = 16},
			OfferAnswer{Tag = "kreischer101_016PC", String = "Ich habe nichts, was ich Euch geben könnte.", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "KreischerBekannt"}),
			IsNpcFlagFalse{Name = "Ist_Rubin_vorhanden"},
			Negated(IsNpcFlagFalse{Name = "Ist_Smaragd_vorhanden"}),
			Negated(IsNpcFlagFalse{Name = "Ist_Diamant_vorhanden"}),
			Negated(IsNpcFlagFalse{Name = "Ist_anderer_Stein_vorhanden"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kreischer101_008PC", String = "Ich habe einen Rubin.", AnswerId = 6},
			OfferAnswer{Tag = "kreischer101_016PC", String = "Ich habe nichts, was ich Euch geben könnte.", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "KreischerBekannt"}),
			Negated(IsNpcFlagFalse{Name = "Ist_Rubin_vorhanden"}),
			IsNpcFlagFalse{Name = "Ist_Smaragd_vorhanden"},
			IsNpcFlagFalse{Name = "Ist_Diamant_vorhanden"},
			IsNpcFlagFalse{Name = "Ist_anderer_Stein_vorhanden"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kreischer101_010PC", String = "Ein Smaragd?", AnswerId = 9},
			OfferAnswer{Tag = "kreischer101_012PC", String = "Ich gebe Euch einen Diamanten.", AnswerId = 12},
			OfferAnswer{Tag = "kreischer101_014PC", String = "Ich hab da einen Edelstein ...", AnswerId = 16},
			OfferAnswer{Tag = "kreischer101_016PC", String = "Ich habe nichts, was ich Euch geben könnte.", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "KreischerBekannt"}),
			Negated(IsNpcFlagFalse{Name = "Ist_Rubin_vorhanden"}),
			IsNpcFlagFalse{Name = "Ist_Smaragd_vorhanden"},
			IsNpcFlagFalse{Name = "Ist_Diamant_vorhanden"},
			Negated(IsNpcFlagFalse{Name = "Ist_anderer_Stein_vorhanden"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kreischer101_010PC", String = "Ein Smaragd?", AnswerId = 9},
			OfferAnswer{Tag = "kreischer101_012PC", String = "Ich gebe Euch einen Diamanten.", AnswerId = 12},
			OfferAnswer{Tag = "kreischer101_016PC", String = "Ich habe nichts, was ich Euch geben könnte.", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "KreischerBekannt"}),
			Negated(IsNpcFlagFalse{Name = "Ist_Rubin_vorhanden"}),
			IsNpcFlagFalse{Name = "Ist_Smaragd_vorhanden"},
			Negated(IsNpcFlagFalse{Name = "Ist_Diamant_vorhanden"}),
			IsNpcFlagFalse{Name = "Ist_anderer_Stein_vorhanden"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kreischer101_010PC", String = "Ein Smaragd?", AnswerId = 9},
			OfferAnswer{Tag = "kreischer101_014PC", String = "Ich hab da einen Edelstein ...", AnswerId = 16},
			OfferAnswer{Tag = "kreischer101_016PC", String = "Ich habe nichts, was ich Euch geben könnte.", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "KreischerBekannt"}),
			Negated(IsNpcFlagFalse{Name = "Ist_Rubin_vorhanden"}),
			IsNpcFlagFalse{Name = "Ist_Smaragd_vorhanden"},
			Negated(IsNpcFlagFalse{Name = "Ist_Diamant_vorhanden"}),
			Negated(IsNpcFlagFalse{Name = "Ist_anderer_Stein_vorhanden"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kreischer101_010PC", String = "Ein Smaragd?", AnswerId = 9},
			OfferAnswer{Tag = "kreischer101_016PC", String = "Ich habe nichts, was ich Euch geben könnte.", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "KreischerBekannt"}),
			Negated(IsNpcFlagFalse{Name = "Ist_Rubin_vorhanden"}),
			Negated(IsNpcFlagFalse{Name = "Ist_Smaragd_vorhanden"}),
			IsNpcFlagFalse{Name = "Ist_Diamant_vorhanden"},
			IsNpcFlagFalse{Name = "Ist_anderer_Stein_vorhanden"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kreischer101_012PC", String = "Ich gebe Euch einen Diamanten.", AnswerId = 12},
			OfferAnswer{Tag = "kreischer101_014PC", String = "Ich hab da einen Edelstein ...", AnswerId = 16},
			OfferAnswer{Tag = "kreischer101_016PC", String = "Ich habe nichts, was ich Euch geben könnte.", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "KreischerBekannt"}),
			Negated(IsNpcFlagFalse{Name = "Ist_Rubin_vorhanden"}),
			Negated(IsNpcFlagFalse{Name = "Ist_Smaragd_vorhanden"}),
			IsNpcFlagFalse{Name = "Ist_Diamant_vorhanden"},
			Negated(IsNpcFlagFalse{Name = "Ist_anderer_Stein_vorhanden"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kreischer101_012PC", String = "Ich gebe Euch einen Diamanten.", AnswerId = 12},
			OfferAnswer{Tag = "kreischer101_016PC", String = "Ich habe nichts, was ich Euch geben könnte.", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "KreischerBekannt"}),
			Negated(IsNpcFlagFalse{Name = "Ist_Rubin_vorhanden"}),
			Negated(IsNpcFlagFalse{Name = "Ist_Smaragd_vorhanden"}),
			Negated(IsNpcFlagFalse{Name = "Ist_Diamant_vorhanden"}),
			IsNpcFlagFalse{Name = "Ist_anderer_Stein_vorhanden"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kreischer101_014PC", String = "Ich hab da einen Edelstein ...", AnswerId = 16},
			OfferAnswer{Tag = "kreischer101_016PC", String = "Ich habe nichts, was ich Euch geben könnte.", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "KreischerBekannt"}),
			Negated(IsNpcFlagFalse{Name = "Ist_Rubin_vorhanden"}),
			Negated(IsNpcFlagFalse{Name = "Ist_Smaragd_vorhanden"}),
			Negated(IsNpcFlagFalse{Name = "Ist_Diamant_vorhanden"}),
			Negated(IsNpcFlagFalse{Name = "Ist_anderer_Stein_vorhanden"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "kreischer101_016PC", String = "Ich habe nichts, was ich Euch geben könnte.", AnswerId = 17},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kreischer101_003", String = "Ja, denn vorher stirbst du! Oder du bringst den Lohn ... den Lohn ..."},
			Answer{Tag = "kreischer101_004PC", String = "Was ist der Lohn?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kreischer101_005", String = "Glitzern! Versprochen er hat! Glitzern! Aber er ist tot ... tot ..."},
			Answer{Tag = "kreischer101_006PC", String = "Etwas Glitzerndes? Was?", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kreischer101_007", String = "Glitzerstein! Glitzerstein! Rein wie Schnee! Versprochen er hat ... er hat ..."},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "KreischerBekannt"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kreischer101_009", String = "Nein! Nicht rein! Rotes Glitzern! Rot wie Blut ... Blut ... Blut!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "Rubin_geben"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kreischer101_011", String = "Ah! Nein, Nicht rein! Grün wie Gift! Grün wie Hass ... Hass ..."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "Smaragd_geben"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "Diamant_geben"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kreischer101_013", String = "Rein! Rein! Klares Glitzern wie Schnee! Der Lohn ... der Lohn ..."},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kreischer101_015", String = "Schönes Glitzern, aber zu schwach ... schwach ...."},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "kreischer101_017", String = "Dann fort mit dir Dieb! Fort!"},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end