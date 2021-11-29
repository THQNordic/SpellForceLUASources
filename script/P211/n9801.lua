-->INFO: Craig
--Craig gefangen in Darkwind Keep

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE,
	Conditions = 
		{
			--IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},
			--QuestState {QuestId = 1063, State = StateActive}, --NQ Der letzte Dracon
		}, 
	Actions = 
		{
			SetEffect {Effect = "Chain", Length = 0, TargetType = Figure, NpcId = self},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9801"},
			HoldPosition {NpcId = self, FreeWill = FALSE},
			LookAtDirection {Direction = 2, NpcId = self}
		} 
}

OnIdleGoHome
{
	X = _X, Y = _Y, Direction = 2, Range = 1, WalkRange = 10, WaitTime = 0, WalkMode = Walk, GotoMode = GotoNormal,
	Conditions = {},
	Actions = {},
	HomeActions = {},
	AbortConditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211CraigBefreit", UpdateInterval = 20},
	},
	AbortActions = {},
}


OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		--Negated(EnemyUnitInRange{X = 181, Y = 126, NpcId = Avatar, Range = 15, UnitId = 0, UpdateInterval = 10}),
		--Negated(BuildingInRange{X = 181, Y = 126, Range = 15, Owner = OwnerNpc , BuildingId = 0 , UpdateInterval = 10}),
		--FigureInRange {X = 179, Y = 130, NpcId = 0, Range = 3}, 
		FigureDead {NpcId = 10821},
		QuestState {State = StateUnknown, QuestId = 1061}, --Wenn die NQ Der letzte Dracon nicht bekannt ist
	},
	Actions = 
	{
		StopEffect {TargetType = Figure, NpcId = self},
		SetGlobalFlagTrue {Name = "g_P211CraigBefreit"},
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_9801"},
		SetRewardFlagTrue {Name = "CraigBefreit"}
	},
}


