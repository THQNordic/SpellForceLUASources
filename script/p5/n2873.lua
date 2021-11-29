-->INFO: Illirias
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 297, Y = 167, NoSpawnEffect = 1,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "IlliriasSpawns", UpdateInterval = 5},
	},
	Actions =
	{
		-- Goto {X = 297 , Y = 146, NpcId = 2873, Range = 0, WalkMode = Run},		
	},
}



OnToggleEvent
{
OnConditions = {
		Negated(QuestState{QuestId = 358 , State = StateActive})
		}, 
OnActions = {
		RemoveDialog{NpcId = self}
		},
OffConditions = {
				QuestState{QuestId = 358 , State = StateActive}
				}, 
OffActions = {
		EnableDialog{NpcId = self}
			},
}

--initial
OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetDialogType{Type = SideQuest}
		}
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p5\n2873_Illirias.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name ="FlagIlliriasKnown"},
		},
		Actions = {
			Say{Tag = "Illirias001", String = "Hallo! Ich bin Illirias der Heiler!"},
			Answer{Tag = "Illirias001PC", String = "Seid gegrüßt.", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name ="FlagIlliriasKnown"}),
			QuestState{QuestId = 361 , State = StateActive},
			UND(QuestState{QuestId = 364 , State = StateActive}, PlayerHasItem{ItemId = 2902}),
		},
		Actions = {
			Say{Tag = "Illirias010", String = "Ah, Ihr seid es wieder!"},
			OfferAnswer{Tag = "Illirias002PC", String = "Ich brauche einen Zirfartrank!", AnswerId = 2},
			OfferAnswer{Tag = "Illirias007PC", String = "Ist dies Euer Geldbeutel?.", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name ="FlagIlliriasKnown"}),
			QuestState{QuestId = 361 , State = StateActive},
			Negated(UND(QuestState{QuestId = 364 , State = StateActive}, PlayerHasItem{ItemId = 2902})),
		},
		Actions = {
			Say{Tag = "Illirias010", String = "Ah, Ihr seid es wieder!"},
			OfferAnswer{Tag = "Illirias002PC", String = "Ich brauche einen Zirfartrank!", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name ="FlagIlliriasKnown"}),
			Negated(QuestState{QuestId = 361 , State = StateActive}),
			UND(QuestState{QuestId = 364 , State = StateActive}, PlayerHasItem{ItemId = 2902}),
		},
		Actions = {
			Say{Tag = "Illirias010", String = "Ah, Ihr seid es wieder!"},
			OfferAnswer{Tag = "Illirias007PC", String = "Ist dies Euer Geldbeutel?.", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name ="FlagIlliriasKnown"}),
			Negated(QuestState{QuestId = 361 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 364 , State = StateActive}, PlayerHasItem{ItemId = 2902})),
		},
		Actions = {
			Say{Tag = "Illirias010", String = "Ah, Ihr seid es wieder!"},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 361 , State = StateActive},
			UND(QuestState{QuestId = 364 , State = StateActive}, PlayerHasItem{ItemId = 2902}),
		},
		Actions = {
			SetPlayerFlagTrue{Name="FlagIlliriasKnown"},
			Say{Tag = "Illirias002", String = "Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "Illirias002PC", String = "Ich brauche einen Zirfartrank!", AnswerId = 2},
			OfferAnswer{Tag = "Illirias007PC", String = "Ist dies Euer Geldbeutel?.", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 361 , State = StateActive},
			Negated(UND(QuestState{QuestId = 364 , State = StateActive}, PlayerHasItem{ItemId = 2902})),
		},
		Actions = {
			SetPlayerFlagTrue{Name="FlagIlliriasKnown"},
			Say{Tag = "Illirias002", String = "Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "Illirias002PC", String = "Ich brauche einen Zirfartrank!", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 361 , State = StateActive}),
			UND(QuestState{QuestId = 364 , State = StateActive}, PlayerHasItem{ItemId = 2902}),
		},
		Actions = {
			SetPlayerFlagTrue{Name="FlagIlliriasKnown"},
			Say{Tag = "Illirias002", String = "Was kann ich für Euch tun?"},
			OfferAnswer{Tag = "Illirias007PC", String = "Ist dies Euer Geldbeutel?.", AnswerId = 8},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 361 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 364 , State = StateActive}, PlayerHasItem{ItemId = 2902})),
		},
		Actions = {
			SetPlayerFlagTrue{Name="FlagIlliriasKnown"},
			Say{Tag = "Illirias002", String = "Was kann ich für Euch tun?"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Illirias003", String = "Hm, einen Zirfartrank? Ich frage nicht, wofür Ihr den braucht... aber ich kann Euch sagen, das wird nicht billig!"},
			Answer{Tag = "Illirias003PC", String = "Was verlangt Ihr?", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Illirias004", String = "Einem Jedermann hätte ich jetzt viel Geld abgeknöpft! Aber Ihr seht so aus, als ob Ihr etwas viel Wertvollers für mich tun könntet..."},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Illirias005", String = "Hört... seit dem Angriff der Schwarzen Faust treiben sich hier Plünderer herum! Sie haben mich um mein Geld gebracht! Mit blankem Schwert, wohlgemerkt!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Illirias006", String = "Bringt mir meinen Geldbeutel zurück! Und seht zu, dass diese Kerle über die Klinge springen, wenn Ihr versteht, was ich meine...! Niemand bedroht Illirias ungestraft!"},
			Answer{Tag = "Illirias006PC", String = "Wo finde ich diese Plünderer?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 362}, QuestBegin{QuestId = 363}, QuestSolve{QuestId = 361},
			Say{Tag = "Illirias007", String = "Sie zogen in Richtung Südwesten! Schätze mal, sie lungern bei den alten Minen herum!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 361 , State = StateActive},
			UND(QuestState{QuestId = 364 , State = StateActive}, PlayerHasItem{ItemId = 2902}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "Illirias002PC", String = "Ich brauche einen Zirfartrank!", AnswerId = 2},
			OfferAnswer{Tag = "Illirias007PC", String = "Ist dies Euer Geldbeutel?.", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			QuestState{QuestId = 361 , State = StateActive},
			Negated(UND(QuestState{QuestId = 364 , State = StateActive}, PlayerHasItem{ItemId = 2902})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "Illirias002PC", String = "Ich brauche einen Zirfartrank!", AnswerId = 2},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 361 , State = StateActive}),
			UND(QuestState{QuestId = 364 , State = StateActive}, PlayerHasItem{ItemId = 2902}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "Illirias007PC", String = "Ist dies Euer Geldbeutel?.", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(QuestState{QuestId = 361 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 364 , State = StateActive}, PlayerHasItem{ItemId = 2902})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Illirias008", String = "Ah! Ja, ja! Lasst sehen...! Hm, verdammt... nicht mehr viel drin...! Ihr... habt Euch doch wohl keine Belohnung herausgenommen?"},
			Answer{Tag = "Illirias008PC", String = "Wollt Ihr mich des Diebstahls bezichtigen, Illirias? Wenn ich Euer Geld gewollt hätte, dann hätte ich gleich den ganzen Beutel behalten!", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "Illirias009", String = "Hm, schon gut, schon gut... schön... ich habe Euch einen Trank versprochen! Hier, nehmt ihn!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 2900, TakeItem = 2902, Flag = Exchange},
					  QuestBegin{QuestId = 365},
					  QuestSolve{QuestId = 364},
					  QuestSolve{QuestId = 362},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end