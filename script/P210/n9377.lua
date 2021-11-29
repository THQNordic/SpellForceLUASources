-->INFO: ZerbitengeistRaum2
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 0}
--!EDS ONIDLEGOHOME END


SpawnOnlyWhen
{
	Conditions =
	{
		IsGlobalFlagTrue{ Name = "g_P210_ZerbitsRoom2Spawn"},
	},
}


--------------------------------------------
---- Der Zerbitengeist bekommt erst dann seinen Dialog, wenn die Zerbiten-Outcries beendet sind
OnOneTimeEvent
{
	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9377"},
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_210_Room2ZerbitsOutcriesAnkthar", Value = 5, Operator = Equal},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_9377"},
	}
}
----------------------------------------------
----------------------------------------------


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n9377_ZerbitengeistRaum2.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "npc_P210_Known"},
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_001", String = "Er ist es! Oh, Meister, was ist mit Euch geschehen!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "npc_P210_Known"}),
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_036", String = "Ihr kehrt zrück?"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_002", String = "Runenkrieger! Ihr tragt die versklavte Seele unseres Bruders Anktahr mit Euch!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_003", String = "Seid Ihr gekommen, um uns zu verhöhnen? Wollt Ihr das Werk vollenden, das Hokan einst begonnen hat?"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_004", String = "Wir Geister können Euch keinen Schaden mehr zufügen, aber die Fallen, die wir einst errichtet haben, werden Euer Untergang sein!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "npc_P210_Known"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "npc_P210_RuneChoiceGiven"}),
			UND9{
							IsNpcFlagTrue{Name = "npc_P210_RuneChoiceGiven"},
							IsGlobalFlagFalse{Name = "g_P210_RuneAnktharReturned"},
							ODER9{
								PlayerHasItem{ItemId = 4783},
								IsCreoActive{ CreoId = 2319 },
								}
							},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zerbiteghostroom2P210_005PC", String = "Ich bin nicht gekommen, um Euch zu schaden!", AnswerId = 6},
			OfferAnswer{Tag = "zerbiteghostroom2P210_007PC", String = "Was hat es mit diesen Hallen auf sich?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "zerbiteghostroom2P210_014PC", String = "Erzählt mir von Anktahr.", AnswerId = 17, Color = ColorDarkOrange},
			OfferAnswer{Tag = "zerbiteghostroom2P210_020PC", String = "Erzählt mir von den Fallen.", AnswerId = 24, Color = ColorDarkOrange},
			OfferAnswer{Tag = "zerbiteghostroom2P210_025PC", String = "Wo ist das Szepter der Winde?", AnswerId = 30},
			OfferAnswer{Tag = "zerbiteghostroom2P210_029PC", String = "Hier, ich gebe Euch Anktahrs Rune.", AnswerId = 35},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "npc_P210_RuneChoiceGiven"}),
			Negated(UND9{
							IsNpcFlagTrue{Name = "npc_P210_RuneChoiceGiven"},
							IsGlobalFlagFalse{Name = "g_P210_RuneAnktharReturned"},
							ODER9{
								PlayerHasItem{ItemId = 4783},
								IsCreoActive{ CreoId = 2319 },
								}
							}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zerbiteghostroom2P210_005PC", String = "Ich bin nicht gekommen, um Euch zu schaden!", AnswerId = 6},
			OfferAnswer{Tag = "zerbiteghostroom2P210_007PC", String = "Was hat es mit diesen Hallen auf sich?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "zerbiteghostroom2P210_014PC", String = "Erzählt mir von Anktahr.", AnswerId = 17, Color = ColorDarkOrange},
			OfferAnswer{Tag = "zerbiteghostroom2P210_020PC", String = "Erzählt mir von den Fallen.", AnswerId = 24, Color = ColorDarkOrange},
			OfferAnswer{Tag = "zerbiteghostroom2P210_025PC", String = "Wo ist das Szepter der Winde?", AnswerId = 30},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(Negated(IsNpcFlagTrue{Name = "npc_P210_RuneChoiceGiven"})),
			UND9{
							IsNpcFlagTrue{Name = "npc_P210_RuneChoiceGiven"},
							IsGlobalFlagFalse{Name = "g_P210_RuneAnktharReturned"},
							ODER9{
								PlayerHasItem{ItemId = 4783},
								IsCreoActive{ CreoId = 2319 },
								}
							},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zerbiteghostroom2P210_007PC", String = "Was hat es mit diesen Hallen auf sich?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "zerbiteghostroom2P210_014PC", String = "Erzählt mir von Anktahr.", AnswerId = 17, Color = ColorDarkOrange},
			OfferAnswer{Tag = "zerbiteghostroom2P210_020PC", String = "Erzählt mir von den Fallen.", AnswerId = 24, Color = ColorDarkOrange},
			OfferAnswer{Tag = "zerbiteghostroom2P210_025PC", String = "Wo ist das Szepter der Winde?", AnswerId = 30},
			OfferAnswer{Tag = "zerbiteghostroom2P210_029PC", String = "Hier, ich gebe Euch Anktahrs Rune.", AnswerId = 35},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(Negated(IsNpcFlagTrue{Name = "npc_P210_RuneChoiceGiven"})),
			Negated(UND9{
							IsNpcFlagTrue{Name = "npc_P210_RuneChoiceGiven"},
							IsGlobalFlagFalse{Name = "g_P210_RuneAnktharReturned"},
							ODER9{
								PlayerHasItem{ItemId = 4783},
								IsCreoActive{ CreoId = 2319 },
								}
							}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zerbiteghostroom2P210_007PC", String = "Was hat es mit diesen Hallen auf sich?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "zerbiteghostroom2P210_014PC", String = "Erzählt mir von Anktahr.", AnswerId = 17, Color = ColorDarkOrange},
			OfferAnswer{Tag = "zerbiteghostroom2P210_020PC", String = "Erzählt mir von den Fallen.", AnswerId = 24, Color = ColorDarkOrange},
			OfferAnswer{Tag = "zerbiteghostroom2P210_025PC", String = "Wo ist das Szepter der Winde?", AnswerId = 30},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_006", String = "Wenn Ihr die Wahrheit sagt, dann gebt uns Anktahrs Rune! Seine Seele soll endlich Ruhe finden!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "npc_P210_RuneChoiceGiven"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
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
			Negated(IsGlobalFlagFalse{Name = "g_P210_RuneAnktharReturned"}),
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_009", String = "Einst waren sie Hallen des Wissens, Hallen der Rechtschaffenheit und der Vernunft!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{10;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_P210_RuneAnktharReturned"},
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_008", String = "Diese Hallen bedeuten Euren Tod! Ihr werdet sie niemals wieder verlassen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_010", String = "Wir haben einst hier gelebt Runenkrieger! Als Mitglieder des Zerbitenordens erforschten wir die Geheimnisse des schwarzen Dschungels .. und bewahrten das Reich vor seinem Übel."},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_011", String = "Aber unser Bruder Hokan hat uns verraten! Er hat dort im Dschungel eine Maske gefunden, die ihm unglaubliche Macht verlieh! Und mit dieser Kraft trachtete er uns zu vernichten!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_012", String = "Wir konnten ihm nichts entgegensetzen! Schließlich beschlossen wir, unsere Festungen in tödliche Fallen zu verwandeln, damit Hokan auf seiner Suche nach unserem Wissen sein Ende finden sollte!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_013", String = "Aber er ahnte die Gefahr! Er griff nicht an, sondern belagerte unsere Festungen und ließ uns verhungern wie Tiere! So sind diese Hallen heute nur noch unser Grab."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_P210_RuneAnktharReturned"},
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_015", String = "Bevor er Hokan in die Hände gefallen ist, hätte er Euch vernichtet! Nun ist er nur noch ein Schatten seiner selbst!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_P210_RuneAnktharReturned"}),
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_016", String = "Er war unser Führer, unser Grossmeister! Der Weiseste und Gütigste aus unserer Mitte!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_017", String = "Man mag es kaum glauben, wenn man den verzerrten Schemen sieht, der er jetzt ist! Aber er war es, der Hokan fortgelockt hat, so dass wir unsere Festen mit Fallen versehen konnten."},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_018", String = "Er opferte sich, damit Hokan nicht unser geheimstes Wissen in die Hände fiel! Zur Strafe hat Hokan seine Seele versklavt und schließlich an die Rune gebunden!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_019", String = "So hat er den einzigen, der ihn jemals überlisten konnte zu seinem willigen Sklaven gemacht! Welch grausamer Spott! Aber jetzt ist er frei!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_P210_RuneAnktharReturned"},
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_021", String = "Ihr werdet ihre Wirkung noch früh genug am eigenen Leib erfahren!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_P210_RuneAnktharReturned"}),
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_022", String = "Sie sind mechanish aber auch magisch! Wir haben sie so gebaut, dass ein geduldiger Mensch, der aus Fehlern lernt, sie überwinden kann."},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_023", String = "Aber ein Wahnsinniger wie Hokan hätte nur versucht, sich mit Gewalt Zutritt zu verschaffen! Das wäre sein Ende gewesen!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_024", String = "Achtet also auf die Hinweise, die überall zu finden sind, dann werdet Ihr diesen Ort lebend verlassen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
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
			IsGlobalFlagFalse{Name = "g_P210_RuneAnktharReturned"},
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_026", String = "Ihr werdet es niemals finden!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{31;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_P210_RuneAnktharReturned"}),
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_027", String = "Das Szepter liegt in der Schatzkammern nordöstlich von hier!"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_028", String = "Merkt Euch das: Um dorthin vorzudringen, müsst ihr die fünf steinernen Köpfe zum Leuchten bringen!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(Negated(PlayerHasItem{ItemId = 4783})),
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_031", String = "Nehmt diese drei Münzen als Dank! Nun ist Anktahr endlich nach Hause zurückgekehrt. Wir werden seinen gepeinigten Geist heilen."},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 4783}),
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_030", String = "Dann nehmt die Rune aus Eurer Runentafel heraus!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "g_P210_RuneAnktharReturned"},
					TransferItem{TakeItem = 4783 , Flag = Take},
					TransferItem{GiveItem = 7332 , Flag = Give},
					TransferItem{GiveItem = 7356 , Flag = Give},
					TransferItem{GiveItem = 7356 , Flag = Give},
			Say{Tag = "zerbiteghostroom2P210_032", String = "Ihr habt uns einen großen Dienst erwiesen! Wie können nun wir Euch helfen?"},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(QuestState{QuestId = 1035, State = StateActive} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{39;
		Conditions = {
			QuestState{QuestId = 1035, State = StateActive} ,
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "zerbiteghostroom2P210_033PC", String = "Ich suche die Artefakte des blutenden Auges.", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_034", String = "Auch wenn wir Euch dankbar sind, werden wir dies nicht verraten."},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zerbiteghostroom2P210_035", String = "Ihr müsst wissen: Demjenigen, der alle Artefakte findet, gewähren wir Zugang zu unserem Vermächtnis."},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}


	EndDefinition()
end