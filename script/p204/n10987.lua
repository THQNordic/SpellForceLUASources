-->INFO: AlyahQueen
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211_CSIshtargelaufen", UpdateInterval = 20},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P204_AlyahKaiserin"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_8849"},	
		SetGlobalFlagTrue{Name = "g_P204_ArenawachenTotUndTorAuf"},			
	},
}


OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
	}
}


--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = South}
--!EDS ONIDLEGOHOME END



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n10987_AlyahQueen.txt


	

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
			Say{Tag = "alyah_queenP204_001", String = "Verbeugt Euch bloss nicht!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagTrue{Name = "known"}),
		},
		Actions = {
			Say{Tag = "alyah_queenP204_002", String = "Runenkrieger! Ich hätte nicht geglaubt, Euch noch einmal wieder zu sehen!"},
			Answer{Tag = "alyah_queenP204_003PC", String = "Ich konnte mir einen Blick auf die frischgebackene Kaiserin doch nicht entgehen lassen, Euer Hoheit!", AnswerId = 4},
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
			OfferAnswer{Tag = "alyah_queenP204_008PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7, Color = ColorDarkOrange},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyah_queenP204_004", String = "Werdet Ihr wohl aufhören mich so zu nennen! Ich bin immer noch Alyah!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyah_queenP204_005", String = "Es reicht wenn mein Hofstaat hier so herumsäuselt, alte Freunde bleiben alte Freunde! ist das klar?"},
			Answer{Tag = "alyah_queenP204_006PC", String = "Jawohl Euer ...Alyah.", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "known"},
			Say{Tag = "alyah_queenP204_007", String = "Na also!"},
			OfferAnswer{Tag = "alyah_queenP204_008PC", String = "Wie fühlt Ihr Euch?", AnswerId = 7, Color = ColorDarkOrange},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyah_queenP204_009", String = "Es ist schon seltsam, nach all den Jahren auf der Strasse wieder hierher zu kommen ..."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyah_queenP204_010", String = "Jetzt muss ich erst einmal Vaters Pomp und Prunk hier herausschaffen! Dieser ganze Palast ist einfach ... unpraktisch! Wer soll sich denn hier wohlfülen?"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyah_queenP204_011", String = "Schlaft Ihr gut auf goldenen Betten? Ich nicht! Und Zaunköniglebern in Aspik ... ich sage Euch so etwas widerliches habt Ihr noch nie gegessen! Aber das wird jetzt alles anders!"},
			Answer{Tag = "alyah_queenP204_012PC", String = "Ich schätze Euer Haushofmeister hat eine schwere Zeit vor sich ...", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyah_queenP204_013", String = "Ha! Der ist in den letzen Tagen so oft aus der Haut gefahren, dass er eigentlich gleich hätte draussen bleiben können! Aber er wird sich daran gewöhnen, alle werden sich daran gewöhnen!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyah_queenP204_014", String = "Traurig ist nur, das Mutter dies alles nicht mehr sehen kann ... und das alle immer so fruchtbar untertänig und freundlich sind! Da ist niemand, den man mal ein wenig necken kann, so wie Euch oder Urias."},
			Answer{Tag = "alyah_queenP204_015PC", String = "Macht hat immer Ihren Preis. Das werden die Zirklemagier auch bald lernen!", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyah_queenP204_016", String = "Ja, das wird dann das Ende Eurer Reise ... Ich glaube meine fängt gerade erst an!"},
			Answer{Tag = "alyah_queenP204_017PC", String = "Das glaube ich auch, Alyah.", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyah_queenP204_018", String = "Wisst Ihr was? Ich werde hier eine Niederlassung des Ordens des Erwachens einrichten lassen! Und ich werde sie Euch und Urias widmen!"},
			Answer{Tag = "alyah_queenP204_019PC", String = "Ich glaube, das ist das größte Geschenk, dass Ihr Urias machen könnt.", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyah_queenP204_020", String = "Ja, das hätte ihm wohl gefallen. Dieser verdammte Dummkopf, warum hat er auch sein Leben so sinnlos weggeworfen!"},
			Answer{Tag = "alyah_queenP204_021PC", String = "Damit Ihr lebt! Und damit Ihr heute hier steht, anstatt weiter vor Euch selbst wegzulaufen.", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyah_queenP204_022", String = "Ich wünschte, ich könnte ihn zurückholen. Was ist mit Euch? Bleibt Ihr wenigstens noch eine Weile?"},
			Answer{Tag = "alyah_queenP204_023PC", String = "Nein, ich muss es jetzt zu Ende bringen. Der Zirkel muss diesmal endgültig fallen!", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "alyah_queenP204_024", String = "Dann lebt wohl, Runenkrieger. Empyria wird Euch nicht vergessen."},
			Answer{Tag = "alyah_queenP204_025PC", String = "Lebt wohl, Kaiserin!", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "PleaseRemoveDialog_" .. NpcId},
			EndDialog(),
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end