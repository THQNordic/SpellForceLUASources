-->INFO: Gefangener
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Npc Ist gefangen, also KettenPFX
OneTimeInitAction(SetEffect {Effect = "Chain", Length = 0, TargetType = Figure, NpcId = self})
OneTimeInitAction(SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8486"})

OneTimeInitAction(ChangeRace {Race = 152})


OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			FigureDead {NpcId = 10282},	
			FigureDominated {NpcId = 10282},
		},
		ODER9
		{
			FigureDead {NpcId = 10283},
			FigureDominated {NpcId = 10283},
		},
		ODER9
		{
			FigureDead {NpcId = 10284},
			FigureDominated {NpcId = 10284},
		},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_8486" }
	}
}

-- Wenn der Bursch frei ist und der SPieler den Geheimweg will, geht Npc da hin
OnIdleGoHome
{
	X = 394, Y = 216, WalkMode = Run, Direction = 2,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_n_P203_TorOeffnen"},
		--IsNpcFlagTrue {Name = "n_P203GefangenerImDorf"},
	},
	Actions =
	{
		StopEffect {TargetType = Figure, NpcId = 8486},
	},
	HomeActions =
	{
		SetGlobalFlagTrue {Name = "g_n_P203_TorOffen"}
	}
}

-- Wenn der Bursche frei ist und der Spieler will Resourcen, geht Npc ins Dorf
OnIdleGoHome
{
	X = 310, Y = 250, WalkMode = Run, Direction = 2,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8486" },
	}
}

-- Dialog aus, wenn der Spieler das erste mal mit dem Gefangenen geredet hat
OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			IsGlobalFlagTrue {Name = "g_n_P203_TorOeffnen"},
			IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}
		}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8486" },
	}
} 



---- Ist der Gefangene an der Blockade wird der Dialog wieder angeschaltet
---- Dialog aus, wenn der Spieler mit dem Gefangenen geredet hat
--OnOneTimeEvent
--{
--	Conditions =
--	{
--		IsGlobalFlagTrue {Name = "g_n_P203_TorOffen"}
--	},
--	Actions =
--	{
--		SetGlobalFlagTrue {Name = "PleaseEnableMainQuestDialog_8486" },
--	}
--}

