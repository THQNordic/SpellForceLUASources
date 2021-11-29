-->INFO: Irfit
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
Conditions =	{
				IsGlobalFlagTrue{Name = "g_P204_IrfitSpawnIrfit"}
				},
Actions = 		{
				SetGlobalFlagTrue{Name = "g_P204_IrfitAlreadyInCove"}
				}
}

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_IrfitTransformed", UpdateInterval = 10},
	},
}

OnToggleEvent
{
	ResetOnDeath = TRUE,
	OnConditions =
	{
		IsGlobalFlagFalse{Name ="g_P204_IrfitKannSprechen"},
	},
	OnActions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11221"}
	},
	OffConditions =
	{
		IsGlobalFlagTrue{Name ="g_P204_IrfitKannSprechen"},
	},
	OffActions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11221"}
	},
}

OnIdleGoHome
{
	WalkMode = Walk, X = 230, Y = 280, Direction = SouthWest,
	Conditions = 
	{
		IsGlobalFlagFalse{Name = "g_P204_IrfitIsPlayerUnit"},
	},
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P205\n11221_Irfit.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagTrue{Name = "known"},
		},
		Actions = {
			Say{Tag = "irfitP205_001", String = "(Der Irfit begrüßt Euch freudig. Er sieht hungrig aus.)"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "known"}),
		},
		Actions = {
			Say{Tag = "irfitP205_002", String = "(Der Irfit drückt seinen kleinen Kopf gegen Eure Hand. Ein seltsames Gefühl durchströmt Euch wie ein warmer Wind.)"},
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
			OfferAnswer{Tag = "irfitP205_005PC", String = "(Dem Irfit einen Ariakristall als Futter geben, dies gibt ihm helle Kraft.)", AnswerId = 6},
			OfferAnswer{Tag = "irfitP205_017PC", String = "(Dem Irfit ein Herz als Futter geben, dies gibt ihm dunkle Kraft.)", AnswerId = 27},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "irfitP205_003", String = "(Der Irfit blickt Euch lange an und Ihr spürt eine Welle der Dankbarkeit druch Euren Geist strömen. Dann stupst er Euch mit seiner Schnauze.)"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "irfitP205_004", String = "(Er scheint Hunger zu haben.)"},
			OfferAnswer{Tag = "irfitP205_005PC", String = "(Dem Irfit einen Ariakristall als Futter geben, dies gibt ihm helle Kraft.)", AnswerId = 6},
			OfferAnswer{Tag = "irfitP205_017PC", String = "(Dem Irfit ein Herz als Futter geben, dies gibt ihm dunkle Kraft.)", AnswerId = 27},
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
			Negated(Negated(PlayerHasItem {ItemId = 3458 })),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 3458 }),
		},
		Actions = {
			Say{Tag = "irfitP205_006", String = "(Ihr habt keinen Ariakristall! Sucht nach ihnen in den Landen Xus.)"},
			Answer{Tag = "", String = "", AnswerId = 8},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "irfitP205_005PC", String = "(Dem Irfit einen Ariakristall als Futter geben, dies gibt ihm helle Kraft.)", AnswerId = 6},
			OfferAnswer{Tag = "irfitP205_017PC", String = "(Dem Irfit ein Herz als Futter geben, dies gibt ihm dunkle Kraft.)", AnswerId = 27},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(Negated(PlayerHasItem {ItemId = 7338 })),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7338 }),
		},
		Actions = {
			Say{Tag = "irfitP205_007", String = "(Ihr habt zwar einen Ariakristall, aber keinen Mörser um ihn zu zerkleinern! So kann der Irfit den Kristall nicht verzehren!)"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "irfitP205_008", String = "(Ihr errinnert Euch, dass die Händler Empyrias solche Mörser verkaufen.)"},
			Answer{Tag = "", String = "", AnswerId = 13},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "irfitP205_005PC", String = "(Dem Irfit einen Ariakristall als Futter geben, dies gibt ihm helle Kraft.)", AnswerId = 6},
			OfferAnswer{Tag = "irfitP205_017PC", String = "(Dem Irfit ein Herz als Futter geben, dies gibt ihm dunkle Kraft.)", AnswerId = 27},
		}}

	OnAnswer{15;
		Conditions = {
			IsGlobalCounter{Name = "IrfitAriaCrystalsGiven", Value = 2 , Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "irfitP205_009", String = "(Bedenkt: Ihr seid im Begriff, dem Irfit seinen dritten Ariakristall zu füttern!)"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsGlobalCounter{Name = "IrfitAriaCrystalsGiven", Value = 2 , Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "irfitP205_012", String = "(Ihr zermalmt den Kristall und der Irfit schlingt den Ariastaub eilig hinunter, wobei er den Mörser zerstört.)"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "irfitP205_010", String = "(Wenn ihr dies tut, wird der Irfit sich in seine helle Form verwandeln! Wollt Ihr das wirklich?)"},
			OfferAnswer{Tag = "irfitP205_011PC", String = "(Ja, dem Irfit den letzen Kristall füttern.)", AnswerId = 17},
			OfferAnswer{Tag = "irfitP205_014PC", String = "(Nein, dem Irfit den Kristall nicht geben.)", AnswerId = 20},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "irfitP205_012", String = "(Ihr zermalmt den Kristall und der Irfit schlingt den Ariastaub eilig hinunter, wobei er den Mörser zerstört.)"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "irfitP205_013", String = "(Dann erstrahlt er plötzlich in gleissendem Licht! Der Irfit beginnt sich in seine helle Form zu verwandeln!)"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			--ChangeUnit{ Unit = 2705, NpcId = self},
							 TransferItem {TakeItem = 3458, Flag = Take},
							 TransferItem {TakeItem = 7338, Flag = Take},
							 SetGlobalFlagFalse{Name ="g_P204_IrfitKannSprechen"},
							 QuestSolve{QuestId = 1046},
							 QuestBegin{QuestId = 1080},
							 SetGlobalFlagTrue{Name = "g_P204_IrfitTransformed"},
							 SetGlobalFlagTrue{Name = "g_P204_IrfitIsGood"},
			Say{Tag = "", String = ""},
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
			Say{Tag = "irfitP205_015", String = "(Traurig blickt der Irfit dem Kristall hinterher, als Ihr ihn wieder einsteckt.)"},
			Answer{Tag = "", String = "", AnswerId = 21},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "irfitP205_005PC", String = "(Dem Irfit einen Ariakristall als Futter geben, dies gibt ihm helle Kraft.)", AnswerId = 6},
			OfferAnswer{Tag = "irfitP205_017PC", String = "(Dem Irfit ein Herz als Futter geben, dies gibt ihm dunkle Kraft.)", AnswerId = 27},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			IncreaseGlobalCounter{Name = "IrfitAriaCrystalsGiven"},
								TransferItem {TakeItem = 3458, Flag = Take},
								TransferItem {TakeItem = 7338, Flag = Take},
			Say{Tag = "irfitP205_016", String = "(Als Dank stupst der Irfit Euch wieder gegen die Hand. Er scheint aber immer noch hungrig zu sein.)"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "irfitP205_005PC", String = "(Dem Irfit einen Ariakristall als Futter geben, dies gibt ihm helle Kraft.)", AnswerId = 6},
			OfferAnswer{Tag = "irfitP205_017PC", String = "(Dem Irfit ein Herz als Futter geben, dies gibt ihm dunkle Kraft.)", AnswerId = 27},
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
			Negated(Negated(PlayerHasItem {ItemId = 7340})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{28;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7340}),
		},
		Actions = {
			Say{Tag = "irfitP205_018", String = "(Ihr habt kein Herz, das Ihr verfüttern könnt! Durchsucht Eure erschlagenen Feinde nach ihren Herzen.)"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "irfitP205_005PC", String = "(Dem Irfit einen Ariakristall als Futter geben, dies gibt ihm helle Kraft.)", AnswerId = 6},
			OfferAnswer{Tag = "irfitP205_017PC", String = "(Dem Irfit ein Herz als Futter geben, dies gibt ihm dunkle Kraft.)", AnswerId = 27},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(Negated(PlayerHasItem {ItemId = 7338 })),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(PlayerHasItem {ItemId = 7338 }),
		},
		Actions = {
			Say{Tag = "irfitP205_019", String = "(Ihr habt zwar ein Herz, aber keinen Mörser um es zu zerkleinern! So kann der Irfit das Herz nicht verzehren!)"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "irfitP205_020", String = "(Ihr erinnert Euch, dass die Händler Empyrias solche Mörser verkaufen.)"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "irfitP205_005PC", String = "(Dem Irfit einen Ariakristall als Futter geben, dies gibt ihm helle Kraft.)", AnswerId = 6},
			OfferAnswer{Tag = "irfitP205_017PC", String = "(Dem Irfit ein Herz als Futter geben, dies gibt ihm dunkle Kraft.)", AnswerId = 27},
		}}

	OnAnswer{36;
		Conditions = {
			IsGlobalCounter{Name = "IrfitHeartsGiven", Value = 2 , Operator = IsGreaterOrEqual},
		},
		Actions = {
			Say{Tag = "irfitP205_021", String = "(Bedenkt: Ihr seid im Begriff, dem Irfit sein dritten Herz zu füttern!)"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(IsGlobalCounter{Name = "IrfitHeartsGiven", Value = 2 , Operator = IsGreaterOrEqual}),
		},
		Actions = {
			Say{Tag = "irfitP205_024", String = "(Ihr zermalmt das Herz im Mörser und der Irfit schlingt es knurrend hinunter, wobei er den Mörser zerstört.)"},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{37;
		Conditions = {
		},
		Actions = {
			Say{Tag = "irfitP205_022", String = "(Wenn ihr dies tut, wird der Irfit sich in seine dunkle Form verwandeln! Wollt Ihr das wirklich?)"},
			OfferAnswer{Tag = "irfitP205_023PC", String = "(Ja, dem Irfit das letzte Herz füttern.)", AnswerId = 38},
			OfferAnswer{Tag = "irfitP205_026PC", String = "(Nein, dem Irfit das Herz nicht geben.)", AnswerId = 41},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "irfitP205_024", String = "(Ihr zermalmt das Herz im Mörser und der Irfit schlingt es knurrend hinunter, wobei er den Mörser zerstört.)"},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "irfitP205_025", String = "(Dann beginnt er zu fauchen! Sein Körper pulsiert und verformt sich! Der Irfit beginnt sich in seine dunkle Form zu verwandeln!)"},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			--ChangeUnit{ Unit = 2706, NpcId = self},
							TransferItem {TakeItem = 7340, Flag = Take},
							TransferItem {TakeItem = 7338, Flag = Take},
							SetGlobalFlagFalse{Name ="g_P204_IrfitKannSprechen"},
							QuestSolve{QuestId = 1046},
							 QuestBegin{QuestId = 1080},
							SetGlobalFlagTrue{Name = "g_P204_IrfitTransformed"},
							SetGlobalFlagTrue{Name = "g_P204_IrfitIsEvil"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "irfitP205_027", String = "(Gierig blickt der Irfit dem Herz nach, als Ihr es wieder einsteckt.)"},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "irfitP205_005PC", String = "(Dem Irfit einen Ariakristall als Futter geben, dies gibt ihm helle Kraft.)", AnswerId = 6},
			OfferAnswer{Tag = "irfitP205_017PC", String = "(Dem Irfit ein Herz als Futter geben, dies gibt ihm dunkle Kraft.)", AnswerId = 27},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			IncreaseGlobalCounter{Name = "IrfitHeartsGiven"},
								TransferItem {TakeItem = 7340, Flag = Take},
								TransferItem {TakeItem = 7338, Flag = Take},
			Say{Tag = "irfitP205_028", String = "(Als Dank gibt der Irfit ein wohliges Knurren von sich. Er scheint aber immer noch hungrig zu sein.)"},
			Answer{Tag = "", String = "", AnswerId = 46},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "irfitP205_005PC", String = "(Dem Irfit einen Ariakristall als Futter geben, dies gibt ihm helle Kraft.)", AnswerId = 6},
			OfferAnswer{Tag = "irfitP205_017PC", String = "(Dem Irfit ein Herz als Futter geben, dies gibt ihm dunkle Kraft.)", AnswerId = 27},
		}}


	EndDefinition()
end