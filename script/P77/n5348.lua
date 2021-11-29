-->INFO: Wishmaster
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\P77\n5348_Wishmaster.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(AvatarIsLevel{Level = 22}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
			AvatarIsLevel{Level = 22},
		},
		Actions = {
			Say{Tag = "", String = "Du bist mindestens Level 22"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{2;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(AvatarIsLevel{Level = 21}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{3;
		Conditions = {
			AvatarIsLevel{Level = 21},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 21"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 940000, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{5;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(AvatarIsLevel{Level = 20}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{6;
		Conditions = {
			AvatarIsLevel{Level = 20},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 20"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 620000, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{8;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(AvatarIsLevel{Level = 19}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{9;
		Conditions = {
			AvatarIsLevel{Level = 19},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 19"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 460000, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{11;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(AvatarIsLevel{Level = 18}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{12;
		Conditions = {
			AvatarIsLevel{Level = 18},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 18"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 360000, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{14;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(AvatarIsLevel{Level = 17}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{15;
		Conditions = {
			AvatarIsLevel{Level = 17},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 17"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 260000, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{17;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{18;
		Conditions = {
			AvatarIsLevel{Level = 16},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 16"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(AvatarIsLevel{Level = 16}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 180000, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{20;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{21;
		Conditions = {
			Negated(AvatarIsLevel{Level = 15}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{21;
		Conditions = {
			AvatarIsLevel{Level = 15},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 15"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 130000, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{23;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(AvatarIsLevel{Level = 14}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{24;
		Conditions = {
			AvatarIsLevel{Level = 14},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 14"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 98000, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{26;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{26;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{27;
		Conditions = {
			AvatarIsLevel{Level = 13},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 13"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(AvatarIsLevel{Level = 13}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 78000, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{29;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(AvatarIsLevel{Level = 12}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{30;
		Conditions = {
			AvatarIsLevel{Level = 12},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 12"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 55800, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{32;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{33;
		Conditions = {
			AvatarIsLevel{Level = 11},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 11"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{33;
		Conditions = {
			Negated(AvatarIsLevel{Level = 11}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 45000, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{35;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(AvatarIsLevel{Level = 10}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{36;
		Conditions = {
			AvatarIsLevel{Level = 10},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 10"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 33000, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{38;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{38;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{38;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{38;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(AvatarIsLevel{Level = 9}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{39;
		Conditions = {
			AvatarIsLevel{Level = 9},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 9"},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 22000, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{41;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{42;
		Conditions = {
			Negated(AvatarIsLevel{Level = 8}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{42;
		Conditions = {
			AvatarIsLevel{Level = 8},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 8"},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 15000, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{44;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{45;
		Conditions = {
			Negated(AvatarIsLevel{Level = 7}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{45;
		Conditions = {
			AvatarIsLevel{Level = 7},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 8"},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 15000, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 47},
		}}

	OnAnswer{47;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{47;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{47;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(AvatarIsLevel{Level = 6}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{48;
		Conditions = {
			AvatarIsLevel{Level = 6},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 6"},
			Answer{Tag = "", String = "", AnswerId = 49},
		}}

	OnAnswer{49;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 5000, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{50;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{50;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{50;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 54},
		}}

	OnAnswer{51;
		Conditions = {
			AvatarIsLevel{Level = 5},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 5"},
			Answer{Tag = "", String = "", AnswerId = 52},
		}}

	OnAnswer{52;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 2500, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{53;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{53;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{53;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{53;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{54;
		Conditions = {
			Negated(AvatarIsLevel{Level = 4}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{54;
		Conditions = {
			AvatarIsLevel{Level = 4},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 4"},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 1200, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 56},
		}}

	OnAnswer{56;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{56;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{56;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{56;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{57;
		Conditions = {
			Negated(AvatarIsLevel{Level = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 60},
		}}

	OnAnswer{57;
		Conditions = {
			AvatarIsLevel{Level = 3},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 3"},
			Answer{Tag = "", String = "", AnswerId = 58},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 700, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 59},
		}}

	OnAnswer{59;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{59;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{59;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{59;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{60;
		Conditions = {
			Negated(AvatarIsLevel{Level = 2}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 63},
		}}

	OnAnswer{60;
		Conditions = {
			AvatarIsLevel{Level = 2},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 2"},
			Answer{Tag = "", String = "", AnswerId = 61},
		}}

	OnAnswer{61;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 300, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 62},
		}}

	OnAnswer{62;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{62;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{62;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{62;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{63;
		Conditions = {
			AvatarIsLevel{Level = 1},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe dir Geld für Level 1"},
			Answer{Tag = "", String = "", AnswerId = 64},
		}}

	OnAnswer{63;
		Conditions = {
			Negated(AvatarIsLevel{Level = 1}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 66},
		}}

	OnAnswer{64;
		Conditions = {
		},
		Actions = {
			TransferMoney {Copper = 150, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{65;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{65;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{65;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{65;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{67;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = "Hier sind 1000 Anteile jeder Resource. Aber Achtung erst an einem Monument sind diese sichtbar"},
			Answer{Tag = "", String = "", AnswerId = 68},
		}}

	OnAnswer{68;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferResource {Resource = GoodBoard, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodStone, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodIron, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodFood, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodManaElixir, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodManaHerb, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodMithril, Amount = 1000, Flag = Give, Side = SideLight},
			
			TransferResource {Resource = GoodBoard, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodStone, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodIron, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodFood, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodManaElixir, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodManaHerb, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodMithril, Amount = 1000, Flag = Give, Side = SideDark},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{68;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferResource {Resource = GoodBoard, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodStone, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodIron, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodFood, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodManaElixir, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodManaHerb, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodMithril, Amount = 1000, Flag = Give, Side = SideLight},
			
			TransferResource {Resource = GoodBoard, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodStone, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodIron, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodFood, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodManaElixir, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodManaHerb, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodMithril, Amount = 1000, Flag = Give, Side = SideDark},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferResource {Resource = GoodBoard, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodStone, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodIron, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodFood, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodManaElixir, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodManaHerb, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodMithril, Amount = 1000, Flag = Give, Side = SideLight},
			
			TransferResource {Resource = GoodBoard, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodStone, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodIron, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodFood, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodManaElixir, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodManaHerb, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodMithril, Amount = 1000, Flag = Give, Side = SideDark},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferResource {Resource = GoodBoard, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodStone, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodIron, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodFood, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodManaElixir, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodManaHerb, Amount = 1000, Flag = Give, Side = SideLight},
			TransferResource {Resource = GoodMithril, Amount = 1000, Flag = Give, Side = SideLight},
			
			TransferResource {Resource = GoodBoard, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodStone, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodIron, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodFood, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodManaElixir, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodManaHerb, Amount = 1000, Flag = Give, Side = SideDark},
			TransferResource {Resource = GoodMithril, Amount = 1000, Flag = Give, Side = SideDark},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = "Ich folge dir"},
			Answer{Tag = "", String = "", AnswerId = 70},
		}}

	OnAnswer{70;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "FollowModeOn"},
			Follow{Target = 0 },
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 71},
		}}

	OnAnswer{71;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{71;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{71;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{71;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = "Ich bleibe hier"},
			Answer{Tag = "", String = "", AnswerId = 73},
		}}

	OnAnswer{73;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse{Name = "FollowModeOn"},
			StopFollow {Target = 0},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 74},
		}}

	OnAnswer{74;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{74;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{74;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{74;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{75;
		Conditions = {
			AvatarIsLevel{Level = 22},
		},
		Actions = {
			Say{Tag = "", String = "Du bist mindestens Level 22"},
			Answer{Tag = "", String = "", AnswerId = 76},
		}}

	OnAnswer{75;
		Conditions = {
			Negated(AvatarIsLevel{Level = 22}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 77},
		}}

	OnAnswer{76;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{76;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{76;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{76;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{77;
		Conditions = {
			Negated(AvatarIsLevel{Level = 21}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 79},
		}}

	OnAnswer{77;
		Conditions = {
			AvatarIsLevel{Level = 21},
		},
		Actions = {
			Say{Tag = "", String = "Ich gebe Dir Level22"},
			Answer{Tag = "", String = "", AnswerId = 78},
		}}

	OnAnswer{78;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 15000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{78;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 15000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{78;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 15000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{78;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 15000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{79;
		Conditions = {
			Negated(AvatarIsLevel{Level = 20}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 81},
		}}

	OnAnswer{79;
		Conditions = {
			AvatarIsLevel{Level = 20},
		},
		Actions = {
			Say{Tag = "", String = "Ich geb Dir Level 21"},
			Answer{Tag = "", String = "", AnswerId = 80},
		}}

	OnAnswer{80;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 14000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{80;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 14000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{80;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 14000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{80;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 14000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{81;
		Conditions = {
			Negated(AvatarIsLevel{Level = 19}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 83},
		}}

	OnAnswer{81;
		Conditions = {
			AvatarIsLevel{Level = 19},
		},
		Actions = {
			Say{Tag = "", String = "Ich geb Dir Level 20"},
			Answer{Tag = "", String = "", AnswerId = 82},
		}}

	OnAnswer{82;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 13000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{82;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 13000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{82;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 13000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{82;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 13000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{83;
		Conditions = {
			Negated(AvatarIsLevel{Level = 18}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 85},
		}}

	OnAnswer{83;
		Conditions = {
			AvatarIsLevel{Level = 18},
		},
		Actions = {
			Say{Tag = "", String = "Ich geb Dir Level 19"},
			Answer{Tag = "", String = "", AnswerId = 84},
		}}

	OnAnswer{84;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 12000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{84;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 12000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{84;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 12000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{84;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 12000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{85;
		Conditions = {
			Negated(AvatarIsLevel{Level = 17}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 87},
		}}

	OnAnswer{85;
		Conditions = {
			AvatarIsLevel{Level = 17},
		},
		Actions = {
			Say{Tag = "", String = "Ich geb Dir Level 18"},
			Answer{Tag = "", String = "", AnswerId = 86},
		}}

	OnAnswer{86;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 11000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{86;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 11000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{86;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 11000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{86;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 11000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{87;
		Conditions = {
			AvatarIsLevel{Level = 16},
		},
		Actions = {
			Say{Tag = "", String = "Ich geb Dir Level 17"},
			Answer{Tag = "", String = "", AnswerId = 88},
		}}

	OnAnswer{87;
		Conditions = {
			Negated(AvatarIsLevel{Level = 16}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 89},
		}}

	OnAnswer{88;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 10000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{88;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 10000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{88;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 10000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{88;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 10000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{89;
		Conditions = {
			Negated(AvatarIsLevel{Level = 15}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 91},
		}}

	OnAnswer{89;
		Conditions = {
			AvatarIsLevel{Level = 15},
		},
		Actions = {
			Say{Tag = "", String = "Ich geb Dir Level 16"},
			Answer{Tag = "", String = "", AnswerId = 90},
		}}

	OnAnswer{90;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 9000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{90;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 9000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{90;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 9000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{90;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 9000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{91;
		Conditions = {
			AvatarIsLevel{Level = 14},
		},
		Actions = {
			Say{Tag = "", String = "Ich geb Dir Level 15"},
			Answer{Tag = "", String = "", AnswerId = 92},
		}}

	OnAnswer{91;
		Conditions = {
			Negated(AvatarIsLevel{Level = 14}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 93},
		}}

	OnAnswer{92;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 8000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{92;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 8000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 8000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{92;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 8000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{93;
		Conditions = {
			AvatarIsLevel{Level = 13},
		},
		Actions = {
			Say{Tag = "", String = "Ich geb Dir Level 14"},
			Answer{Tag = "", String = "", AnswerId = 94},
		}}

	OnAnswer{93;
		Conditions = {
			Negated(AvatarIsLevel{Level = 13}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 95},
		}}

	OnAnswer{94;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 7000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{94;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 7000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{94;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 7000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{94;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 7000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{95;
		Conditions = {
			AvatarIsLevel{Level = 12},
		},
		Actions = {
			Say{Tag = "", String = "Ich geb Dir Level 13"},
			Answer{Tag = "", String = "", AnswerId = 96},
		}}

	OnAnswer{95;
		Conditions = {
			Negated(AvatarIsLevel{Level = 12}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 97},
		}}

	OnAnswer{96;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 6000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{96;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 6000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{96;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 6000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{96;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 6000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{97;
		Conditions = {
			Negated(AvatarIsLevel{Level = 11}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 99},
		}}

	OnAnswer{97;
		Conditions = {
			AvatarIsLevel{Level = 11},
		},
		Actions = {
			Say{Tag = "", String = "Ich geb Dir Level 12"},
			Answer{Tag = "", String = "", AnswerId = 98},
		}}

	OnAnswer{98;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 5000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{98;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 5000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{98;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 5000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{98;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 5000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{99;
		Conditions = {
			AvatarIsLevel{Level = 10},
		},
		Actions = {
			Say{Tag = "", String = "Ich geb Dir Level 11"},
			Answer{Tag = "", String = "", AnswerId = 100},
		}}

	OnAnswer{99;
		Conditions = {
			Negated(AvatarIsLevel{Level = 10}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 101},
		}}

	OnAnswer{100;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 4000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{100;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 4000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{100;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 4000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{100;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 4000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{101;
		Conditions = {
			AvatarIsLevel{Level = 9},
		},
		Actions = {
			Say{Tag = "", String = "Ich geb Dir Level 10"},
			Answer{Tag = "", String = "", AnswerId = 102},
		}}

	OnAnswer{101;
		Conditions = {
			Negated(AvatarIsLevel{Level = 9}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 103},
		}}

	OnAnswer{102;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 3000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{102;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 3000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{102;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 3000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{102;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 3000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{103;
		Conditions = {
			AvatarIsLevel{Level = 8},
		},
		Actions = {
			Say{Tag = "", String = "Ich geb Dir Level 9"},
			Answer{Tag = "", String = "", AnswerId = 104},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(AvatarIsLevel{Level = 8}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 105},
		}}

	OnAnswer{104;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 2000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{104;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 2000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 2000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{104;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 2000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{105;
		Conditions = {
			AvatarIsLevel{Level = 7},
		},
		Actions = {
			Say{Tag = "", String = "Ich geb Dir Level 8"},
			Answer{Tag = "", String = "", AnswerId = 106},
		}}

	OnAnswer{105;
		Conditions = {
			Negated(AvatarIsLevel{Level = 7}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 107},
		}}

	OnAnswer{106;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 1520, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{106;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 1520, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{106;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 1520, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{106;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 1520, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{107;
		Conditions = {
			AvatarIsLevel{Level = 6},
		},
		Actions = {
			Say{Tag = "", String = "Ich geb Dir Level 7"},
			Answer{Tag = "", String = "", AnswerId = 108},
		}}

	OnAnswer{107;
		Conditions = {
			Negated(AvatarIsLevel{Level = 6}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 109},
		}}

	OnAnswer{108;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 1000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{108;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 1000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{108;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 1000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{108;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 1000, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{109;
		Conditions = {
			AvatarIsLevel{Level = 5},
		},
		Actions = {
			Say{Tag = "", String = "Ich geb Dir Level 6"},
			Answer{Tag = "", String = "", AnswerId = 110},
		}}

	OnAnswer{109;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 111},
		}}

	OnAnswer{110;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 750, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{110;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 750, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{110;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 750, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{110;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 750, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{111;
		Conditions = {
			Negated(AvatarIsLevel{Level = 4}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 113},
		}}

	OnAnswer{111;
		Conditions = {
			AvatarIsLevel{Level = 4},
		},
		Actions = {
			Say{Tag = "", String = "Ich geb Dir Level 5"},
			Answer{Tag = "", String = "", AnswerId = 112},
		}}

	OnAnswer{112;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 410, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{112;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 410, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{112;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 410, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{112;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 410, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{113;
		Conditions = {
			AvatarIsLevel{Level = 3},
		},
		Actions = {
			Say{Tag = "", String = "Ich geb Dir Level 4"},
			Answer{Tag = "", String = "", AnswerId = 114},
		}}

	OnAnswer{113;
		Conditions = {
			Negated(AvatarIsLevel{Level = 3}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 115},
		}}

	OnAnswer{114;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 240, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{114;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 240, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{114;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 240, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{114;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 240, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{115;
		Conditions = {
			Negated(AvatarIsLevel{Level = 2}),
		},
		Actions = {
			Say{Tag = "", String = "Du bist  Level 1"},
			Answer{Tag = "", String = "", AnswerId = 117},
		}}

	OnAnswer{115;
		Conditions = {
			AvatarIsLevel{Level = 2},
		},
		Actions = {
			Say{Tag = "", String = "Ich geb Dir Level 3"},
			Answer{Tag = "", String = "", AnswerId = 116},
		}}

	OnAnswer{116;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 140, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{116;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 140, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{116;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 140, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{116;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 140, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{117;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 30, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{117;
		Conditions = {
			IsGlobalFlagFalse{Name = "FollowModeOn"},
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 30, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Folge mir", AnswerId = 69},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{117;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			IsGlobalFlagTrue{Name = "FollowModeOn"},
		},
		Actions = {
			TransferXP {XP = 30, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "Bleib stehen", AnswerId = 72},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}

	OnAnswer{117;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "FollowModeOn"}),
			Negated(IsGlobalFlagTrue{Name = "FollowModeOn"}),
		},
		Actions = {
			TransferXP {XP = 30, Flag = Give},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "", String = "Es wird dem Level entsprechend eine ausreichende Menge Geld vergeben", AnswerId = 1},
			OfferAnswer{Tag = "", String = "Gib Mir Resourcen", AnswerId = 67},
			OfferAnswer{Tag = "", String = "XP es werden direkt genug XP für Leveln vergeben", AnswerId = 75},
		}}


	EndDefinition()
end