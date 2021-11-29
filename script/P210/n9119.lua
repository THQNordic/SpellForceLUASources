-->INFO: Uru
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--- Uru spawnt und despawnt mehrfach auf der Karte
--- Bei jedem Despawn wird der Counter npc_P210_UrusRespawning erhöht
--- Counter = 0  : 	Uru spawnt vor dem Eingangsportal, 30 Sekunden nach Kartenstart
---					"UrusFirstComing"
--- Counter = 1  :	Uru spawnt vor Raum 5 und warnt den Spieler, den Ueber-Skeletten nicht zu
---					begegnen



--- Uru erscheint erst 10 Sekunden nach Spielstart
SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = FALSE,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "UrusFirstComing", Seconds = 30},
	},
	Actions =
	{
		SetEffect { Effect = "Loot", Length = 0, TargetType = Figure, NpcId = self},
		RandomizeGlobalCounter {Name = "g_P210_PointerA", MaxValue = 3 },
		RandomizeGlobalCounter {Name = "g_P210_PointerB", MaxValue = 3 },
		RandomizeGlobalCounter {Name = "g_P210_PointerC", MaxValue = 3 },
		RandomizeGlobalCounter {Name = "g_P210_PointerD", MaxValue = 3 },
		ChangeRace {Race = 152, NpcId = self},
	}
}

-------- Urus Despawnaktion ----
---- Erst wird ein Effekt gesetzt
---- Wenn dann ein TimeStamp abgelaufen ist, despawnt Uru

OnEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P210_UruDespawn"},
	},
	Actions =
	{
		SetGlobalFlagFalse{Name = "g_P210_UruDespawn"},
		SetNpcFlagTrue{Name = "npc_P210_DespawnSecurityFlag" },
		SetEffect {Effect ="DeMaterialize", TargetType = Figure, NpcId = Self},
		SetNpcTimeStamp{Name ="npc_P210_CountdownToDespawn"},
	}
}
 
Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsNpcTimeElapsed{Name ="npc_P210_CountdownToDespawn", Seconds = 2},
		IsNpcFlagTrue{Name = "npc_P210_DespawnSecurityFlag" },
	},
	Actions =
	{
		SetNpcFlagFalse{Name = "npc_P210_DespawnSecurityFlag" },
		IncreaseNpcCounter{Name = "npc_P210_UrusRespawning"},
	},
}	
---- Ende Urus Despawnaktion
                                                                         

--- Uru spawnt vor der Raum 5 wieder und warnt vor den Skeletten
--- (erscheint, sobald Spieler in Range kommt) 
Respawn
{
	WaitTime = 20, X = 172, Y = 318, NoSpawnEffect = FALSE,
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 1, Operator = IsEqual},
		IsGlobalFlagTrue {Name = "g_P210_PlayerCrossedHallOfEyes"},
	},
	Actions =
	{
		SetEffect { Effect = "Loot", Length = 0, TargetType = Figure, NpcId = self},
		Outcry {NpcId = 9119, String = "Achtet auf die untoten Wächter im Raum südlich von hier! Kommt ihnen nicht zu nahe!", Tag = "oca2uruP210_001"},
		ChangeRace {Race = 152, NpcId = self},
	}
}


--- Uru verschwindet, sobald Spieler zum Spinnenraum kommt
OnOneTimeEvent
{
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 1, Operator = IsEqual},
		IsGlobalFlagTrue {Name = "g_P210_Room5Crossed"},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P210_UruDespawn"},
	}
}


--- Uru spawnt vor Raum 6 wieder und warnt vor den Spinnen
Respawn
{
	WaitTime = 3, X = 260, Y = 259, NoSpawnEffect = FALSE,
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 2, Operator = IsEqual},
	},
	Actions =
	{
		SetEffect { Effect = "Loot", Length = 0, TargetType = Figure, NpcId = self},
		Outcry {NpcId = 9119, String = "Wenn Ihr an den Spinnen nicht vorbeikommt, sucht einen anderen Weg.", Tag = "oca2uruP210_002"},
		ChangeRace {Race = 152, NpcId = self},
	}
}


--- Uru verschwindet, sobald Spieler entweder Spinnentor oder 5-Luftmünzen-Tor geöffnet hat
OnOneTimeEvent
{
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 2, Operator = IsEqual},
		ODER9
		{
		IsGlobalFlagTrue{Name = "g_P210_Room6SpiderGateOpen"},
		IsGlobalFlagTrue{Name = "g_P210_AirCoinGateOpen"},
		},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P210_UruDespawn"},
	}
}