---- Ist der Gefangene an der Blockade wird der Dialog wieder angeschaltet
---- Dialog aus, wenn der Spieler mit dem Gefangenen geredet hat
--OnOneTimeEvent
--{
--	Conditions =
--	{
--		IsGlobalFlagTrue {Name = "g_P203SteineWeg"}
--	},
--	Actions =
--	{
--		SetGlobalFlagTrue {Name = "PleaseRemoveDialog_8486" },
--	}
--}

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_n_P203_UramNachHauseII"}, 
	}
}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p203\n8486_Gefangener.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags l�sen die entspr. aktion aus und werden dabei wieder auf false gesetzt
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
			Say{Tag = "uramP203_001", String = "Ah, endlich frei!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "known"}),
		},
		Actions = {
			Say{Tag = "uramP203_011", String = "Ah! Ihr seid's!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "g_nP201_PhoenixSteinSpieler"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "uramP203_008PC", String = "Ein Zwerg? Hier? In Xu?", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			IsGlobalFlagFalse{Name = "g_nP201_PhoenixSteinSpieler"},
		},
		Actions = {
			Say{Tag = "uramP203_002", String = "Potzdonner! Der Runenkrieger!"},
			Answer{Tag = "uramP203_003PC", String = "Gr��e, Uram! Ihr seid aber weit weg von Fastholme.", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uramP203_004", String = "Allerdings! Und verfluche mich jeden Tag daf�r! Nicht einmal Bier gibt es in diesen verdammten Land!"},
			Answer{Tag = "uramP203_005PC", String = "Was treibt Euch denn von den Bergen Fiaras hierher nach Xu?", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uramP203_006", String = "Ein Auftrag! Ich kam mit einigen meiner Leute her, um den Rabenpass freizusprengen. Aber wir wurden angegriffen und verstreut."},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uramP203_007", String = "Ich war auf dem Weg zur�ck um Verst�rkung zu holen, als diese Habim, oder wie sie heissen, mich hier festgesetzt haben! Niethalf zermalme sie!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uramP203_009", String = "Uram, Steinbrecher K�nig Ragnars aus Fastholme, zu Euren Diensten! Ha! Denen habt ihr's aber gezeigt!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uramP203_010", String = "Kann ich Euch meine Haut irgendwie verg�ten, Freund? Keiner soll sagen Uram w�re undankbar!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue {Name = "known"},
			StopEffect {NpcId = 8486}, SetRewardFlagTrue {Name = "Geheimweg"},
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
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{11;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uramP203_013", String = "Was? Das nennt Ihr eine Festung? Das ich nicht lache!"},
			Answer{Tag = "uramP203_014PC", String = "Gut, es ist keine Zwergenfeste, aber es wird dennoch viel Blut kosten sie zu st�rmen!", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uramP203_015", String = "Geht doch zu den Leuten im Dorf, dieser Lario, oder wie der heisst, der soll Euch etwas von Ihren Reserven geben! Immerhin habt Ihr das Dorf befreit, wenn ich das richitg sehe!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "g_P203_PlayerHasTakenResources"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "uramP203_018PC", String = "Werde ich tun. Wird er mir sie so einfach aush�ndigen?", AnswerId = 17},
		}}

	OnAnswer{14;
		Conditions = {
			IsGlobalFlagTrue{Name = "g_P203_PlayerHasTakenResources"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "uramP203_016PC", String = "Das habe ich bereits. Ich glaube er hat mir alles gegeben, was diese Leute entbehren k�nnen.", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uramP203_017", String = "Das alte Schlitzohr!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uramP203_019", String = "Sagt ihm einfach, er soll Euch die 'kaiserlichen Vorr�te' geben! Die halten sie n�mlich f�r harte Zeiten zur�ck!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uramP203_020", String = "Und will ich verflucht sein, wenn das hier keine harte Zeit ist!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue {Name = "n_P203_SpielerHatHandelBekommen"},
			SetGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 20},
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
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uramP203_022", String = "Nun, ich kenne einen geheimen Weg ins Lager dieser Habum ... Ach, der Feinde, Ihr wisst schon! Die Bunten, mit den T�chern auf dem Kopf!"},
			Answer{Tag = "uramP203_023PC", String = "Ich k�nnte also ihre Verteidigung umgehen?", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uramP203_024", String = "Richtig! Und ihnen mit Eurer Armee in den R�cken fallen! Es gibt einen ungesicherten Zugang zu ihrem Lager, ganz im Osten."},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uramP203_025", String = "Ich habe geh�rt, wie sie dar�ber sprachen! Sie haben ihn mit Felsen blockiert, haben sie gesagt. aber diese St�mper k�nnen doch mit Stein gar nicht umgehen!"},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uramP203_026", String = "Wie w�re es, wenn ich Euch diese st�mperhafte Steinblockade wegr�ume? Dann h�ttet Ihr einen neuen Angriffweg im Osten!"},
			Answer{Tag = "uramP203_027PC", String = "Gut, Uram! Ich folge Euch!", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_n_P203_TorOeffnen"},
			SetNpcFlagTrue {Name = "n_P203_SpielerHatHandelBekommen"},
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
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
		}}

	OnAnswer{30;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "uramP203_029", String = "Ha! Im Handumdrehen! Keine Herausforderung f�r einen echten Neithalfssohn! MIt Geschick und St�rke die richtigen Brocken bewegt ... schon ist der Weg frei!"},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "g_P203SteineWeg"},
			SetNpcFlagTrue{Name = "ChoiceMitAnswerId[31]Abgeschaltet"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{35;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
		}}

	OnAnswer{35;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{35;
		Conditions = {
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_012PC", String = "Diese Festung dort ... ich werde Hilfe brauchen, um sie einzunehmen ...", AnswerId = 12},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"},
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_021PC", String = "Wisst Ihr etwas �ber das Land, was mir nutzen k�nnte?", AnswerId = 24},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} ),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "uramP203_028PC", String = "K�nnen wir die Blockade l�sen?", AnswerId = 31},
		}}

	OnAnswer{35;
		Conditions = {
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(IsNpcFlagFalse {Name = "n_P203_SpielerHatHandelBekommen"}),
			Negated(UND( FigureInRange {NpcId = 8486, X = 394, Y = 216, Range = 4}, IsNpcFlagFalse{Name = "ChoiceMitAnswerId[31]Abgeschaltet"} )),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end