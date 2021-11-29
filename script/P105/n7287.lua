-->INFO: FlinkZelle
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 20,
	X = 257,
	Y = 228,		-- exact position of portal object!
	Type = PalisadenTor,		-- type of portal
	OpenConditions = 
	{ 
		--PlayerUnitInRange{ X = 257, Y = 226, Range = 3 , FigureType = FigureAvatar , UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "SQP105_FlinksZelleOeffnen"},
	},
	OpenActions = 
	{ 
		--SetGlobalFlagTrue{ Name = "SQP105_FlinksZelleOeffnen"},
	},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	StayOpen = TRUE,
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P105\n7287_FlinkZelle.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "Known"},
		},
		Actions = {
			Say{Tag = "flinkZelle105_001", String = "Hallo! Ihr dort! Holt mich hier raus! Hilfe!"},
			Answer{Tag = "flinkZelle105_002PC", String = "Ihr werdet wohl kaum ohne Grund dort sein.", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(QuestState{QuestId = 701, State = StateSolved}, 
				   Negated(QuestState{QuestId = 702, State = StateSolved})),
			UND(QuestState{QuestId = 702, State = StateSolved},
				 IsNpcFlagFalse{Name = "SeitenErzaehltP105"}),
			QuestState{QuestId = 707, State = StateSolved},
		},
		Actions = {
			Say{Tag = "flinkZelle105_013", String = "Ah, Ihr seid es wieder!"},
			OfferAnswer{Tag = "flinkZelle105_014PC", String = "Ich habe das Buch.", AnswerId = 8},
			OfferAnswer{Tag = "flinkZelle105_016PC", String = "Ihr habt mehrere Seiten aus dem Buch herausgerissen!", AnswerId = 10},
			OfferAnswer{Tag = "flinkZelle105_020PC", String = "Ich habe den Schlüssel.", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(QuestState{QuestId = 701, State = StateSolved}, 
				   Negated(QuestState{QuestId = 702, State = StateSolved})),
			UND(QuestState{QuestId = 702, State = StateSolved},
				 IsNpcFlagFalse{Name = "SeitenErzaehltP105"}),
			Negated(QuestState{QuestId = 707, State = StateSolved}),
		},
		Actions = {
			Say{Tag = "flinkZelle105_013", String = "Ah, Ihr seid es wieder!"},
			OfferAnswer{Tag = "flinkZelle105_014PC", String = "Ich habe das Buch.", AnswerId = 8},
			OfferAnswer{Tag = "flinkZelle105_016PC", String = "Ihr habt mehrere Seiten aus dem Buch herausgerissen!", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(QuestState{QuestId = 701, State = StateSolved}, 
				   Negated(QuestState{QuestId = 702, State = StateSolved})),
			Negated(UND(QuestState{QuestId = 702, State = StateSolved},
				 IsNpcFlagFalse{Name = "SeitenErzaehltP105"})),
			QuestState{QuestId = 707, State = StateSolved},
		},
		Actions = {
			Say{Tag = "flinkZelle105_013", String = "Ah, Ihr seid es wieder!"},
			OfferAnswer{Tag = "flinkZelle105_014PC", String = "Ich habe das Buch.", AnswerId = 8},
			OfferAnswer{Tag = "flinkZelle105_020PC", String = "Ich habe den Schlüssel.", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			UND(QuestState{QuestId = 701, State = StateSolved}, 
				   Negated(QuestState{QuestId = 702, State = StateSolved})),
			Negated(UND(QuestState{QuestId = 702, State = StateSolved},
				 IsNpcFlagFalse{Name = "SeitenErzaehltP105"})),
			Negated(QuestState{QuestId = 707, State = StateSolved}),
		},
		Actions = {
			Say{Tag = "flinkZelle105_013", String = "Ah, Ihr seid es wieder!"},
			OfferAnswer{Tag = "flinkZelle105_014PC", String = "Ich habe das Buch.", AnswerId = 8},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(QuestState{QuestId = 701, State = StateSolved}, 
				   Negated(QuestState{QuestId = 702, State = StateSolved}))),
			UND(QuestState{QuestId = 702, State = StateSolved},
				 IsNpcFlagFalse{Name = "SeitenErzaehltP105"}),
			QuestState{QuestId = 707, State = StateSolved},
		},
		Actions = {
			Say{Tag = "flinkZelle105_013", String = "Ah, Ihr seid es wieder!"},
			OfferAnswer{Tag = "flinkZelle105_016PC", String = "Ihr habt mehrere Seiten aus dem Buch herausgerissen!", AnswerId = 10},
			OfferAnswer{Tag = "flinkZelle105_020PC", String = "Ich habe den Schlüssel.", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(QuestState{QuestId = 701, State = StateSolved}, 
				   Negated(QuestState{QuestId = 702, State = StateSolved}))),
			UND(QuestState{QuestId = 702, State = StateSolved},
				 IsNpcFlagFalse{Name = "SeitenErzaehltP105"}),
			Negated(QuestState{QuestId = 707, State = StateSolved}),
		},
		Actions = {
			Say{Tag = "flinkZelle105_013", String = "Ah, Ihr seid es wieder!"},
			OfferAnswer{Tag = "flinkZelle105_016PC", String = "Ihr habt mehrere Seiten aus dem Buch herausgerissen!", AnswerId = 10},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(QuestState{QuestId = 701, State = StateSolved}, 
				   Negated(QuestState{QuestId = 702, State = StateSolved}))),
			Negated(UND(QuestState{QuestId = 702, State = StateSolved},
				 IsNpcFlagFalse{Name = "SeitenErzaehltP105"})),
			QuestState{QuestId = 707, State = StateSolved},
		},
		Actions = {
			Say{Tag = "flinkZelle105_013", String = "Ah, Ihr seid es wieder!"},
			OfferAnswer{Tag = "flinkZelle105_020PC", String = "Ich habe den Schlüssel.", AnswerId = 13},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(UND(QuestState{QuestId = 701, State = StateSolved}, 
				   Negated(QuestState{QuestId = 702, State = StateSolved}))),
			Negated(UND(QuestState{QuestId = 702, State = StateSolved},
				 IsNpcFlagFalse{Name = "SeitenErzaehltP105"})),
			Negated(QuestState{QuestId = 707, State = StateSolved}),
		},
		Actions = {
			Say{Tag = "flinkZelle105_013", String = "Ah, Ihr seid es wieder!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkZelle105_003", String = "Ach, dieser Darius ist  furchtbar kleinlich! Einen Mann wegen eines Buches einzusperren! Gebt mir doch einmal kurz Eure Waffe, ja?"},
			Answer{Tag = "flinkZelle105_004PC", String = "Ihr habt Darius ein Buch gestohlen?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkZelle105_005", String = "Nein! Nun, ich habe es ausgeliehen, um etwas nachzuschlagen ..."},
			Answer{Tag = "flinkZelle105_006PC", String = "Ihr seid ein Dieb.", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkZelle105_007", String = "Nein! Ich würde nie etwas stehlen! Ich habe es nur ..."},
			Answer{Tag = "flinkZelle105_008PC", String = "Ihr seid ein Dieb und ein Lügner.", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkZelle105_009", String = "Also gut, also gut, hört zu ..."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkZelle105_010", String = "Ich habe das Buch verloren. Wenn Ihr es für mich suchen und Darius zurückbringen könntet, würde mich der alte Kauz bestimmt wieder freilassen!"},
			Answer{Tag = "flinkZelle105_011PC", String = "Wo soll es denn sein?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkZelle105_012", String = "Hmm, ich glaube irgendwo in der Nähe eines verfallenen Tempels hier in Tirganach. Genau weiß ich es nicht mehr, Richtung Westen vielleicht."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 698},
			     QuestBegin{QuestId = 700},
			     QuestBegin{QuestId = 701},
			     SetNpcFlagTrue{Name="Known"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkZelle105_015", String = "Bringt es Darius! Er hat den Schlüssel. Die Elfen befassen sich mit so etwas nicht! Bringt es ihm!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkZelle105_017", String = "Die hatte ich ja ganz vergessen! Ich bin weitergelaufen nach Frostfall, bevor sie mich fangen konnten."},
			Answer{Tag = "flinkZelle105_018PC", String = "Habt Ihr vielleicht noch etwas vergessen?", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkZelle105_019", String = "Es waren drei Seiten, glaube ich! Sucht sie in Frostfall und bringt sie Darius!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 703},
			       QuestBegin{QuestId = 704},
			       QuestBegin{QuestId = 705},
			       QuestBegin{QuestId = 706},
			       SetNpcFlagTrue{Name="SeitenErzaehltP105"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "flinkZelle105_021", String = "Großartig! Schnell, schließt auf!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "SQP105_FlinksZelleOeffnen"},
				     QuestSolve{QuestId = 708},
			             SetRewardFlagTrue { Name = "SQTiondriaFlinkBefreit" },
			RemoveDialog{},
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end