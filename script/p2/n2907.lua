-->INFO: Istur
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 7}
--!EDS ONIDLEGOHOME END


OneTimeInitAction( SetEffect{Effect = "Chain"} )


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
-- Source: C:\project\main\mission\dialoge\p2\n2907_Istur.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagIsturKnown"},
		},
		Actions = {
			Say{Tag = "istur001", String = "Wer... wer seid Ihr?"},
			Answer{Tag = "istur001PC", String = "Euer Befreier, wie es scheint!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagIsturKnown"}),
			QuestState{QuestId = 73 , State = StateUnknown},
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			Say{Tag = "istur004", String = "Ich... ich... kenne Euch..."},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagIsturKnown"}),
			QuestState{QuestId = 73 , State = StateUnknown},
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "istur004", String = "Ich... ich... kenne Euch..."},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagIsturKnown"}),
			QuestState{QuestId = 73 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			Say{Tag = "istur004", String = "Ich... ich... kenne Euch..."},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagIsturKnown"}),
			QuestState{QuestId = 73 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "istur004", String = "Ich... ich... kenne Euch..."},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagIsturKnown"}),
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			Say{Tag = "istur004", String = "Ich... ich... kenne Euch..."},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagIsturKnown"}),
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "istur004", String = "Ich... ich... kenne Euch..."},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagIsturKnown"}),
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			Say{Tag = "istur004", String = "Ich... ich... kenne Euch..."},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagIsturKnown"}),
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "istur004", String = "Ich... ich... kenne Euch..."},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "istur002", String = "Mein... mein Name ist... Istur... ich... ich..."},
			Answer{Tag = "istur002PC", String = "Ihr seid schwach... ruht Euch aus!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 73 , State = StateUnknown},
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagIsturKnown"},
			Say{Tag = "istur003", String = "Nein... muss ihn finden... nehmt... nehmt mir die Ketten ab!"},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 73 , State = StateUnknown},
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagIsturKnown"},
			Say{Tag = "istur003", String = "Nein... muss ihn finden... nehmt... nehmt mir die Ketten ab!"},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 73 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagIsturKnown"},
			Say{Tag = "istur003", String = "Nein... muss ihn finden... nehmt... nehmt mir die Ketten ab!"},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 73 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagIsturKnown"},
			Say{Tag = "istur003", String = "Nein... muss ihn finden... nehmt... nehmt mir die Ketten ab!"},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagIsturKnown"},
			Say{Tag = "istur003", String = "Nein... muss ihn finden... nehmt... nehmt mir die Ketten ab!"},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagIsturKnown"},
			Say{Tag = "istur003", String = "Nein... muss ihn finden... nehmt... nehmt mir die Ketten ab!"},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagIsturKnown"},
			Say{Tag = "istur003", String = "Nein... muss ihn finden... nehmt... nehmt mir die Ketten ab!"},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagIsturKnown"},
			Say{Tag = "istur003", String = "Nein... muss ihn finden... nehmt... nehmt mir die Ketten ab!"},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			StopEffect{},
			Say{Tag = "istur005", String = "Meinen Bruder... Sharknar... er... er... wird sie alle töten... ja, töten...!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "istur006", String = "Er ist besessen...! Ein Wesen... er hat es von jenseits des Todes gerufen... es frisst seine Träume... seinen Geist...!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "istur007", String = "Es treibt ihn in den Wahnsinn... er hat schon viele ermordet... unter dem Bann der Kreatur...! Nur der Tod kann ihn befreien... ihn erlösen..."},
			Answer{Tag = "istur007PC", String = "Ihr müsst Euch ausruhen!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "istur008", String = "Keine... keine Zeit! Ihr... müsst Sharknar finden... tötet ihn! Rasch...! Und nehmt Euch in Acht! Sein Tod wird den Dämon freisetzen! Er muss vernichtet werden... ehe er sich einen neuen Sklaven suchen kann!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "istur009", String = "Das Wesen besitzt einen Stein... eine Kugel aus Obsidian... summend... erfüllt... mit unheiligem Leben! Dorthinein bannt er die Träume seiner Opfer! Bringt sie zu mir..."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "istur010", String = "Wenn ich den Stein studiere... finde ich vielleicht mehr über diese Kreaturen heraus!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 73} , QuestBegin{QuestId = 74},
			Say{Tag = "istur011", String = "Findet Sharknar! Geht! Beeilt Euch...! Folgt diesem Weg nach Westen, in die Berge! Und seht Euch vor... er ist ein mächtiger Nekromant... sehr mächtig!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 73 , State = StateUnknown},
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 73 , State = StateUnknown},
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 73 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnAnswer{10;
		Conditions = {
			QuestState{QuestId = 73 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnAnswer{10;
		Conditions = {
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "istur012", String = "Ich... bin meinem Bruder Sharknar gefolgt...! Ich wollte ihn aufhalten... bevor er wieder Fuß auf besiedeltes Land setzt..."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "IsturAsked"},
			Say{Tag = "istur013", String = "Aber... diese primitiven Bestien... haben mich wie ein Tier hier angekettet! Sie ahnen nicht, welche Gefahr in diesen Bergen auf sie lauert...!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 73 , State = StateUnknown},
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 73 , State = StateUnknown},
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 73 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 73 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
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
			QuestSolve{QuestId = 76} , QuestSolve{QuestId = 73} , 
				TransferItem{TakeItem =  2166 , Amount = 1 , Flag = Take} , 
				SetPlayerFlagFalse{Name = "Q73GotObsidianandQuest"},
				SetRewardFlagTrue{ Name = "Traumdieb"},
			Say{Tag = "istur014", String = "Das ist er! Dann habt Ihr den Dämon bezwungen?! Sharknar... er... möge in Frieden ruhen! Lasst uns hoffen, dass dies der letzte Traumdieb war... der von jenseits des Todes zu uns kam..."},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 73 , State = StateUnknown},
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 73 , State = StateUnknown},
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 73 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 73 , State = StateUnknown},
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur004PC", String = "Wen müsst Ihr finden?", AnswerId = 3},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"}),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur011PC", String = "Warum seid Ihr hier gefangen?", AnswerId = 11},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			QuestState{QuestId = 76 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "istur013PC", String = "Ist dies der Obsidian?", AnswerId = 14},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 73 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 74 , State = StateActive} , IsNpcFlagFalse{Name = "IsturAsked"})),
			Negated(QuestState{QuestId = 76 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end