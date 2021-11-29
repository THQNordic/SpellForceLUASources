-->INFO: Sklavenhaendler
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OneTimeInitAction (ChangeRace {Race = 152, NpcId = self})

--Outcries Sklavenh�ndler.
OnPlatformOneTimeEvent
{
	Conditions = 
	{ 
		AvatarInRange {X = 167, Y = 130, Range = 10},
	},
	Actions = 
	{ 
		Outcry {NpcId = 9346, String = "Seht her, neue Waren im Angebot!" , Tag = "oca2trainerP200_001" , Delay = TRUE , Color = ColorWhite},
	}
}

OnPlatformOneTimeEvent
{
	Conditions = 
	{ 
		AvatarInRange {X = 167, Y = 130, Range = 10},
		IsGlobalCounter {Name = "g_cnP200FightsWon", Value = 5, Operator = IsGreaterOrEqual},
	},
	Actions = 
	{ 
		Outcry {NpcId = 9346, String = "Ah! Neue Waren! Kommt her und seht!" , Tag = "oca2trainerP200_002" , Delay = TRUE , Color = ColorWhite},
	}
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P200\n9346_Sklavenhaendler.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags l�sen die entspr. aktion aus und werden dabei wieder auf false gesetzt
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
			Say{Tag = "trainerP200_001", String = "Habt ihr euch f�r einen Steiter entschieden?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "known"}),
		},
		Actions = {
			Say{Tag = "trainerP200_002", String = "Seid gegr��t, Freund."},
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
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "trainerP200_003", String = "Ich habe hier etwas, das Euch sicher gefallen wird! Die besten Streiter Eos, f�r Euch k�uflich zu erwerben!"},
			Answer{Tag = "trainerP200_004PC", String = "Ihr seid ein Sklavenh�ndler?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "trainerP200_005", String = "Nein, nein! Ich ... vermittle K�mpfer, wisst Ihr? S�ldner sozusagen."},
			Answer{Tag = "trainerP200_006PC", String = "Was f�r K�mpfer sind das?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "trainerP200_007", String = "Ich glaube die Sterblichen nennen sie ... Titanen. M�chtige Wesen! Ich habe alle Arten davon hier!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "trainerP200_008", String = "Ihr k�nnt sie bei mir erwerben, sie werden Euch dann im Kampf in der Arena unterst�tzen!"},
			Answer{Tag = "trainerP200_009PC", String = "Wie teuer ist so eine Kreatur?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "trainerP200_010", String = "Nun, ich gebe zu, sie sind nicht ganz billig ... aber Ihr k�nnt ja erst einmal mit einem schw�cheren Exemplar anfangen! Die bekommt Ihr schon zu recht erschwinglichen Preisen!"},
			Answer{Tag = "trainerP200_011PC", String = "Ihr habt also st�rkere und schw�chere Titanen im ... Angebot?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "trainerP200_012", String = "Ja! Ich nenne das 'Ausblidungsgrad'. Treffend, nicht wahr?"},
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
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name="known"},
			Say{Tag = "", String = ""},
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
			ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	},
		},
		Actions = {
			Say{Tag = "oca2trainerP200_003", String = "Ihr habt nicht genug Gold!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_013PC", String = "Ich m�chte den Felsenschmied Ausbildungsgrad 1 (ca. Level 30) f�r 2000 Gold kaufen.", AnswerId = 16},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_015PC", String = "Ich m�chte den Feuerteufel Ausbildungsgrad 2 (ca. Level 35) f�r 2500 Gold kaufen.", AnswerId = 19},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_017PC", String = "Ich m�chte die Spinnenbrut Ausbildungsgrad 3 (ca. Level 40) f�r 3000 Gold kaufen.", AnswerId = 22},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_019PC", String = "Ich m�chte den Greifenreiter Ausbildungsgrad 4 (ca. Level 45) f�r 4000 Gold kaufen.", AnswerId = 25},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_020PC", String = "Ich m�chte den Baumw�chter Ausbildungsgrad 5 (ca. Level 47) f�r 4500 Gold kaufen.", AnswerId = 29},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_021PC", String = "Ich m�chte den Zyklopen Ausbildungsgrad 6 (ca. Level 50) f�r 5000 Gold kaufen.", AnswerId = 32},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(ODER9
	{
		UND9{Negated(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}), IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"}},
		UND9{Negated(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}), IsGlobalFlagTrue{Name = "g_sP200ZwergGekauft"},IsGlobalFlagTrue{Name = "g_sP200DemonGekauft"}, IsGlobalFlagTrue{Name = "g_sP200SpinneGekauft"}, IsGlobalFlagTrue{Name = "g_sP200GreifGekauft"}, IsGlobalFlagTrue{Name = "g_sP200BaumGekauft"}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"}},
	}),
			Negated(UND(PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200ZwergGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200DemonGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200SpinneGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200GreifGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200BaumGekauft"})),
			Negated(UND(PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0}, IsGlobalFlagFalse{Name = "g_sP200OgerGekauft"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "trainerP200_022PC", String = "Ich will mir Eure Kreaturen erst einmal ansehen.", AnswerId = 35},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "trainerP200_014", String = "Er wird Euch ab der n�chsten Runde zur Seite stehen."},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name="g_sP200ZwergKaufen"},
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
			Say{Tag = "trainerP200_016", String = "Er wird Euch in der n�chsten Runde zur Seite stehen."},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name="g_sP200DemonKaufen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "trainerP200_018", String = "Sie wird Euch in der n�chsten Runde zur Seite stehen."},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name="g_sP200SpinneKaufen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "trainerP200_016", String = "Er wird Euch in der n�chsten Runde zur Seite stehen."},
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
		},
		Actions = {
			SetGlobalFlagTrue{Name="g_sP200GreifKaufen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			Say{Tag = "trainerP200_016", String = "Er wird Euch in der n�chsten Runde zur Seite stehen."},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name="g_sP200BaumKaufen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			Say{Tag = "trainerP200_016", String = "Er wird Euch in der n�chsten Runde zur Seite stehen."},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name="g_sP200OgerKaufen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "trainerP200_023", String = "Ganz wie Ihr wollt mein Freund, sie sind gleich hier in ihren Kammern untergebracht!"},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{36;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end