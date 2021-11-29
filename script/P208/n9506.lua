-->INFO: Argamun
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
--Argamun


OnPlatformOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 854, State = StateActive}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_9506"}
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 855, State = StateActive},
		IsGlobalFlagFalse {Name = "g_P208_TorEinsAuf"}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P208_TorEinsAuf"}
	}
}

OnPlatformOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 855, State = StateSolved},
		IsGlobalFlagFalse {Name = "g_P208_TorZweiAuf"}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P208_TorZweiAuf"},
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_9506"}
	}
}

OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P208_CampEinsKaputt"},
		IsGlobalFlagTrue {Name = "g_P208_CampZweiKaputt"},
		IsGlobalFlagTrue {Name = "g_P208_CampDreiKaputt"},
		IsGlobalFlagTrue {Name = "g_P208_CampVierKaputt"},
		IsGlobalFlagTrue {Name = "g_P208_CampFuenfKaputt"},
		
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_9506"}
	}
}

-- Wenn alle Aufträge gelöst sind wird Argamun zum Drachen
OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 863, State = StateSolved},
	},
	Actions =
	{
		SetEffect {Effect = "OccludeWhite", Length = 9000, TargetType = Figur, NpcId = self},
		ChangeUnit {Unit = 2704},
		SetRewardFlagTrue {Name = "ArgamunVerwandeltSich"},
		Outcry {Tag = "oca2argamunP208_003", NpcId = 9506, String = "Betretet das Colosseum, Ihr seid würdig!", Color = ColorWhite}, 
		SetGlobalTimeStamp {Name = "gt_P213_ArgamunZwei"},
		SetGlobalFlagTrue {Name = "gt_P213_ArgamunDrache"},
		StopFollow {Target = Avatar}
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P213_ArgamunZwei", Seconds = 8},
	},
	Actions =
	{
		Outcry {Tag = "oca2argamunP208_004", NpcId = 9506, String = "Nun kann ich endlich ruhen!", Color = ColorWhite}, 
	}
} 

OnIdleGoHome
{
	X = 457, Y = 312,
	WalkMode = Walk,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "gt_P213_ArgamunDrache"},
	},
	Actions =
	{
	}
}


-- AB hier neuer Kram



-- umspawn flag setzen bei spielertod
OnToggleEvent
{
	OnConditions = 
	{
		FigureDead{NpcId = Avatar},
	},
	OnActions = 
	{
	},
	OffConditions = 
	{
		FigureAlive{NpcId = Avatar},
	},
	OffActions = 
	{
		SetNpcFlagTrue{Name = "BitteUmspawnen"},
	}
}
-- umspawn flag setzen bei plattformwechsel
OnPlatformOneTimeEvent
{
	Conditions =
	{
	},
	Actions = 
	{
		SetNpcFlagTrue {Name = "BitteUmspawnen"},
		Follow {Target = Avatar},
	}
} 

OnPlatformOneTimeEvent
{
	Conditions =
	{
		AvatarInRange {X = 429, Y = 360, Range = 5},
	},
	Actions =
	{
		SetNpcFlagFalse {Name = "BitteUmspawnen"},
	}
}

--OnOneTimeEvent	-- gleich wieder löschen beim allerersten mal (verhindert vor- bzw. nach-cutscene umspawn-problem)
NewState{Name = "AvoidUmspawnAfterMapStartCutscene"}
AddTransition
{
	From = "_IDLE", To = "AvoidUmspawnAfterMapStartCutscene", RemoveTransitionAfterUse = TRUE,
	Conditions = {IsNpcFlagTrue{Name = "BitteUmspawnen", UpdateInterval = 1}},
	Actions = {SetNpcFlagFalse{Name = "BitteUmspawnen"}},
}
AddTransition
{
	From = "AvoidUmspawnAfterMapStartCutscene", To = "_IDLE", RemoveTransitionAfterUse = TRUE,
	Conditions = { }, Actions = { },
}


