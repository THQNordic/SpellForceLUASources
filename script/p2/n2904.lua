-->INFO: Jenquai
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 6}
--!EDS ONIDLEGOHOME END



--Dialogsteuerung
--initial
OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetDialogType{Type = SideQuest}
		}
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p2\n2904_Jenquai.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagJenquaiKnown"},
		},
		Actions = {
			Say{Tag = "jenquai001", String = "Den G�ttern sei Dank! Endlich kommt jemand zu unserer Rettung!"},
			Answer{Tag = "jenquai001PC", String = "Was ist geschehen?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJenquaiKnown"}),
			QuestState{QuestId = 66 , State = StateUnknown},
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "jenquai003", String = "Bitte! Helft mir, Freund!"},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJenquaiKnown"}),
			QuestState{QuestId = 66 , State = StateUnknown},
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "jenquai003", String = "Bitte! Helft mir, Freund!"},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJenquaiKnown"}),
			QuestState{QuestId = 66 , State = StateUnknown},
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "jenquai003", String = "Bitte! Helft mir, Freund!"},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJenquaiKnown"}),
			QuestState{QuestId = 66 , State = StateUnknown},
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "jenquai003", String = "Bitte! Helft mir, Freund!"},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJenquaiKnown"}),
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "jenquai003", String = "Bitte! Helft mir, Freund!"},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJenquaiKnown"}),
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "jenquai003", String = "Bitte! Helft mir, Freund!"},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJenquaiKnown"}),
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "jenquai003", String = "Bitte! Helft mir, Freund!"},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagJenquaiKnown"}),
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "jenquai003", String = "Bitte! Helft mir, Freund!"},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJenquaiKnown"},
			Say{Tag = "jenquai002", String = "Tiermenschen haben uns �berfallen! Wir sind Freih�ndler! Wir waren auf dem Weg nach Liannon! Pl�tzlich kamen diese Bestien �ber uns! Sie haben alle verschleppt!"},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJenquaiKnown"},
			Say{Tag = "jenquai002", String = "Tiermenschen haben uns �berfallen! Wir sind Freih�ndler! Wir waren auf dem Weg nach Liannon! Pl�tzlich kamen diese Bestien �ber uns! Sie haben alle verschleppt!"},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJenquaiKnown"},
			Say{Tag = "jenquai002", String = "Tiermenschen haben uns �berfallen! Wir sind Freih�ndler! Wir waren auf dem Weg nach Liannon! Pl�tzlich kamen diese Bestien �ber uns! Sie haben alle verschleppt!"},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJenquaiKnown"},
			Say{Tag = "jenquai002", String = "Tiermenschen haben uns �berfallen! Wir sind Freih�ndler! Wir waren auf dem Weg nach Liannon! Pl�tzlich kamen diese Bestien �ber uns! Sie haben alle verschleppt!"},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJenquaiKnown"},
			Say{Tag = "jenquai002", String = "Tiermenschen haben uns �berfallen! Wir sind Freih�ndler! Wir waren auf dem Weg nach Liannon! Pl�tzlich kamen diese Bestien �ber uns! Sie haben alle verschleppt!"},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJenquaiKnown"},
			Say{Tag = "jenquai002", String = "Tiermenschen haben uns �berfallen! Wir sind Freih�ndler! Wir waren auf dem Weg nach Liannon! Pl�tzlich kamen diese Bestien �ber uns! Sie haben alle verschleppt!"},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJenquaiKnown"},
			Say{Tag = "jenquai002", String = "Tiermenschen haben uns �berfallen! Wir sind Freih�ndler! Wir waren auf dem Weg nach Liannon! Pl�tzlich kamen diese Bestien �ber uns! Sie haben alle verschleppt!"},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagJenquaiKnown"},
			Say{Tag = "jenquai002", String = "Tiermenschen haben uns �berfallen! Wir sind Freih�ndler! Wir waren auf dem Weg nach Liannon! Pl�tzlich kamen diese Bestien �ber uns! Sie haben alle verschleppt!"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jenquai004", String = "Jenseits des Steintores, s�dlich von hier, gibt es einen alten Steinbruch! Dort haben sie meine Gef�hrten eingeschlossen! Bitte, Ihr m�sst sie befreien!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jenquai005", String = "Die Bestien haben das Tor verschlossen! Es muss einen Weg geben, es zu �ffnen! Vielleicht kennen die Elfen einen Weg. Dies ist schlie�lich ihr Land!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "JenquaiOfferTwo"},
			QuestBegin{QuestId = 66} , QuestBegin{QuestId = 67},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jenquai006", String = "Die Tiermenschen haben uns an eine Bande Oger �bergeben und sich dann �ber unsere Ladung hergemacht! Die Oger warfen uns in den alten Steinbruch! Nur mir ist es bislang gelungen, zu fliehen!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetNpcFlagFalse{Name = "JenquaiOfferTwo"},
			Say{Tag = "jenquai007", String = "Bitte, �ffnet das Tor und sucht den Steinbruch im S�den! Erschlagt die Oger und befreit meine Gef�hrten! Ihr seid unsere letzte Hoffnung!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jenquai008", String = "Bei den G�ttern! Danke, Freund! Wir Freih�ndler sind kein reiches Volk! Ich hoffe, einer dieser Ringe hier wird Euch als Entlohnung gen�gen!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jenquai009", String = "Das Band des Streiters wurde einst von den Rittern Nortanders in der Schlacht getragen! Es vermag Euren Waffenarm zu st�rken!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jenquai010", String = "Der Ring des reinen Geistes war einst das Geschenk der talindischen Magiergilde an ihre Novizen! Er vermag Euren Geist zu st�rken und Eure Gedanken schneller flie�en zu lassen!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "jenquai011", String = "Der Ring der verbundenen Wege wurde einst f�r die Paladine Tiaras gefertigt! Er st�hlt Geist und K�rper!"},
			OfferAnswer{Tag = "jenquai011PC", String = "Gebt mir das Band des Streiters!", AnswerId = 13},
			OfferAnswer{Tag = "jenquai012PC", String = "Ich w�hle den Ring des reinen Geistes!", AnswerId = 15},
			OfferAnswer{Tag = "jenquai013PC", String = "Der Ring der verbundenen Wege soll mir gen�gen!", AnswerId = 17},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 636 , Flag = Give},
			SetPlayerFlagFalse{Name = "Q66RewardSentence"}, SetRewardFlagTrue{ Name = "DieFreihaendler"},
			Say{Tag = "jenquai012", String = "Es geh�rt Euch!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{14;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 640 , Flag = Give},
			SetPlayerFlagFalse{Name = "Q66RewardSentence"}, SetRewardFlagTrue{ Name = "DieFreihaendler"},
			Say{Tag = "jenquai013", String = "Nehmt ihn! Er soll Euch gute Dienste leisten!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 638 , Flag = Give},
			SetPlayerFlagFalse{Name = "Q66RewardSentence"}, SetRewardFlagTrue{ Name = "DieFreihaendler"},
			Say{Tag = "jenquai014", String = "Herzlich gerne! Er m�ge Euch allzeit sch�tzen!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 66 , State = StateUnknown},
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai003PC", String = "Wisst Ihr, wohin man Eure Begleiter gebracht hat?", AnswerId = 2},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			IsNpcFlagTrue{Name = "JenquaiOfferTwo"},
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai005PC", String = "Wer h�lt sie dort gefangen?", AnswerId = 6},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			IsPlayerFlagTrue{Name = "Q66RewardSentence"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "jenquai007PC", String = "Eure Begleiter sind frei!", AnswerId = 9},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 66 , State = StateUnknown}),
			Negated(IsNpcFlagTrue{Name = "JenquaiOfferTwo"}),
			Negated(IsPlayerFlagTrue{Name = "Q66RewardSentence"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end