--- Uru spawnt in Raum 3 wieder und erzählt von der Schatzkammer
Respawn
{
	WaitTime = 30, X = 324, Y = 399, NoSpawnEffect = FALSE,
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 3, Operator = IsEqual},
		ODER9
		{
		IsGlobalFlagTrue{Name = "g_P210_Room6SpiderGateOpen"},
		IsGlobalFlagTrue{Name = "g_P210_AirCoinGateOpen"},
		},
		
	},
	Actions =
	{
		SetEffect { Effect = "Loot", Length = 0, TargetType = Figure, NpcId = self},
		ChangeRace {Race = 152, NpcId = self},
	}
}

--- Uru verschwindet, sobald Spieler Untotentor öffnet
OnOneTimeEvent
{
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 3, Operator = IsEqual},
		IsGlobalFlagTrue{Name = "g_P210_SkeletonCampDoorOpen"},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P210_UruDespawn"},
	}
}

--- Uru spawnt vor Raum 7 wieder und warnt vor dem Schachbrett
Respawn
{
	WaitTime = 10, X = 128, Y = 231, NoSpawnEffect = FALSE,
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 4, Operator = IsEqual},
		IsGlobalFlagTrue {Name = "g_P210_PlayerCrossedRoom4"},
		
	},
	Actions =
	{
		SetEffect { Effect = "Loot", Length = 0, TargetType = Figure, NpcId = self},
		Outcry {NpcId = 9119, String = "Achtet auf die Blutlachen und Gerippe! Bleibt weg von ihnen!", Tag = "oca2uruP208_001"},
		ChangeRace {Race = 152, NpcId = self},
	}
}

--- Uru verschwindet, sobald Spieler Chessboard überquert hat
OnOneTimeEvent
{
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 4, Operator = IsEqual},
		IsGlobalFlagTrue{Name = "g_P210_Room7ChessboardDone"},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P210_UruDespawn"},
	}
}

--- Uru erscheint ein letztes Mal, sobald Spieler mit Xalabar gesprochen hat

