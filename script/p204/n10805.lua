-->INFO: Barbadar
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	Conditions = {},

	Actions =
	{
		ChangeRace{Race = 152, NpcId = self},
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_10805"},		
	}
}


--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = West}
--!EDS ONIDLEGOHOME END




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P204\n10805_Barbadar.txt


	

	-- 3 globale flags steuern das an/abschalten eines NPC Dialogs
	-- die flags lösen die entspr. aktion aus und werden dabei wieder auf false gesetzt
	-- dies sind die flags, nach dem underscore kommt die NpcId:
	-- SetGlobalFlagTrue{Name = "PleaseRemoveDialog_1234"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_5678"},
	-- SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_8844"},
	AddDialogToggleSystem()


	OnBeginDialog{
		Conditions = {
			UND(PlayerHasItem{ItemId = 7302, Amount = 4}, QuestState{QuestId = 966, State = StateActive}),
		},
		Actions = {
			Say{Tag = "barbadarP204_001", String = "Wie ich sehe, habt Ihr vier Froschleder gefunden!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 7302, Amount = 4}, QuestState{QuestId = 966, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barbadarP204_002", String = "Könnte ich sie haben?"},
			OfferAnswer{Tag = "barbadarP204_003PC", String = "Natürlich! Hier nehmt!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barbadarP204_004", String = "Wunderbar! Ihr seid eine große Hilfe Freund! Hier, nemt den ersten Teil des Satzes, den ich Euch versprochen hatte! Eine Haube, die göttliche Runen trägt!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 7302, Amount = 4, Flag = Take}, QuestSolve{QuestId = 967},
			TransferXP {XP = 3000, Flag = Give}, TransferItem {GiveItem = 4575, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{5;
		Conditions = {
			UND(PlayerHasItem{ItemId = 7312, Amount = 4}, QuestState{QuestId = 966, State = StateActive}),
		},
		Actions = {
			Say{Tag = "barbadarP204_005", String = "Ist das Purpursand?"},
			Answer{Tag = "barbadarP204_006PC", String = "Vier Handvoll, wie Ihr es wolltet.", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 7312, Amount = 4}, QuestState{QuestId = 966, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barbadarP204_007", String = "Oh, mein Herz springt vor Freude! Darf ich ihn haben, Freund?"},
			OfferAnswer{Tag = "barbadarP204_008PC", String = "Ich ahbe keine Verwendung dafür. Nehmt!", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barbadarP204_009", String = "Oh, dank ihr Ahnen! Bald bin ich gerettet! Hier, für Eure treuen Dienste, die Beinkleider des Satzes! Passen sie nicht wunderbar zu der Haube?"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 7312, Amount = 4, Flag = Take}, QuestSolve{QuestId = 968},
			TransferXP {XP = 3000, Flag = Give}, TransferItem {GiveItem = 4577, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{10;
		Conditions = {
			UND(PlayerHasItem{ItemId = 7313, Amount = 4}, QuestState{QuestId = 966, State = StateActive}),
		},
		Actions = {
			Say{Tag = "barbadarP204_010", String = "Sagt nur, Ihr habt Nachtschatten gefunden?"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(UND(PlayerHasItem{ItemId = 7313, Amount = 4}, QuestState{QuestId = 966, State = StateActive})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barbadarP204_011", String = "Oh, bitte, gebt ihn mir, edler Freund! Dann bin ich der glücklichste Mann auf dieser Welt!"},
			OfferAnswer{Tag = "barbadarP204_012PC", String = "Natürlich! Hier, vier Stücke Nachtschattenseide.", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barbadarP204_013", String = "Ihr seid ein Held! Endlich kann Barbadar wieder Waren liefern! Mein Leben ist gerettet!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barbadarP204_014", String = "Hier, als letzten Teil des Satzes sollt Ihr nun das Gewandt erhalten! Mögen seine göttlichen Runen Euch schützen! Immerhin sind es ja auch Eure Götter!"},
			Answer{Tag = "barbadarP204_015PC", String = "Danke! Viel Glück mit Eurem Handel, Barbadar. Lebt wohl!", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			TransferItem {TakeItem = 7313, Amount = 4, Flag = Take}, QuestSolve{QuestId = 969},
			TransferXP {XP = 3000, Flag = Give}, TransferItem {GiveItem = 4576, Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
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
			IsPlayerFlagTrue{Name = "FlagBarbadarKnown"},
		},
		Actions = {
			Say{Tag = "barbadarP204_016", String = "Habt Ihr schon etwas gefunden?"},
			Answer{Tag = "barbadarP204_017PC", String = "Nein, noch nicht Barbadar. Zumindest noch nicht vier der gleichen Art, wie Ihr es braucht.", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "FlagBarbadarKnown"}),
		},
		Actions = {
			Say{Tag = "barbadarP204_019", String = "Seid gegrüßt! Eure Ahnen mögen huldvoll auf Euch herabblicken und der Glanz des Kaisers möge Euch erleuchten!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barbadarP204_018", String = "Ach, schade, schade! Der Haushofmeister des Kaisers lässt mich bestimmt auspeitschen ..."},
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
			Say{Tag = "barbadarP204_020", String = "Und möge Euer Schicksal Euch stets auf die goldenen Strassen des Sieges führen!"},
			Answer{Tag = "barbadarP204_021PC", String = "Ihr klingt, als wolltet Ihr mir gleich etwas verkaufen.", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barbadarP204_022", String = "Ach, nein, das ist nur Gewohnheit. Ich habe nichts mehr zum verkaufen, ich bin verloren! Bald werde ich betteln müssen!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barbadarP204_023", String = "Ich fertige die besten Tuch- und Lederwaren hier in Empyria! Zumindest habe ich das, bis der Dryadenhain gesperrt uwrde und die Hazim begonnen ahben die Stadft zu belagern!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barbadarP204_024", String = "Nun gibt es kein Froschleder mehr auf dem Markt! Keinen Purpursand zum Färben! Keine Nachtschattenseide zum Einweben! ich bin ruiniert! Oh, Ahnen, nehmt mich zu Euch!"},
			Answer{Tag = "barbadarP204_025PC", String = "Ich reise viel, sollte ich irgendwo Froschleder, Purupursand oder Nachtschattenseide entdecken, seit Ihr der erste der es bekommt.", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "barbadarP204_026", String = "Wirklich? Oh, danke, edler Freund! Ich benötige nur vier von jedem, dann kann ich dem Palast wieder lefern! Und ich werde Euch mit einem magischen Gewandtsatz belohnen, verpsprochen!"},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBarbadarKnown"},
			SetGlobalFlagTrue{Name = "g_P204_BardabarSidequest"}, QuestBegin{QuestId = 966}, QuestBegin{QuestId = 967}, QuestBegin{QuestId = 968}, QuestBegin{QuestId = 969},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end