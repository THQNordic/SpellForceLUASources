-->INFO: Golemaltar
--Golemaltar

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P202\n11060_Golemaltar.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			UND9
															{
															FigureAlive {NpcId = 11595},
															IsGlobalFlagTrue {Name = "g_P202GolemNeutralLebt", UpdateInterval = 10}
															}
															,
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND9
															{
															FigureAlive {NpcId = 11595},
															IsGlobalFlagTrue {Name = "g_P202GolemNeutralLebt", UpdateInterval = 10}
															}
															),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "golem_altarP202_001", String = "(In dem Sockel des Steinaltars sind ein großer Bergkristall und ein Onyx eingelassen. Auf seiner Oberfläche finden sich seltsame Zeichnungen.)"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "golem_altarP202_002", String = "(Die Zeichnungen auf dem Altar bilden Teile einer Figur. Pfeile und Schriftzeichen scheinen zu beschreiben, wie sich die Teile miteinander verbinden.)"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(UND9
															{
															PlayerHasItem {ItemId = 7072, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 10},
															PlayerHasItem {ItemId = 7070, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 10},
															PlayerHasItem {ItemId = 7071, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 10}
															}
															),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{6;
		Conditions = {
			UND9
															{
															PlayerHasItem {ItemId = 7072, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 10},
															PlayerHasItem {ItemId = 7070, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 10},
															PlayerHasItem {ItemId = 7071, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 10}
															}
															,
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "golem_altarP202_003PC", String = "(Die drei Teile des Golems nach der Anleitung auf dem Altar zusammenfügen.)", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P202GolemNeutralSpawnt"} ,
			Say{Tag = "golem_altarP202_004", String = "(Ihr fügt die Teile des Golem zusammen. Sie verbinden sich als wären sie nie getrennt worden! Ein Summen scheint vom leblosen Körper des Golem auszugehen.)"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "golem_altarP202_005", String = "(Ihr ahbt den Golem zusammengestzt, aber er bleibt reglos. Ihr erkennt in den Zeichnungen auf dem Altar noch ein weiteres Teil, dass in seine Brust eingesetzt werden muss.)"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "golem_altarP202_006", String = "(Es scheint das Herz zu fehlen, das den Golem zum Leben erweckt. Ihr seht zwei solcher Herzen, die im Sockel des Altar eingelassen sind.)"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "golem_altarP202_007", String = "(Eines ist eine Herz aus Bergkristall, das andere ist ein Herz aus Onyx. Daneben findet Ihr Schriftzeichen. Sie besagen, dass der Golem durch den Bergkristall die Kraft der Erdmagie und durch den Onyx Schutz gegen schwrze Magie erhält..)"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "golem_altarP202_008", String = "(Aber beide Herzen scheinen beschädigt zu sein.)"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "golem_altarP202_009PC", String = "(Dem Golem das Herz aus Bergkristall einsetzen.)", AnswerId = 13},
			OfferAnswer{Tag = "golem_altarP202_014PC", String = "(Dem Golem das Herz aus Onyx einsetzen.)", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7074, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 10} ),
		},
		Actions = {
			Say{Tag = "golem_altarP202_013", String = "(Das Herz aus Bergkristall ist beschädigt. Ihr benötigt einen Bergkristall um es wiederherzustellen.)"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{14;
		Conditions = {
			PlayerHasItem {ItemId = 7074, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 10} ,
		},
		Actions = {
			Say{Tag = "golem_altarP202_010", String = "(Ihr fügt den gefundenen Bergkristall in das Herz ein. Er beginnt zu wispern und zu pochen.)"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "golem_altarP202_011", String = "(Ihr legt das Herz aus Bergkristall. in die Brust des Golems)"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "golem_altarP202_012", String = "(Der Golem erhebt sich! Sein Körper scheint mit der Macht der Erde zu glühen, der nichts und niemand wiederstehen kann!)"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P202BergkristallGolemGewaehlt"} ,
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
			PlayerHasItem {ItemId = 7073, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 10} ,
		},
		Actions = {
			Say{Tag = "golem_altarP202_015", String = "(Ihr fügt den gefunden Onyx in das Herz ein. Es beginnt zu wispern und zu pochen.)"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7073, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 10} ),
		},
		Actions = {
			Say{Tag = "golem_altarP202_018", String = "(Das Herz aus Onyx ist beschädigt. Ihr benötigt einen Onyx um es wiederherzustellen.)"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "golem_altarP202_016", String = "(Ihr legt das Herz aus Onyx in die Brust des Golems.)"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "golem_altarP202_017", String = "(Der Golem erhebt sich! Schwarze Magie scheint seinen Körper zu umströmen und einen unüberwindlichen Schild zu bilden!)"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P202OnyxGolemGewaehlt"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "golem_altarP202_019", String = "(Die abgebildete Figur scheint aus drei Teilen zu bestehen.)"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end