Respawn
{
	WaitTime = 10, X = 114, Y = 176, NoSpawnEffect = FALSE,
	Conditions =
	{
		IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 5, Operator = IsEqual},
		IsGlobalFlagTrue {Name = "npc_P210_PlayerSpokenWithXalabar"},
		
	},
	Actions =
	{
		SetEffect { Effect = "Loot", Length = 0, TargetType = Figure, NpcId = self},
		ChangeRace {Race = 152, NpcId = self},
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p210\n9119_Uru.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 68},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "npc_P210_SpokenWithUru"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 65},
		}}

	OnAnswer{2;
		Conditions = {
			IsNpcFlagFalse {Name = "npc_P210_SpokenWithUru"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "uruP210_001PC", String = "Uru!", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_002", String = "Im Geiste, ja, aber nicht in Fleisch und Blut."},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_003", String = "Was Ihr seht, ist nur eine Erscheinung. Ich sende Euch meinen Geist, um mein Wissen mit Euch zu teilen."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_004", String = "Diese alten Kammern sind voller tödlicher Fallen, Ihr werdet meine Hilfe brauchen! Ihr dürft nicht versagen, Sturmbote!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue {Name = "npc_P210_SpokenWithUru"},
			Say{Tag = "", String = ""},
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
			IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceADone"},
			IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceBDone"},
			IsGlobalFlagTrue {Name = "g_P210_UruMenhirComboGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uruP210_005PC", String = "Was erwartet mich hier?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uruP210_010PC", String = "Wie kann ich das Tor öffnen?", AnswerId = 16},
			OfferAnswer{Tag = "uruP210_039PC", String = "Sagt mir noch einmal, wie ich die Zeiger ausrichten muss.", AnswerId = 62},
		}}

	OnAnswer{8;
		Conditions = {
			IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceADone"},
			IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceBDone"},
			Negated(IsGlobalFlagTrue {Name = "g_P210_UruMenhirComboGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uruP210_005PC", String = "Was erwartet mich hier?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uruP210_010PC", String = "Wie kann ich das Tor öffnen?", AnswerId = 16},
		}}

	OnAnswer{8;
		Conditions = {
			IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceADone"},
			Negated(IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceBDone"}),
			IsGlobalFlagTrue {Name = "g_P210_UruMenhirComboGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uruP210_005PC", String = "Was erwartet mich hier?", AnswerId = 9, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uruP210_039PC", String = "Sagt mir noch einmal, wie ich die Zeiger ausrichten muss.", AnswerId = 62},
		}}

	OnAnswer{8;
		Conditions = {
			IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceADone"},
			Negated(IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceBDone"}),
			Negated(IsGlobalFlagTrue {Name = "g_P210_UruMenhirComboGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uruP210_005PC", String = "Was erwartet mich hier?", AnswerId = 9, Color = ColorDarkOrange},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceADone"}),
			IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceBDone"},
			IsGlobalFlagTrue {Name = "g_P210_UruMenhirComboGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uruP210_010PC", String = "Wie kann ich das Tor öffnen?", AnswerId = 16},
			OfferAnswer{Tag = "uruP210_039PC", String = "Sagt mir noch einmal, wie ich die Zeiger ausrichten muss.", AnswerId = 62},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceADone"}),
			IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceBDone"},
			Negated(IsGlobalFlagTrue {Name = "g_P210_UruMenhirComboGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uruP210_010PC", String = "Wie kann ich das Tor öffnen?", AnswerId = 16},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceADone"}),
			Negated(IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceBDone"}),
			IsGlobalFlagTrue {Name = "g_P210_UruMenhirComboGiven"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uruP210_039PC", String = "Sagt mir noch einmal, wie ich die Zeiger ausrichten muss.", AnswerId = 62},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceADone"}),
			Negated(IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceBDone"}),
			Negated(IsGlobalFlagTrue {Name = "g_P210_UruMenhirComboGiven"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_006", String = "Die Uhrwerkhallen sind eine alte Festung der Zerbiten, die diese  vor vielen Jahrhunderten mit tödlichen Fallen gegen den Verräter Hokan geschützt haben!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_007", String = "Hokan erschlug ihren Anführer Anktahr auf dem Schlachtfeld und ließ die übrigen Zerbiten in ihren gesicherten Festungen grausam verhungern! Ihre Geister sind immer noch hier!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_008", String = "Und auch die Fallen, mit denen sie die Schätze ihres Wissens geschützt haben! Denn Hokan hat nie gewagt diese Orte zu betreten!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_009", String = "Für jede Falle gibt einen Weg, wie sie überwunden werden kann! Aber bedenkt, dass hier Euer Verstand gefragt ist! Die Zerbiten waren sehr erfinderisch im Entsinnen tödlicher Rätsel!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P210_UruDialogChoiceADone"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_011", String = "Seht Ihr den großen Stein nahe dem Tor?"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_012", String = "Ihr müsst die Zeiger dort in die richtige Stellung bringen!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
			IsGlobalFlagTrue {Name = "g_P210_EntryMenhirTried"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "uruP210_013PC", String = "Das habe ich bereits versucht! Aber nichts ist geschehen!", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsGlobalFlagTrue {Name = "g_P210_EntryMenhirTried"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "uruP210_022PC", String = "Sagt mir, wie ich sie einstellen soll.", AnswerId = 29},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_014", String = "Dann habt Ihr die Zeiger falsch ausgerichtet."},
			Answer{Tag = "uruP210_015PC", String = "Dreimal verflucht! Aber wenigstens habe ich nichts schlimmeres damit bewirkt ...", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_016", String = "Seid Euch dessen nicht allzu sicher, Freund! In diesen Kammern kann jeder Fehler Euer Schicksal besiegeln!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_017", String = "Es mag sein, das jetzt tief in diesen Kammern ein Schrecken freigesetzt wurde, der Euch jagt! Oder eine Kammer füllt sich mit giftigem Dampf! Alles ist möglich in den Uhrwerkhallen!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_018", String = "Seid also vorsichtig! Aber solltet Ihr ein Rätsel nicht lösen können, dann gebt nicht auf!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_019", String = "Setzt Eure Kampfkraft ein und schlagt Euch druch, wenn es der einzige Weg für Euch ist! Aber Ihr dürft nicht aufgeben! Ihr tragt das Licht unserer letzen Hoffnung!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P210_UruDialogChoiceBDone"},
			Say{Tag = "", String = ""},
			Answer{Tag = "uruP210_020PC", String = "Der Zirkel hat mich nicht zum Versagen geschaffen, Schamanin ...", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "uruP210_021PC", String = "... aber wie, bei den Schlünden des Barga Gor, soll ich jetzt diese vermaledeiten Zeiger einstellen?", AnswerId = 26},
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
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P210_UruDialogChoiceBDone"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerA", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{30;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerA", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "uruP210_023", String = "Der erste Zeiger muss nach oben ausgerichtet werden."},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerA", Value = 1, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{32;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerA", Value = 1, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "uruP210_024", String = "Der erste Zeiger muss nach links ausgerichtet werden."},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{34;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerA", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "uruP210_025", String = "Der erste Zeiger muss nach unten ausgerichtet werden."},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{34;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerA", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "uruP210_026", String = "Der erste Zeiger muss nach rechts ausgerichtet werden."},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{37;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerB", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "uruP210_027", String = "Der zweite Zeiger muss nach oben ausgerichtet werden."},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerB", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerB", Value = 1, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{39;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerB", Value = 1, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "uruP210_028", String = "Der zweite Zeiger muss nach links ausgerichtet werden."},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{41;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerB", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "uruP210_030", String = "Der zweite Zeiger muss nach rechts ausgerichtet werden."},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{41;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerB", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "uruP210_029", String = "Der zweite Zeiger muss nach unten ausgerichtet werden."},
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
			IsGlobalCounter{Name = "g_P210_PointerC", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "uruP210_031", String = "Der dritte Zeiger muss nach oben ausgerichtet werden."},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{44;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerC", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerC", Value = 1, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 48},
		}}

	OnAnswer{46;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerC", Value = 1, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "uruP210_032", String = "Der dritte Zeiger muss nach links ausgerichtet werden."},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{48;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerC", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "uruP210_034", String = "Der dritte Zeiger muss nach rechts ausgerichtet werden."},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{48;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerC", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "uruP210_033", String = "Der dritte Zeiger muss nach unten ausgerichtet werden."},
			Answer{Tag = "", String = "", AnswerId = 50},
		}}

	OnAnswer{50;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 51},
		}}

	OnAnswer{51;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerD", Value = 0, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 53},
		}}

	OnAnswer{51;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerD", Value = 0, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "uruP210_035", String = "Der vierte Zeiger muss nach oben ausgerichtet werden."},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{53;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerD", Value = 1, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "uruP210_036", String = "Der vierte Zeiger muss nach links ausgerichtet werden."},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{53;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerD", Value = 1, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 55},
		}}

	OnAnswer{55;
		Conditions = {
			IsGlobalCounter{Name = "g_P210_PointerD", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "uruP210_037", String = "Der vierte Zeiger muss nach unten ausgerichtet werden."},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{55;
		Conditions = {
			Negated(IsGlobalCounter{Name = "g_P210_PointerD", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "uruP210_038", String = "Der vierte Zeiger muss nach rechts ausgerichtet werden."},
			Answer{Tag = "", String = "", AnswerId = 57},
		}}

	OnAnswer{57;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 58},
		}}

	OnAnswer{58;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P210_UruMenhirComboGiven"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 59},
		}}

	OnAnswer{59;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 60},
		}}

	OnAnswer{60;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 61},
		}}

	OnAnswer{61;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{62;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 63},
		}}

	OnAnswer{63;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 64},
		}}

	OnAnswer{64;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{65;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 66},
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
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{68;
		Conditions = {
			IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 1, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 69},
		}}

	OnAnswer{68;
		Conditions = {
			Negated(IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 1, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 103},
		}}

	OnAnswer{69;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 70},
		}}

	OnAnswer{70;
		Conditions = {
			IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceCDone"},
			
		UND9
		{
		IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceDDone"},
		IsGlobalFlagTrue{ Name = "g_P210_ZerbitsRoom2Spawn"},
		}
		,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uruP210_040PC", String = "Wer waren diese Zerbiten?", AnswerId = 71, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uruP210_054PC", String = "Was hat es mit den Wächtern auf sich, von denen Ihr spracht?", AnswerId = 86},
			OfferAnswer{Tag = "uruP210_060PC", String = "Wovon sprechen diese Geister?", AnswerId = 92, Color = ColorDarkOrange},
		}}

	OnAnswer{70;
		Conditions = {
			IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceCDone"},
			Negated(
		UND9
		{
		IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceDDone"},
		IsGlobalFlagTrue{ Name = "g_P210_ZerbitsRoom2Spawn"},
		}
		),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uruP210_040PC", String = "Wer waren diese Zerbiten?", AnswerId = 71, Color = ColorDarkOrange},
			OfferAnswer{Tag = "uruP210_054PC", String = "Was hat es mit den Wächtern auf sich, von denen Ihr spracht?", AnswerId = 86},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceCDone"}),
			
		UND9
		{
		IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceDDone"},
		IsGlobalFlagTrue{ Name = "g_P210_ZerbitsRoom2Spawn"},
		}
		,
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uruP210_054PC", String = "Was hat es mit den Wächtern auf sich, von denen Ihr spracht?", AnswerId = 86},
			OfferAnswer{Tag = "uruP210_060PC", String = "Wovon sprechen diese Geister?", AnswerId = 92, Color = ColorDarkOrange},
		}}

	OnAnswer{70;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceCDone"}),
			Negated(
		UND9
		{
		IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceDDone"},
		IsGlobalFlagTrue{ Name = "g_P210_ZerbitsRoom2Spawn"},
		}
		),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uruP210_054PC", String = "Was hat es mit den Wächtern auf sich, von denen Ihr spracht?", AnswerId = 86},
		}}

	OnAnswer{71;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_041", String = "Sie waren ein Magierorden, einer der größten des Imperiums. Während die Truppen des Kaisers in den Burgen entlang des Dunkelwehrgebirges Wache hielten, forschten die Zerbiten in ihren eigenen Festungen nach Mitteln, die dunklen Kräfte des Dschungels abzuwehren."},
			Answer{Tag = "", String = "", AnswerId = 72},
		}}

	OnAnswer{72;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_042", String = "Dies hier ist eine von ihnen, die Heimfeste des Grossmeisters Anktahr, des Herrn der Zerbiten. Hier sammelten sie  viele Jahre lang Wissen über die Geheimnisse des schwarzen Dschungels."},
			Answer{Tag = "", String = "", AnswerId = 73},
		}}

	OnAnswer{73;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_043", String = "Ich kann ihre Geister noch wispern hören und ihre Federn auf den Pergamenten kratzen, auf denen sie ihr Wissen niederschrieben. Ein Wissen, das heute kein Sterblicher mehr besitzt!"},
			Answer{Tag = "", String = "", AnswerId = 74},
		}}

	OnAnswer{74;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_044", String = "Eine Gruppe Zerbiten war es, die den Knochentempel Zarachs im Dschungel fand! Doch der Tempel hat sie alle getötet, bis auf einen, der tagelang allein durch das unheilige Gemäuer irrte!"},
			Answer{Tag = "", String = "", AnswerId = 75},
		}}

	OnAnswer{75;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_045", String = "Erst viel später entfloh er dem Tempel und gelangte schließlich zu dieser Feste. Sein Gesicht war eine starre Fratze der Angst, der Tempel hatte seinen Geist zu Wahnsinn verbrannt!"},
			Answer{Tag = "", String = "", AnswerId = 76},
		}}

	OnAnswer{76;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_046", String = "Als er sich nach Tagen erholte, war er ein anderer! Er warf seine Zerbitengewänder ab und forderte von seinen Brüdern Gehorsam!"},
			Answer{Tag = "", String = "", AnswerId = 77},
		}}

	OnAnswer{77;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_047", String = "Seine Zauberkraft war gewaltig, die Macht des Tempels hatte ihn völlig durchdrungen! Er verfolgte die Zerbiten, die daraufhin ihre Festungen verschlossen um dem Verräter ihr geheimstes Wissen zu entziehen!"},
			Answer{Tag = "", String = "", AnswerId = 78},
		}}

	OnAnswer{78;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_048", String = "Sie sicherten sie mit Fallen und Rätseln, denn sie wussten, dass keine Mauer ihn halten würde! So tötete der Verräter sie alle, er hat die Geheimnisse dieser Orte nie ergründen können!"},
			Answer{Tag = "", String = "", AnswerId = 79},
		}}

	OnAnswer{79;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_049", String = "Er zog sich in den Knochentempel zurück und brütete dort alleine für  viele Jahre, bis er schließlich nach Norden ins Imperium und dann nach Fiara ging, um seine Macht zu erproben."},
			Answer{Tag = "", String = "", AnswerId = 80},
		}}

	OnAnswer{80;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_050", String = "Jener Zerbit galt als größter Totenbeschwörer seiner Zeit und brachte viel Leid unter die Völker. Später zwang man ihn, sich einem Bund anzuschließen, der seiner Macht kontrollieren sollte. Der Zirkel."},
			Answer{Tag = "uruP210_051PC", String = "Und sein Name ... war Hokan Ashir?", AnswerId = 81},
		}}

	OnAnswer{81;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_052", String = "Recht habt ihr! Schon lange wispern die Winde von seiner Rückkehr! Denn hier, in Xu, erüllt sich sein Schicksal!"},
			Answer{Tag = "", String = "", AnswerId = 82},
		}}

	OnAnswer{82;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_053", String = "Si wie auch das Eure, Runenkrieger!"},
			Answer{Tag = "", String = "", AnswerId = 83},
		}}

	OnAnswer{83;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P210_UruDialogChoiceCDone"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 84},
		}}

	OnAnswer{84;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 85},
		}}

	OnAnswer{85;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 70},
		}}

	OnAnswer{86;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_055", String = "Sie sind äußerst mächtig und gefährtlich. Achtet darauf, dass sie Euch nicht entdecken."},
			Answer{Tag = "uruP210_056PC", String = "Ich werde mit ihnen schon fertig!", AnswerId = 87},
		}}

	OnAnswer{87;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_057", String = "Täuscht Euch nicht. Ihr könnt sie nicht auf gewöhnlichem Weg bekämpfen."},
			Answer{Tag = "uruP210_058PC", String = "Gibt es denn keinen Weg, sie zu vernichten?", AnswerId = 88},
		}}

	OnAnswer{88;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_059", String = "Sie bewachen neun Kisten. Vielleicht solltet Ihr Euch diese näher ansehen ..."},
			Answer{Tag = "", String = "", AnswerId = 89},
		}}

	OnAnswer{89;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 90},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 70},
		}}

	OnAnswer{92;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_061", String = "Ankthar! Sie haben ihn erkannt! Sie rufen nach ihm!"},
			Answer{Tag = "", String = "", AnswerId = 93},
		}}

	OnAnswer{93;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_062", String = "Hokan hat seine Seele gefangen gehalten, seit dem Anktahr es wagte, ihm  Widerstand zu leisten!"},
			Answer{Tag = "", String = "", AnswerId = 94},
		}}

	OnAnswer{94;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_063", String = "Damals gelang es Anktahr, Hokan lange in die Irre zu führen, so dass seine Brüder Zeit hatten, ihre Festungen mit Fallen zu sichern!"},
			Answer{Tag = "", String = "", AnswerId = 95},
		}}

	OnAnswer{95;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_064", String = "Dafür hat Hokan geschworen, Anktahr auf ewig zu quälen! Und als der Zirkel die Runen erschuf, schmiedete Hokans Anktahrs Seele an seine erste Rune und machte ihn so zu seinem Diener auf ewig!"},
			Answer{Tag = "", String = "", AnswerId = 96},
		}}

	OnAnswer{96;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_065", String = "Die Jahrhunderte der Seelengefangenschaft haben Aktahrs Geist ausgebrannt ... er ist nur noch ein Zerrbild, ein mordender Schatten seiner selbst!"},
			Answer{Tag = "uruP210_066PC", String = "Und sie wollen, dass ich ihn frei gebe?", AnswerId = 97},
		}}

	OnAnswer{97;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_067", String = "Ja! Damit er endlich Ruhe findet, er hat genug gelitten."},
			Answer{Tag = "uruP210_068PC", String = "Werde ich auch einmal Frieden finden, Uru?", AnswerId = 98},
		}}

	OnAnswer{98;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_069", String = "Der Krieg und Ihr, ihr seid verbunden, so wie Eure Seele mit der Rune! Wo er ist, er wird Euch rufen und wohin immer Ihr auch wandelt, wird er Euch folgen! Er ist das blutige Laken, auf dem Ihr diese Welt beschreitet!"},
			Answer{Tag = "", String = "", AnswerId = 99},
		}}

	OnAnswer{99;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_070", String = "Ob Euer Schicksal nun Friede, ewiger Kampf oder Tod ist, ich weiß es nicht. Aber wenn Ihr die Möglichkeit habt, gebt Ankthar frei! Damit wenigstens er ruhen kann!"},
			Answer{Tag = "", String = "", AnswerId = 100},
		}}

	OnAnswer{100;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P210_UruDialogChoiceDDone"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 101},
		}}

	OnAnswer{101;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 102},
		}}

	OnAnswer{102;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 70},
		}}

	OnAnswer{103;
		Conditions = {
			IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 2, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 104},
		}}

	OnAnswer{103;
		Conditions = {
			Negated(IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 2, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 117},
		}}

	OnAnswer{104;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 105},
		}}

	OnAnswer{105;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uruP210_071PC", String = "Was hat es mit dieser Spinnengrube auf sich?", AnswerId = 106},
			OfferAnswer{Tag = "uruP210_075PC", String = "Diese Schalter, Hebel und Menhire treiben mich in den Wahnsinn!", AnswerId = 111},
		}}

	OnAnswer{106;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_072", String = "Die oberste Spinne bewacht den Schlüssel, der tiefer in das Gewölbe führt."},
			Answer{Tag = "", String = "", AnswerId = 107},
		}}

	OnAnswer{107;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_073", String = "Falls Ihr sie nicht besiegen könnt ... vielleicht findet Ihr ja noch einen anderen Weg. Einen, der nicht an den Spinnen vorbei führt."},
			Answer{Tag = "uruP210_074PC", String = "Wir werden sehen.", AnswerId = 108},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 110},
		}}

	OnAnswer{110;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 105},
		}}

	OnAnswer{111;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_076", String = "Und genauso haben es die Zerbiten geplant."},
			Answer{Tag = "", String = "", AnswerId = 112},
		}}

	OnAnswer{112;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_077", String = "Doch falls Ihr Eurem Waffenarm und Eurer Zauberkunst mehr vertraut als Eurem Verstand, dann solltet Ihr Euch diesen Spinnen widmen."},
			Answer{Tag = "", String = "", AnswerId = 113},
		}}

	OnAnswer{113;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_078", String = "Sicherlich führt Euch der Weg durch die Grube ebenso ans Ziel wie der andere."},
			Answer{Tag = "", String = "", AnswerId = 114},
		}}

	OnAnswer{114;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 115},
		}}

	OnAnswer{115;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 116},
		}}

	OnAnswer{116;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 105},
		}}

	OnAnswer{117;
		Conditions = {
			Negated(IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 3, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 129},
		}}

	OnAnswer{117;
		Conditions = {
			IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 3, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 118},
		}}

	OnAnswer{118;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 119},
		}}

	OnAnswer{119;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uruP210_079PC", String = "Wo bin ich hier?", AnswerId = 120},
		}}

	OnAnswer{120;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_080", String = "Ihr befindet Euch direkt vor dem Tor einer der Schatzkammern."},
			Answer{Tag = "", String = "", AnswerId = 121},
		}}

	OnAnswer{121;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_081", String = "Doch dieses Tor ist gut gesichert. Seht Ihr die fünf Köpfe, die über uns thronen?"},
			Answer{Tag = "", String = "", AnswerId = 122},
		}}

	OnAnswer{122;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_082", String = "Erst wenn ihre Augen zur selben Zeit leuchten, wird sich das Tor öffnen."},
			Answer{Tag = "uruP210_083PC", String = "Wie kann ich die Augen dieser Steinköpfe zum Leuchten bringen?", AnswerId = 123},
		}}

	OnAnswer{123;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_084", String = "Von hier aus, wo wir stehen, ist es nicht möglich."},
			Answer{Tag = "", String = "", AnswerId = 124},
		}}

	OnAnswer{124;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_085", String = "An einem anderen Ort jedoch, tief in einem Labyrinth irgendwo in diesen Hallen, gibt es einen Mechanismus, der dies bewirken kann."},
			Answer{Tag = "uruP210_086PC", String = "Liegen alle Reichtümer und Artefakte der Zerbiten hinter diesem Tor?", AnswerId = 125},
		}}

	OnAnswer{125;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_087", String = "Nein, in diesem Gewölbe gibt es noch viel mehr geheime Schatzkammern als Ihr Euch vorstellen könnt."},
			Answer{Tag = "", String = "", AnswerId = 126},
		}}

	OnAnswer{126;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 127},
		}}

	OnAnswer{127;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 128},
		}}

	OnAnswer{128;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 119},
		}}

	OnAnswer{129;
		Conditions = {
			IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 4, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 130},
		}}

	OnAnswer{129;
		Conditions = {
			Negated(IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 4, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 137},
		}}

	OnAnswer{130;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 131},
		}}

	OnAnswer{131;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uruP210_088PC", String = "Was ist dies hier für eine seltsame Treppe?", AnswerId = 132},
		}}

	OnAnswer{132;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_089", String = "Steigt sie hinab, Ihr seid nur noch wenige Schritte vom Ausgang aus diesen Hallen entfernt."},
			Answer{Tag = "", String = "", AnswerId = 133},
		}}

	OnAnswer{133;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_090", String = "Doch hütet Euch davor, den Blutlachen und Gerippen zu nahe zu kommen."},
			Answer{Tag = "", String = "", AnswerId = 134},
		}}

	OnAnswer{134;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 135},
		}}

	OnAnswer{135;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 136},
		}}

	OnAnswer{136;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 131},
		}}

	OnAnswer{137;
		Conditions = {
			IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 5, Operator = IsEqual},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 138},
		}}

	OnAnswer{137;
		Conditions = {
			Negated(IsNpcCounter{Name = "npc_P210_UrusRespawning", Value = 5, Operator = IsEqual}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 151},
		}}

	OnAnswer{138;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 139},
		}}

	OnAnswer{139;
		Conditions = {
			IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceEDone"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uruP210_091PC", String = "Was ist in Xalabar gefahren?", AnswerId = 140, Color = ColorDarkOrange},
		}}

	OnAnswer{139;
		Conditions = {
			Negated(IsGlobalFlagFalse {Name = "g_P210_UruDialogChoiceEDone"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{140;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_092", String = "Er hat Angst. Angst um sein Volk, Angst vor der Zukunft und Angst vor den wandelnden Toten."},
			Answer{Tag = "", String = "", AnswerId = 141},
		}}

	OnAnswer{141;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_093", String = "Er wird nie über die Kathai herrschen, kein Szepter und kein Schwert kann das für ihn erwirken!"},
			Answer{Tag = "", String = "", AnswerId = 142},
		}}

	OnAnswer{142;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_094", String = "Er wird seine Strafe bekommen, seid Euch gewiss! Keiner vergeht sich gegen das Wort des Khal!"},
			Answer{Tag = "", String = "", AnswerId = 143},
		}}

	OnAnswer{143;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_095", String = "Aber wenn es Eurer Sache dient, so bringt ihm das Szepter, vielleicht ist es Zeit, dass es zu meinem Volk zurückkehrt."},
			Answer{Tag = "uruP210_096PC", String = "Hat dieses Szepter wirklich Macht?", AnswerId = 144},
		}}

	OnAnswer{144;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_097", String = "Der Windstein, der in das Szepter eingebunden ist, soll mit den Stimmen der Windgötter sprechen. Man sagt, wer ihre Stimmen hören kann, dem stehen sie im Kampfe bei."},
			Answer{Tag = "", String = "", AnswerId = 145},
		}}

	OnAnswer{145;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_098", String = "Die ersten Khals trugen das Szepter ... viele Legenden ranken sich darum, Aber wir Urus wissen, dass es nur Leid über unser Volk gebracht hat."},
			Answer{Tag = "", String = "", AnswerId = 146},
		}}

	OnAnswer{146;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_099", String = "Die Zerbiten haben es uns nicht gestohlen, wie viele sagen ... wir haben es ihnen gebracht, auf dass sie uns vor seinem Unheil beschützen sollten!"},
			Answer{Tag = "uruP210_100PC", String = "Aber trägt es nicht die Stimme Eurer Götter?", AnswerId = 147},
		}}

	OnAnswer{147;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_101", String = "Die Uru ist die Stimme der Götter ... dieses Szepter ist nur ein Symbol der Männer, geschaffen um die Traditionen der Urus zu entmachten!"},
			Answer{Tag = "", String = "", AnswerId = 148},
		}}

	OnAnswer{148;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uruP210_102", String = "Sollte es Xalabar wieder unter mein Volk bringen, wird er meinen Zorn zu spüren bekommen!"},
			Answer{Tag = "", String = "", AnswerId = 149},
		}}

	OnAnswer{149;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P210_UruDialogChoiceEDone"},
			RemoveDialog{NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 150},
		}}

	OnAnswer{150;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{150;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{151;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{151;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end