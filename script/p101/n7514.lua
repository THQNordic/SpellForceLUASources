-->INFO: Knochenaltar
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p101\n7514_Knochenaltar.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_001", String = "(Der seltsame Altar weist Kratzspuren auf, als wäre darauf mit einem Werkzeug gearbeitet worden. Überall liegen Knochenteile.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 743 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "bonealtarP101_002", String = "(Ihr wisst nichts mit diesem Altar anzufangen.)"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 743 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "bonealtarP101_003", String = "(Auf diesem Altar könnt Ihr Eure Knochenformerkunst einsetzen. Was wollt Ihr fertigen?)"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 743 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 743 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 82},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			IsGlobalFlagFalse {Name = "P101_MageBoneWeaponsChosen"},
			IsGlobalFlagFalse {Name = "P101_FighterBoneWeaponsChosen"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bonealtarP101_004PC", String = "(Einen Knochengegenstand des Berserker-Satzes herstellen - für Kämpfer, Gegenschlag-Bonus.)", AnswerId = 6},
			OfferAnswer{Tag = "bonealtarP101_023PC", String = "(Einen Knochengegenstand des Ahnen-Satzes herstellen - für Magier, Effiziente-Magie-Bonus.)", AnswerId = 44},
		}}

	OnAnswer{5;
		Conditions = {
			IsGlobalFlagFalse {Name = "P101_MageBoneWeaponsChosen"},
			Negated(IsGlobalFlagFalse {Name = "P101_FighterBoneWeaponsChosen"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bonealtarP101_004PC", String = "(Einen Knochengegenstand des Berserker-Satzes herstellen - für Kämpfer, Gegenschlag-Bonus.)", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "P101_MageBoneWeaponsChosen"}),
			IsGlobalFlagFalse {Name = "P101_FighterBoneWeaponsChosen"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bonealtarP101_023PC", String = "(Einen Knochengegenstand des Ahnen-Satzes herstellen - für Magier, Effiziente-Magie-Bonus.)", AnswerId = 44},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "P101_MageBoneWeaponsChosen"}),
			Negated(IsGlobalFlagFalse {Name = "P101_FighterBoneWeaponsChosen"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bonealtarP101_005PC", String = "(Den Schädelhelm des Berserkers herstellen.)", AnswerId = 8},
			OfferAnswer{Tag = "bonealtarP101_011PC", String = "(Den Knochenpanzer des Berserkers herstellen  - für Kämpfer, Gegenschlag-Bonus.)", AnswerId = 20},
			OfferAnswer{Tag = "bonealtarP101_017PC", String = "Das Sägeschwert des Berserkers herstellen  - für Kämpfer, Gegenschlag-Bonus.)", AnswerId = 32},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
			UND(
								UND(
										IsItemFlagTrue {Name = "PlayerHasItemFirstFragment"},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4234}
								)
						,
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(UND(
								UND(
										IsItemFlagTrue {Name = "PlayerHasItemFirstFragment"},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4234}
								)
						),
		},
		Actions = {
			Say{Tag = "bonealtarP101_009", String = "(Um den Schädelhelm des Berserkers zu fertigen, wird ein Schädelfragment, ein Knochenschnitzermesser und ein gelber Blutedelstein benötigt.)"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "P101_PlayerMadeBoneWeapon"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{10;
		Conditions = {
			IsGlobalFlagFalse {Name = "P101_PlayerMadeBoneWeapon"},
		},
		Actions = {
			Say{Tag = "bonealtarP101_006", String = "(Bedenkt: Wenn Ihr einen Gegenstand aus dem Berserker-Satz fertigt, werdet Ihr keine Gegenstände aus dem Ahnen-Satz mehr herstellen können.)"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bonealtarP101_007PC", String = "(Gegenstand herstellen.)", AnswerId = 12},
			OfferAnswer{Tag = "bonealtarP101_008PC", String = "(Gegenstand nicht herstellen.)", AnswerId = 14},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetItemFlagFalse {Name = "PlayerHasItemFirstFragment"},
				  TransferItem{TakeItem = 4176 , Flag = Take},
				  TransferItem{TakeItem = 4234 , Flag = Take},
				  TransferItem{GiveItem = 3787 , Flag = Give},
				  SetGlobalFlagTrue {Name = "P101_PlayerMadeBoneWeapon"},
				  SetGlobalFlagTrue {Name = "P101_FighterBoneWeaponsChosen"},
				  SetGlobalFlagTrue {Name = "P101_BoneSetItem1Made"}
				  ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_010", String = "(Mindestens einer dieser Gegenstände fehlt noch.)"},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(UND(
								UND(
										IsItemFlagTrue {Name = "PlayerHasItemSecondFragment"},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4235}
								)
						),
		},
		Actions = {
			Say{Tag = "bonealtarP101_015", String = "(Um den Knochenpanzer des Berserkers zu fertigen, wird ein Panzerfragment, ein Knochenschnitzermesser und ein blauer Blutedelstein benötigt.)"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{21;
		Conditions = {
			UND(
								UND(
										IsItemFlagTrue {Name = "PlayerHasItemSecondFragment"},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4235}
								)
						,
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "P101_PlayerMadeBoneWeapon"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{22;
		Conditions = {
			IsGlobalFlagFalse {Name = "P101_PlayerMadeBoneWeapon"},
		},
		Actions = {
			Say{Tag = "bonealtarP101_012", String = "(Bedenkt: Wenn Ihr einen Gegenstand aus dem Berserker-Satz fertigt, werdet Ihr keine Gegenstände aus dem Ahnen-Satz mehr herstellen können.)"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bonealtarP101_013PC", String = "(Gegenstand herstellen.)", AnswerId = 24},
			OfferAnswer{Tag = "bonealtarP101_014PC", String = "(Gegenstand nicht herstellen.)", AnswerId = 26},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			SetItemFlagFalse {Name = "PlayerHasItemSecondFragment"},
				  TransferItem{TakeItem = 4176 , Flag = Take},
				  TransferItem{TakeItem = 4235 , Flag = Take},
				  TransferItem{GiveItem = 3788 , Flag = Give},
				  SetGlobalFlagTrue {Name = "P101_PlayerMadeBoneWeapon"},
				  SetGlobalFlagTrue {Name = "P101_FighterBoneWeaponsChosen"},
				  SetGlobalFlagTrue {Name = "P101_BoneSetItem2Made"}
				  ,
			Say{Tag = "", String = ""},
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

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_016", String = "(Mindestens einer dieser Gegenstände fehlt noch.)"},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
			UND(
								UND(
										PlayerHasItem{ItemId = 4259},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4236}
								)
						,
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(UND(
								UND(
										PlayerHasItem{ItemId = 4259},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4236}
								)
						),
		},
		Actions = {
			Say{Tag = "bonealtarP101_021", String = "(Um das Sägeschwert des Berserkers zu fertigen, wird ein Kieferfragment, ein Knochenschnitzermesser und ein violetter Blutedelstein benötigt.)"},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "P101_PlayerMadeBoneWeapon"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{34;
		Conditions = {
			IsGlobalFlagFalse {Name = "P101_PlayerMadeBoneWeapon"},
		},
		Actions = {
			Say{Tag = "bonealtarP101_018", String = "(Bedenkt: Wenn Ihr einen Gegenstand aus dem Berserker-Satz fertigt, werdet Ihr keine Gegenstände aus dem Ahnen-Satz mehr herstellen können.)"},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bonealtarP101_019PC", String = "(Gegenstand herstellen.)", AnswerId = 36},
			OfferAnswer{Tag = "bonealtarP101_020PC", String = "(Gegenstand nicht herstellen.)", AnswerId = 38},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 4259 , Flag = Take},
				  TransferItem{TakeItem = 4176 , Flag = Take},
				  TransferItem{TakeItem = 4235 , Flag = Take},
				  TransferItem{GiveItem = 3789 , Flag = Give},
				  SetGlobalFlagTrue {Name = "P101_PlayerMadeBoneWeapon"},
				  SetGlobalFlagTrue {Name = "P101_FighterBoneWeaponsChosen"},
				  SetGlobalFlagTrue {Name = "P101_BoneSetItem3Made"}
				  ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_022", String = "(Mindestens einer dieser Gegenstände fehlt noch.)"},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bonealtarP101_024PC", String = "(Den Schädelhelm der Ahnen herstellen - für Magier, Effiziente-Magie-Bonus.)", AnswerId = 46},
			OfferAnswer{Tag = "bonealtarP101_030PC", String = "(Den Knochenpanzer der Ahnen herstellen - für Magier, Effiziente-Magie-Bonus.)", AnswerId = 58},
			OfferAnswer{Tag = "bonealtarP101_035PC", String = "(Den Knochenstab der Ahnen herstellen - für Magier, Effiziente-Magie-Bonus.)", AnswerId = 70},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(UND(
								UND(
										IsItemFlagTrue {Name = "PlayerHasItemFirstFragment"},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4234}
								)
						),
		},
		Actions = {
			Say{Tag = "bonealtarP101_028", String = "(Um den Schädelhelm der Ahnen herzustellen, wird ein Schädelfragment, ein Knochenschnitzermesser und ein gelber Blutedelstein benötigt.)"},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{47;
		Conditions = {
			UND(
								UND(
										IsItemFlagTrue {Name = "PlayerHasItemFirstFragment"},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4234}
								)
						,
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "P101_PlayerMadeBoneWeapon"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{48;
		Conditions = {
			IsGlobalFlagFalse {Name = "P101_PlayerMadeBoneWeapon"},
		},
		Actions = {
			Say{Tag = "bonealtarP101_025", String = "(Bedenkt: Wenn Ihr einen Gegenstand aus dem Ahnen-Satz fertigt, werdet Ihr keine Gegenstände aus dem Berserker-Satz mehr herstellen können.)"},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bonealtarP101_026PC", String = "(Gegenstand herstellen.)", AnswerId = 50},
			OfferAnswer{Tag = "bonealtarP101_027PC", String = "(Gegenstand nicht herstellen.)", AnswerId = 52},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{54;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			SetItemFlagFalse {Name = "PlayerHasItemFirstFragment"},
				  TransferItem{TakeItem = 4176 , Flag = Take},
				  TransferItem{TakeItem = 4234 , Flag = Take},
				  TransferItem{GiveItem = 3782 , Flag = Give},
				  SetGlobalFlagTrue {Name = "P101_PlayerMadeBoneWeapon"},
				  SetGlobalFlagTrue {Name = "P101_MageBoneWeaponsChosen"},
				  SetGlobalFlagTrue {Name = "P101_BoneSetItem1Made"}
				  ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{56;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_029", String = "(Mindestens einer dieser Gegenstände fehlt noch.)"},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 59},
		}}

	OnAnswer{59;
		Conditions = {
			Negated(UND(
								UND(
										IsItemFlagTrue {Name = "PlayerHasItemSecondFragment"},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4235}
								)
						),
		},
		Actions = {
			Say{Tag = "bonealtarP101_034", String = "(Um den Knochenpanzer der Ahnen herzustellen, wird ein Panzerfragment, ein Knochenschnitzermesser  und ein blauer Blutedelstein benötigt.)"},
			Answer{Tag = "", String = "", AnswerId = 69},
		}}

	OnAnswer{59;
		Conditions = {
			UND(
								UND(
										IsItemFlagTrue {Name = "PlayerHasItemSecondFragment"},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4235}
								)
						,
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 60},
		}}

	OnAnswer{60;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "P101_PlayerMadeBoneWeapon"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{60;
		Conditions = {
			IsGlobalFlagFalse {Name = "P101_PlayerMadeBoneWeapon"},
		},
		Actions = {
			Say{Tag = "bonealtarP101_031", String = "(Bedenkt: Wenn Ihr einen Gegenstand aus dem Ahnen-Satz fertigt, werdet Ihr keine Gegenstände aus dem Berserker-Satz mehr herstellen können.)"},
			Answer{Tag = "", String = "", AnswerId = 61},
		}}

	OnAnswer{61;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bonealtarP101_032PC", String = "(Gegenstand herstellen.)", AnswerId = 62},
			OfferAnswer{Tag = "bonealtarP101_033PC", String = "(Gegenstand nicht herstellen.)", AnswerId = 64},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{64;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{66;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 67},
		}}

	OnAnswer{67;
		Conditions = {
		},
		Actions = {
			SetItemFlagFalse {Name = "PlayerHasItemSecondFragment"},
				  TransferItem{TakeItem = 4176 , Flag = Take},
				  TransferItem{TakeItem = 4235 , Flag = Take},
				  TransferItem{GiveItem = 3783 , Flag = Give},
				  SetGlobalFlagTrue {Name = "P101_PlayerMadeBoneWeapon"},
				  SetGlobalFlagTrue {Name = "P101_MageBoneWeaponsChosen"},
				  SetGlobalFlagTrue {Name = "P101_BoneSetItem2Made"}
				  ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 68},
		}}

	OnAnswer{68;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{68;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_034a", String = "(Mindestens einer dieser Gegenstände fehlt noch.)"},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 71},
		}}

	OnAnswer{71;
		Conditions = {
			UND(
								UND(
										PlayerHasItem{ItemId = 4264},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4236}
								)
						,
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 72},
		}}

	OnAnswer{71;
		Conditions = {
			Negated(UND(
								UND(
										PlayerHasItem{ItemId = 4264},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4236}
								)
						),
		},
		Actions = {
			Say{Tag = "bonealtarP101_039", String = "(Um den Knochenstab der Ahnen herzustellen, wird ein langes Knochenfragment, ein Knochenschnitzermesser  und ein violetter Blutedelstein benötigt.)"},
			Answer{Tag = "", String = "", AnswerId = 81},
		}}

	OnAnswer{72;
		Conditions = {
			IsGlobalFlagFalse {Name = "P101_PlayerMadeBoneWeapon"},
		},
		Actions = {
			Say{Tag = "bonealtarP101_036", String = "(Bedenkt: Wenn Ihr einen Gegenstand aus dem Ahnen-Satz fertigt, werdet Ihr keine Gegenstände aus dem Berserker-Satz mehr herstellen können.)"},
			Answer{Tag = "", String = "", AnswerId = 73},
		}}

	OnAnswer{72;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "P101_PlayerMadeBoneWeapon"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 78},
		}}

	OnAnswer{73;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bonealtarP101_037PC", String = "(Gegenstand herstellen.)", AnswerId = 74},
			OfferAnswer{Tag = "bonealtarP101_038PC", String = "(Gegenstand nicht herstellen.)", AnswerId = 76},
		}}

	OnAnswer{74;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 78},
		}}

	OnAnswer{76;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 79},
		}}

	OnAnswer{79;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 4259 , Flag = Take},
				  TransferItem{TakeItem = 4176 , Flag = Take},
				  TransferItem{TakeItem = 4236 , Flag = Take},
				  TransferItem{GiveItem = 3781 , Flag = Give},
				  SetGlobalFlagTrue {Name = "P101_PlayerMadeBoneWeapon"},
				  SetGlobalFlagTrue {Name = "P101_MageBoneWeaponsChosen"},
				  SetGlobalFlagTrue {Name = "P101_BoneSetItem3Made"}
				  ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 80},
		}}

	OnAnswer{80;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{80;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{81;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_040", String = "(Mindestens einer dieser Gegenstände fehlt noch.)"},
		}}

	OnAnswer{81;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{82;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "bonealtarP101_041PC", String = "(Eine Schädelambrust herstellen.)", AnswerId = 83},
			OfferAnswer{Tag = "bonealtarP101_050PC", String = "(Eine Schenkelknochenkeule herstellen.)", AnswerId = 95},
			OfferAnswer{Tag = "bonealtarP101_054PC", String = "(Einen Rippenbogen herstellen.)", AnswerId = 101},
			OfferAnswer{Tag = "bonealtarP101_063PC", String = "(Einen Knochensplitterdolch herstellen.)", AnswerId = 113},
		}}

	OnAnswer{83;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_042", String = "(Die Schädelarmbrust kann in zwei Varianten hergestellt werden: als Feuerspeier und als Frostwerfer.)"},
			Answer{Tag = "", String = "", AnswerId = 84},
		}}

	OnAnswer{84;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_043", String = "(Beide Waffen benötigen zu Verwendung die Fähigkeit Fernkampf - Armbrust 10.)"},
			OfferAnswer{Tag = "bonealtarP101_044PC", String = "(Feuerspeier herstellen.)", AnswerId = 85},
			OfferAnswer{Tag = "bonealtarP101_047PC", String = "Frostwerfer herstellen.", AnswerId = 90},
		}}

	OnAnswer{85;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 86},
		}}

	OnAnswer{86;
		Conditions = {
			Negated(UND(
								UND(
										PlayerHasItem{ItemId = 4260},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4237}
								)
						),
		},
		Actions = {
			Say{Tag = "bonealtarP101_045", String = "(Um Feuerspeier herzustellen, wird ein Echsenschädelfragment, ein Knochenschnitzermesser  und ein brauner Blutedelstein benötigt.)"},
			Answer{Tag = "", String = "", AnswerId = 89},
		}}

	OnAnswer{86;
		Conditions = {
			UND(
								UND(
										PlayerHasItem{ItemId = 4260},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4237}
								)
						,
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 87},
		}}

	OnAnswer{87;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 4260 , Flag = Take},
				  TransferItem{TakeItem = 4176 , Flag = Take},
				  TransferItem{TakeItem = 4237 , Flag = Take},
				  TransferItem{GiveItem = 4272 , Flag = Give}
				  ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 88},
		}}

	OnAnswer{88;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{88;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{89;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_046", String = "(Mindestens einer dieser Gegenstände fehlt noch.)"},
		}}

	OnAnswer{89;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{90;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 91},
		}}

	OnAnswer{91;
		Conditions = {
			Negated(UND(
								UND(
										PlayerHasItem{ItemId = 4260},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4238}
								)
						),
		},
		Actions = {
			Say{Tag = "bonealtarP101_048", String = "(Um Frostwerfer herzustellen, wird ein Echsenschädelfragment, ein Knochenschnitzermesser  und ein grauer Blutedelstein benötigt.)"},
			Answer{Tag = "", String = "", AnswerId = 94},
		}}

	OnAnswer{91;
		Conditions = {
			UND(
								UND(
										PlayerHasItem{ItemId = 4260},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4238}
								)
						,
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 92},
		}}

	OnAnswer{92;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 4260 , Flag = Take},
				  TransferItem{TakeItem = 4176 , Flag = Take},
				  TransferItem{TakeItem = 4238 , Flag = Take},
				  TransferItem{GiveItem = 4273 , Flag = Give}
				  ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 93},
		}}

	OnAnswer{93;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{93;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{94;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_049", String = "(Mindestens einer dieser Gegenstände fehlt noch.)"},
		}}

	OnAnswer{94;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{95;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 96},
		}}

	OnAnswer{96;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_051", String = "(Diese Waffe benötigt zur Verwendung schwere Kriegskunst - Große Schlagwaffen 10.)"},
			Answer{Tag = "", String = "", AnswerId = 97},
		}}

	OnAnswer{97;
		Conditions = {
			Negated(UND(
								UND(
										PlayerHasItem{ItemId = 4261},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4239}
								)
						),
		},
		Actions = {
			Say{Tag = "bonealtarP101_052", String = "(Um die Schenkelknochenkeule herzustellen, wird ein Schenkelknochen, ein Knochenschnitzermesser  und ein schwarzer Blutedelstein benötigt.)"},
			Answer{Tag = "", String = "", AnswerId = 100},
		}}

	OnAnswer{97;
		Conditions = {
			UND(
								UND(
										PlayerHasItem{ItemId = 4261},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4239}
								)
						,
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 98},
		}}

	OnAnswer{98;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 4261 , Flag = Take},
				  TransferItem{TakeItem = 4176 , Flag = Take},
				  TransferItem{TakeItem = 4239 , Flag = Take},
				  TransferItem{GiveItem = 4274 , Flag = Give}
				  ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 99},
		}}

	OnAnswer{99;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{99;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{100;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_053", String = "(Mindestens einer dieser Gegenstände fehlt noch.)"},
		}}

	OnAnswer{100;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{101;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_055", String = "(Der Rippenbogen kann in zwei Varianten hergestellt werden: als giftgrüner Rippenbogen und als feuerroter Rippenbogen.)"},
			Answer{Tag = "", String = "", AnswerId = 102},
		}}

	OnAnswer{102;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_056", String = "(Beide Bögen benötigen zur Verwendung die Fähigkeit Fernkampf - Bogen 10.)"},
			OfferAnswer{Tag = "bonealtarP101_057PC", String = "(Giftgrünen Rippenbogen herstellen.)", AnswerId = 103},
			OfferAnswer{Tag = "bonealtarP101_060PC", String = "(Feuerroten Rippenbogen herstellen.)", AnswerId = 108},
		}}

	OnAnswer{103;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 104},
		}}

	OnAnswer{104;
		Conditions = {
			UND(
								UND(
										PlayerHasItem{ItemId = 4262},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4240}
								)
						,
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 105},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(UND(
								UND(
										PlayerHasItem{ItemId = 4262},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4240}
								)
						),
		},
		Actions = {
			Say{Tag = "bonealtarP101_058", String = "(Um den giftgrünen Rippenbogen herzustellen, wird ein Rippenknochen, ein Knochenschnitzermesser  und ein grüner Blutedelstein benötigt.)"},
			Answer{Tag = "", String = "", AnswerId = 107},
		}}

	OnAnswer{105;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 4262 , Flag = Take},
				  TransferItem{TakeItem = 4176 , Flag = Take},
				  TransferItem{TakeItem = 4240 , Flag = Take},
				  TransferItem{GiveItem = 4275 , Flag = Give}
				  ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 106},
		}}

	OnAnswer{106;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{106;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{107;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_059", String = "(Mindestens einer dieser Gegenstände fehlt noch.)"},
		}}

	OnAnswer{107;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{108;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 109},
		}}

	OnAnswer{109;
		Conditions = {
			UND(
								UND(
										PlayerHasItem{ItemId = 4262},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4241}
								)
						,
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 110},
		}}

	OnAnswer{109;
		Conditions = {
			Negated(UND(
								UND(
										PlayerHasItem{ItemId = 4262},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4241}
								)
						),
		},
		Actions = {
			Say{Tag = "bonealtarP101_061", String = "(Um den feuerroten Rippenbogen herzustellen, wird ein Rippenknochen, ein Knochenschnitzermesser  und ein roter Blutedelstein benötigt.)"},
			Answer{Tag = "", String = "", AnswerId = 112},
		}}

	OnAnswer{110;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 4262 , Flag = Take},
				  TransferItem{TakeItem = 4176 , Flag = Take},
				  TransferItem{TakeItem = 4241 , Flag = Take},
				  TransferItem{GiveItem = 4276 , Flag = Give}
				  ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 111},
		}}

	OnAnswer{111;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{111;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{112;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_062", String = "(Mindestens einer dieser Gegenstände fehlt noch.)"},
		}}

	OnAnswer{112;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{113;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_064", String = "(Der Knochensplitterdolch kann in zwei Varianten hergestellt werden: als arkaner und als astraler Knochensplitterdolch.)"},
			Answer{Tag = "", String = "", AnswerId = 114},
		}}

	OnAnswer{114;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_065", String = "(Der arkane Dolch benötigt zur Verwendung die Fähigkeit Elementarmagie 10 oder Schwarze Magie 10.)"},
			Answer{Tag = "", String = "", AnswerId = 115},
		}}

	OnAnswer{115;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_066", String = "(Der astrale Dolch benötigt zur Verwendung die Fähigkeit Weiße Magie 10 oder Mentalmagie 10.)"},
			OfferAnswer{Tag = "bonealtarP101_067PC", String = "(Den arkanen Knochensplitterdolch herstellen.)", AnswerId = 116},
			OfferAnswer{Tag = "bonealtarP101_070PC", String = "(Den astralen Knochensplitterdolch herstellen.)", AnswerId = 121},
		}}

	OnAnswer{116;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 117},
		}}

	OnAnswer{117;
		Conditions = {
			Negated(UND(
								UND(
										PlayerHasItem{ItemId = 4263},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4242}
								)
						),
		},
		Actions = {
			Say{Tag = "bonealtarP101_068", String = "(Um den arkanen Knochensplitterdolch herzustellen, wird ein Knochensplitter ein Knochenschnitzermesser und ein blaugrüner Blutedelstein benötigt.)"},
			Answer{Tag = "", String = "", AnswerId = 120},
		}}

	OnAnswer{117;
		Conditions = {
			UND(
								UND(
										PlayerHasItem{ItemId = 4263},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4242}
								)
						,
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{118;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 4263 , Flag = Take},
				  TransferItem{TakeItem = 4176 , Flag = Take},
				  TransferItem{TakeItem = 4242 , Flag = Take},
				  TransferItem{GiveItem = 4277 , Flag = Give}
				  ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 119},
		}}

	OnAnswer{119;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{119;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{120;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_069", String = "(Mindestens einer dieser Gegenstände fehlt noch.)"},
		}}

	OnAnswer{120;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{121;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 122},
		}}

	OnAnswer{122;
		Conditions = {
			UND(
								UND(
										PlayerHasItem{ItemId = 4263},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4243}
								)
						,
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 123},
		}}

	OnAnswer{122;
		Conditions = {
			Negated(UND(
								UND(
										PlayerHasItem{ItemId = 4263},
										PlayerHasItem{ItemId = 4176}
									),
								PlayerHasItem{ItemId = 4243}
								)
						),
		},
		Actions = {
			Say{Tag = "bonealtarP101_071", String = "(Um den astralen Knochensplitterdolch herzustellen, wird ein Knochensplitter, ein Knochenschnitzermesser und ein weißer Blutedelstein benötigt.)"},
			Answer{Tag = "", String = "", AnswerId = 125},
		}}

	OnAnswer{123;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 4263 , Flag = Take},
				  TransferItem{TakeItem = 4176 , Flag = Take},
				  TransferItem{TakeItem = 4243 , Flag = Take},
				  TransferItem{GiveItem = 4278 , Flag = Give}
				  ,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 124},
		}}

	OnAnswer{124;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{124;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{125;
		Conditions = {
		},
		Actions = {
			Say{Tag = "bonealtarP101_072", String = "(Mindestens einer dieser Gegenstände fehlt noch.)"},
		}}

	OnAnswer{125;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end