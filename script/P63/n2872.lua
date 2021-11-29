-->INFO: Goran
-->INFO: Coran
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 0}
--!EDS ONIDLEGOHOME END

REM = [[

OnOneTimeEvent
{
Conditions = {
		IsGlobalFlagTrue{Name = "PreviewVersion"}
			},
Actions = {
		RemoveDialog{}
		}
}
]]

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p63\n2872_Goran.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagGoranKnown"},
		},
		Actions = {
			Say{Tag = "goran001", String = "Was? Was wollt Ihr? Zieht Eures Weges und belästigt nicht rechtschaffene Bürger!"},
			Answer{Tag = "goran001PC", String = "Was tut Ihr hier?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGoranKnown"}),
			QuestState {QuestId = 330, State = StateActive},
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "goran004", String = "Was gibt es diesmal?"},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGoranKnown"}),
			QuestState {QuestId = 330, State = StateActive},
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "goran004", String = "Was gibt es diesmal?"},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGoranKnown"}),
			QuestState {QuestId = 330, State = StateActive},
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "goran004", String = "Was gibt es diesmal?"},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGoranKnown"}),
			QuestState {QuestId = 330, State = StateActive},
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "goran004", String = "Was gibt es diesmal?"},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGoranKnown"}),
			Negated(QuestState {QuestId = 330, State = StateActive}),
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "goran004", String = "Was gibt es diesmal?"},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGoranKnown"}),
			Negated(QuestState {QuestId = 330, State = StateActive}),
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "goran004", String = "Was gibt es diesmal?"},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGoranKnown"}),
			Negated(QuestState {QuestId = 330, State = StateActive}),
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "goran004", String = "Was gibt es diesmal?"},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagGoranKnown"}),
			Negated(QuestState {QuestId = 330, State = StateActive}),
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "goran004", String = "Was gibt es diesmal?"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "goran002", String = "Das seht Ihr doch: mich mit Dummköpfen wie Euch herumärgern! Und wenn dann noch Zeit bleibt, studiere ich alte Schriften und fertige Übersetzungen!"},
			Answer{Tag = "goran002PC", String = "Ihr seid ein Schriftgelehrter?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "goran003", String = "Nein, ich bin der Nachtwächter! Natürlich bin ich Schriftgelehrter! Und ein guter dazu! Also, was gibt es?"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagGoranKnown"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{4;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "goran005", String = "Der Schuster? Ich hätte nicht gedacht, dass ein Krieger im Auftrag eines Schusters unterwegs ist!?"},
			Answer{Tag = "goran005PC", String = "Sagen Euch die Worte Tar, Guar und Shin etwas? Vielleicht eine alte Sprache, die Ihr kennt?", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "goran006", String = "Hm, keine Sprache! Ein Name ist das! Ein alter, verhasster Name! Der Kindschlächter!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "goran007", String = "Sein Name war Shin Tar Guar, der letzte Hexer von Graufurt! In seiner Gier nach Macht erschlug er seine drei Söhne und opferte ihr Blut der roten Horde! Doch die Horde betrog ihn - wie so viele andere..."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "goran008", String = "Das war noch vor der Zeit des Zirkels! Die Bürger Graufurts vertrieben ihn, als sie von seiner Tat erfuhren! Verbittert floh er in eine Höhle und verschloss für immer ihren Eingang!"},
			Answer{Tag = "goran008PC", String = "Dann sind es die Stimmen seiner erschlagenen Söhne, die seinen Namen verdammen!", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "goran009", String = "Ja, verdammt soll er sein!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			QuestSolve {QuestId = 330}, QuestBegin {QuestId = 331} , SetRewardFlagTrue {Name = "EchosGoran"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "goran010", String = "Lasst es mich sehen!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "goran011", String = "Hm, hm... verschlüsselt! Ich kann zwar die Silben erkennen, aber keine Worte! Da müsst Ihr wohl jemand anderes aufsuchen..."},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "goran012", String = "Geht zu Darius Servil! Er lebt in Liannon. Er kennt die Verschlüsselungen der alten Gilden besser als ich. Redet mit ihm über das Buch!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			 QuestSolve {QuestId = 377}, QuestBegin {QuestId = 378}, StopFollow {Target = 0, NpcId = 2867}, SetGlobalFlagFalse{Name = "SandorMustFollowAvatar"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "goran013", String = "Zeigt mal her!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
			PlayerHasItem{ItemId = 3043},
		},
		Actions = {
			Say{Tag = "goran014", String = "Hm... Sieht nach einer Zauberformel der weißen Magie aus! Die Übersetzung wird gewiss nicht leicht! Aber gegen die Bezahlung eines Saphirs kann ich das erledigen, wenn Ihr möchtet!"},
			OfferAnswer{Tag = "goran014PC", String = "Ich hoffe, es lohnt sich! Hier nehmt den Stein!", AnswerId = 19},
			OfferAnswer{Tag = "goran017PCa", String = "Ich komme vielleicht darauf zurück!", AnswerId = 24},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3043}),
		},
		Actions = {
			Say{Tag = "goran014", String = "Hm... Sieht nach einer Zauberformel der weißen Magie aus! Die Übersetzung wird gewiss nicht leicht! Aber gegen die Bezahlung eines Saphirs kann ich das erledigen, wenn Ihr möchtet!"},
			OfferAnswer{Tag = "goran017PCa", String = "Ich komme vielleicht darauf zurück!", AnswerId = 24},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "goran015", String = "Nun, dann wollen wir mal sehen... hier, die Zeichen der Heilung... die sich schließende Wunde... die Kraft... der Strom des Lebens..."},
			Answer{Tag = "goran015PC", String = "Kommt Ihr voran?", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "goran016", String = "Seltsame Zeichen der Magie... was mag es bedeuten? Ah, hier... so könnte es gehen! Nun noch die letzten Zeilen..."},
			Answer{Tag = "goran016PC", String = "Und? Habt Ihr alles entziffern können?", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "goran017", String = "Ja, Euer Zauberspruch ist übersetzt! Hier habt Ihr die Schriftrolle!"},
			Answer{Tag = "goran017PC", String = "Vielen Dank!", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2899 , Flag = Take},
							 TransferItem{TakeItem = 3043 , Flag = Take},
							 TransferItem{GiveItem = 1878 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{23;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{23;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "goran018", String = "Gut, wie Ihr wollt! Hier, habt Ihr Eure Tafel zurück! Falls Ihr es Euch anders überlegt, Ihr wisst, wo Ihr mich finden könnt!"},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{25;
		Conditions = {
			QuestState {QuestId = 330, State = StateActive},
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran004PC", String = "Sandor schickt mich!", AnswerId = 5},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042},
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran009PC", String = "Ich habe hier ein Buch von Shin Tar Guar", AnswerId = 12},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			PlayerHasItem{ItemId = 2899},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "goran012PC", String = "Könnt Ihr die Schrift auf dieser Steintafel entziffern?", AnswerId = 17},
		}}

	OnAnswer{25;
		Conditions = {
			Negated(QuestState {QuestId = 330, State = StateActive}),
			Negated(QuestState {QuestId = 377, State = StateActive}, PlayerHasItem {ItemId = 3042}),
			Negated(PlayerHasItem{ItemId = 2899}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end