Umspawn 
{
	UnitId = self, 
	Clan = 0, 
	X = startX, 
	Y = startY,
	Target = Avatar,
	NoSpawnEffect = FALSE,
	OnlyOnce = FALSE,
	Conditions = 
	{
		ODER                                       
		(                                  
			AvatarLocalTeleport{},
			IsNpcFlagTrue{Name = "BitteUmspawnen", UpdateInterval = 3}
		),
		IsGlobalFlagFalse {Name = "gt_P213_ArgamunDrache"},
	}, 
	Actions = 
	{
		Follow {Target = Avatar},
		SetNpcFlagFalse{Name = "BitteUmspawnen"},
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_9506"}	
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\Project\main\mission\dialoge\p208\n9506_Argamun.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "known"},
		},
		Actions = {
			Say{Tag = "argamunP208_001", String = "Was riecht denn hier so seltsam (schnüffelt) ... das ist ... das ist ..."},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "known"}),
		},
		Actions = {
			Say{Tag = "argamunP208_014", String = "Was? (schnüffelt) Ah, Ihr seid es!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_002", String = "Menschenfleisch! Oh, das ist lange her, ich kann mich kaum noch erinnern..."},
			Answer{Tag = "argamunP208_003PC", String = "Kommt nicht auf dumme Gedanken, Ork!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_004", String = "Oh! Ich ... Ich hatte nicht vor Euch zu essen, wisst Ihr, mein Geruchsinn taugt nur mehr als meine Augen! Sehr schlecht in diesem Land hier, sehr schlecht!"},
			Answer{Tag = "argamunP208_005PC", String = "Und was für ein Land ist das?", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_006", String = "Die Hazim nennen es die brennenden Steine! Es ist ein verwunschener Ort, seit dem der Feuerriese Utrur hier gehaust hat! Er hat damals in seinen Zorn drei Flüche über dieses Land ausgesprochen!"},
			Answer{Tag = "argamunP208_007PC", String = "Erzählt mir davon.", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_008", String = "Der erste von ihnen traf die Prinzessinnen, die ihm versprochen wurden. Ihr müsst wissen, Utrur bewachte hier den Eingang zum Colloseum der Götter. Und er war sehr einsam auf seiner  Wacht!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_009", String = "Da riefen die Götter die fünf schönsten Prinzessinnen der jungen Völker herbei damit eine von ihnen sich Utrur erwählen sollte. Utrur glaubte, wenn er den Frauen nur genug Edelsteine und Gold aus dem Innern der Erde holte, könnte er ihre Herzen gewinnen."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_010", String = "Aber er hatte sich getäuscht! Die Frauen nahmen seine Steine, oh ja, aber sie verschmähten den häßlichen Riesen! Da wurde er so wütend, dass er heftig mit dem Fuß aufstampfte so dass der Boden brach und der Vulkan sich erhob!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_011", String = "Er verfluchte die Prinzessinnen ob ihrer Eitelkeit und sie wurden zu hässliche Kröten! Seit jenem Tag wandern sie unglücklich durch das Land, immer bewacht von Utrurs dämonischen Dienern!"},
			Answer{Tag = "argamunP208_012PC", String = "Sind sie dann mittlerweile nicht genug gestraft?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_013", String = "Das sind sie wohl! Befreit sie! Tötet Ihre Bewacher und erlöst sie von dem Fluch!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			QuestBegin {QuestId = 848}, SetNpcFlagTrue {Name = "known"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{11;
		Conditions = {
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{11;
		Conditions = {
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_016", String = "Gut, Ihr habt den ersten Fluch von den brennenden Steinen genommen!"},
			Answer{Tag = "argamunP208_017PC", String = "Was hat es mit den anderen Flüchen auf sich?", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_018", String = "Der zweite Fluch traf Utrurs jüngeren Bruder, Surt, der sich mit dem Eisriesen Gorg verbündet hatte, um Utrur als Wächter des Colloseums zu stürzen und an den Lavarubin zu gelangen, Utrurs größten Schatz!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_019", String = "Surt stahl den Rubin! Doch Gorg wurde von den Zwergen der Grimwargberge geschlagen und der schwache Surt war schutzlos! Er flehte seinen Bruder um Gnade an! Doch Utrur verfluchte auch ihn!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_020", String = "Er verdammte ihn dazu, dass gleiche Schicksal zu teilen, wie sein Komplize Gorg, als untote Kreatur sollte er hier eingesperrt bleiben, als ewiger Wächter über den Lavarubin, den er geraubt hatte!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_021", String = "Utrur schloss das Tor und sperrte Surt und seine Gefolgsleute hier ein! Der Fluch sollte solange halten, bis Surt den Lavarubin aus freien Stücken zurückgeben würde! Doch der gierige Surt klammert sich bis heute daran!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_022", String = "Er ist immer noch hier gefangen! Er kennt nur Vernichtung und rasende Wut! Ihr müsst ihn schlagen und den Lavarubin an Euch nehmen! Aber Ihr dürft ihn nicht behalten oder der Fluch trifft auch Euch!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_023", String = "Bringt den Lavarubin zu mir, damit ich ihn den Feuern der Erde zurückgeben kann."},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			QuestBegin {QuestId = 855}, QuestSolve {QuestId = 848}, QuestSolve {QuestId = 854},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[13]Abgeschaltet"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
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
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{22;
		Conditions = {
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{22;
		Conditions = {
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{22;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_025", String = "Ihr seid ein guter Krieger, Mensch! Ich wünschte ich könnte Eure Taten noch mit meinen Augen miterleben!"},
			Answer{Tag = "argamunP208_026PC", String = "Berichtet von dem dritten Fluch, Argamun.", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_027", String = "Oh, das ist ein Geheimnis!"},
			Answer{Tag = "argamunP208_028PC", String = "Ihr habt mich auf diesen Pfad geführt, jetzt bringt es auch zu Ende!", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_029", String = "Ach, mein Gedächtnis, ich kann mich nicht errinnern ..."},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_030", String = "Nur das weiß ich: Diebische Kreaturen stahlen Utrur immer wieder Wasser und Fleisch und versetzten ihn damit in großen Zorn! Aber eines Nachts lauerte er ihnen auf und schleuderde seinen dritten Fluch auf sie!"},
			Answer{Tag = "argamunP208_031PC", String = "Und was war der Fluch?", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_032", String = "Mehr weiß ich nicht mehr, diesen Teil erzähle ich so selten ... Ihr werdet es selbst herausfinden müssen! Straft die Diebe und der Fluch wird vergehen!"},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			QuestBegin {QuestId = 863},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[23]Abgeschaltet"},
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
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
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
		}}

	OnAnswer{30;
		Conditions = {
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_034", String = "Wohl getan, Mensch! Ihr habt Utrurs Flüche von diesem Land genommen! Die Götter sind Euch wohlgesonnen!"},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_035", String = "Damit habt Ihr die Prüfung bestanden! Ihr seid würdig, das Colloseum der Götter zu betreten!"},
			Answer{Tag = "argamunP208_036PC", String = "Das alles war eine Prüfung?", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "argamunP208_037", String = "Nur Sterbliche, die sich als würdig erweisen, dürfen an den Spielen und Vergnügungen der Götter teilnehmen! So spreche ich, Argamun, Wächter des Colloseums!"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			QuestSolve{QuestId = 863}, QuestSolve{QuestId = 1079},SetNpcFlagTrue {Name = "n_P208_Blocker"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
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
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{36;
		Conditions = {
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
		}}

	OnAnswer{36;
		Conditions = {
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{36;
		Conditions = {
			UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} ),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_015PC", String = "Die Prinzessinen sind erlöst!", AnswerId = 13},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} ),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_024PC", String = "Surt ist besiegt! Hier ist der Lavarubin!", AnswerId = 23},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "argamunP208_033PC", String = "Die Diebe sind gestraft!", AnswerId = 31},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(UND( QuestState {QuestId = 854, State = StateActive}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[13]Abgeschaltet"} )),
			Negated(UND( PlayerHasItem {ItemId = 7359}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[23]Abgeschaltet"} )),
			Negated(UND9{QuestState {QuestId = 1079, State = StateActive}, IsNpcFlagFalse {Name = "n_P208_Blocker"}}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end