Despawn
{
 	PlayDeathAnim = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP211NQDraconAuftragEmpiria"},
		ODER(IsGlobalFlagTrue{Name = "g_sP204SpawnCraig"}, IsGlobalFlagTrue{Name = "g_sP204SQBotschafterTot"}),--Globales Flag das in Empiria gesetzt wird
		
	}, 
	Actions =
	{
		
	}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p211\n9801_Craig.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagTrue{Name = "Known"},
		},
		Actions = {
			Say{Tag = "craigP211_001", String = "Freund?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "Known"}),
		},
		Actions = {
			Say{Tag = "craigP211_002", String = "Ihr? Ich hätte nicht gedacht Euch wiederzusehen, Freund!"},
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
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craigP211_013PC", String = "Ich bin hier um dem Zirkel ein Ende zu machen!", AnswerId = 13, Color = ColorDarkOrange},
			OfferAnswer{Tag = "craigP211_019PC", String = "Ich habe das Siegel der Norcaine für Euch!", AnswerId = 20},
		}}

	OnAnswer{3;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craigP211_013PC", String = "Ich bin hier um dem Zirkel ein Ende zu machen!", AnswerId = 13, Color = ColorDarkOrange},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craigP211_019PC", String = "Ich habe das Siegel der Norcaine für Euch!", AnswerId = 20},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
			IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "craigP211_003PC", String = "Es ist lange her, Craig.", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name="g_nP201_PhoenixSteinSpieler"}),
		},
		Actions = {
			Say{Tag = "craigP211_007", String = "Ich dachte das Schwert hätte Euch schon längst zu einm Schatten gemacht!"},
			Answer{Tag = "craigP211_008PC", String = "Es schmerzt, aber noch lebe ich und bin frei.", AnswerId = 9},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craigP211_004", String = "Allerdings! Ich habe gehört, was nach der Schlacht um Fiara geschehen ist. Habt Ihr den Phönixstein an Euch genommen?"},
			Answer{Tag = "craigP211_005PC", String = "Ja, ich trage ihn seitdem bei mir.", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "craigP211_006", String = "Es war richtig von Euch, nicht mehr nach Nortander zurückzukehren, man hätte Euch nur des Phönix wegen gejagt. Aber weshalb seid Ihr jetzt hier?"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craigP211_013PC", String = "Ich bin hier um dem Zirkel ein Ende zu machen!", AnswerId = 13, Color = ColorDarkOrange},
			OfferAnswer{Tag = "craigP211_019PC", String = "Ich habe das Siegel der Norcaine für Euch!", AnswerId = 20},
		}}

	OnAnswer{8;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craigP211_013PC", String = "Ich bin hier um dem Zirkel ein Ende zu machen!", AnswerId = 13, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craigP211_019PC", String = "Ich habe das Siegel der Norcaine für Euch!", AnswerId = 20},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "craigP211_009PC", String = "Im Gegensatz zu Euch! Ihr habt Euch in Shal'Dun nicht lange gehalten, Freund!", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craigP211_010", String = "Dieser Maskierte! Er hat die Verwirrung genutzt und die Kasten in Shal'Dun erneut gegeneinander aufgebracht!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craigP211_011", String = "Als ich versuchte zu schlichten, schleuderte er mich kurzerhand mit einem Zauber hierher! Ich hätte nicht gedacht, dass er solche Macht besitzt!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "craigP211_012", String = "Ihr seid seinetwegen hier, nicht wahr?"},
			OfferAnswer{Tag = "craigP211_013PC", String = "Ich bin hier um dem Zirkel ein Ende zu machen!", AnswerId = 13, Color = ColorDarkOrange},
			OfferAnswer{Tag = "craigP211_019PC", String = "Ich habe das Siegel der Norcaine für Euch!", AnswerId = 20},
		}}

	OnAnswer{12;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "craigP211_012", String = "Ihr seid seinetwegen hier, nicht wahr?"},
			OfferAnswer{Tag = "craigP211_013PC", String = "Ich bin hier um dem Zirkel ein Ende zu machen!", AnswerId = 13, Color = ColorDarkOrange},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "craigP211_012", String = "Ihr seid seinetwegen hier, nicht wahr?"},
			OfferAnswer{Tag = "craigP211_019PC", String = "Ich habe das Siegel der Norcaine für Euch!", AnswerId = 20},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
		},
		Actions = {
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "craigP211_012", String = "Ihr seid seinetwegen hier, nicht wahr?"},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craigP211_014", String = "Dann ist es also wahr? Der Maskierte ist ein Zirkelmagier?"},
			Answer{Tag = "craigP211_015PC", String = "Ja, sein Name ist Hokan Ashir. Und er erweckt im Knochentempel die anderen des Zirkels! Aber nicht mehr lange!", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craigP211_016", String = "Dann ist das also Euer Schicksal ... dafür habt Ihr Eure Last bis jetzt getragen! Ich glaube niemand hatte jemals eine schwerere Aufgabe vor sich als Ihr!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craigP211_017", String = "Ich würde Euch gerne beistehen, aber meine Gefangenschaft hat mich geschwächt. Ich wäre Euch nur eine Last!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craigP211_018", String = "Ich fürchte, diesmal werden wir uns nicht wiedersehen, Freund. Mögen die Götter mit Euch sein!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[13]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
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
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craigP211_013PC", String = "Ich bin hier um dem Zirkel ein Ende zu machen!", AnswerId = 13, Color = ColorDarkOrange},
			OfferAnswer{Tag = "craigP211_019PC", String = "Ich habe das Siegel der Norcaine für Euch!", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craigP211_013PC", String = "Ich bin hier um dem Zirkel ein Ende zu machen!", AnswerId = 13, Color = ColorDarkOrange},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craigP211_019PC", String = "Ich habe das Siegel der Norcaine für Euch!", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craigP211_020", String = "Nors Auge, das Siegel! Wer hat es Euch gegeben?"},
			Answer{Tag = "craigP211_021PC", String = "Shain Tal'Ach schickt mich. Es ist an der Zeit für Euch, zu Eurem Volk hiemzukehren. Ihr müsst die Norcaine davor bewahren, sich selbst zu vernichten!", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craigP211_022", String = "Mein treuer Shain ... Ich und Heimkehren, dieser Träumer! Ich würde nicht einmal die Hauptstadt erreichen, meine Feinde dort sind Legion!"},
			Answer{Tag = "craigP211_023PC", String = "Aber Euer Volk braucht Euch!", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craigP211_024", String = "Und ich werde dem Ruf folgen! Aber alles zu seiner Zeit! Ich bin noch zu schwach um zu reisen, Ihr müsst das Siegel dem Botschafter meines Volkes in Empyria bringen!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craigP211_025", String = "Er soll alles für meine Heimkehr vorbereiten! Zeigt dem Botschafter das Siegel, es wird Euch die nötige Autorität verleihen, aber gebt es ihm nicht!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craigP211_026", String = "Ich folge Euch, sobald ich wieder bei Kräften bin!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_sP211NQDraconAuftragEmpiria"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[20]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 26},
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
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craigP211_013PC", String = "Ich bin hier um dem Zirkel ein Ende zu machen!", AnswerId = 13, Color = ColorDarkOrange},
			OfferAnswer{Tag = "craigP211_019PC", String = "Ich habe das Siegel der Norcaine für Euch!", AnswerId = 20},
		}}

	OnAnswer{27;
		Conditions = {
			UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craigP211_013PC", String = "Ich bin hier um dem Zirkel ein Ende zu machen!", AnswerId = 13, Color = ColorDarkOrange},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craigP211_019PC", String = "Ich habe das Siegel der Norcaine für Euch!", AnswerId = 20},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(UND( IsNpcFlagFalse{Name = "NeverTrue"}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( QuestState {State = StateActive, QuestId = 1067}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[20]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end