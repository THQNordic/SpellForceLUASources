-->INFO: MagierRenya
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--- Am Anfang liegen die Magier in Ketten
OnOneTimeEvent
{
	Actions = 
	{
		SetEffect{Effect = "Chain", Length = 0, TargetType= Figure, NpcId = self} 
	},
}


---------------------------------------------------------
---  Schaltet den Dialog von Magier 3 Renya an und ab
---------------------------------------------------------

OnToggleEvent
{
	OnConditions = 
	{
		IsGlobalFlagFalse { Name = "P102_Mage3CanSpeak" },
	 },
	OnActions = 
	{
		 RemoveDialog { NpcId = 6970} ,
		 SetGlobalFlagTrue { Name = "P102_Mage3MoveFree" },
	},
	OffConditions = 
	{
		IsGlobalFlagTrue { Name = "P102_Mage3CanSpeak" },
	},
	OffActions = 
	{
		EnableDialog { NpcId = 6970} ,
		SetDialogType {NpcId = self, Type = SideQuest},
		SetGlobalFlagFalse { Name = "P102_Mage3MoveFree" },
	},
}
----------------------------------------------------------


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p102\n6970_MagierRenya.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagFalse{Name = "P102_Mage3Free"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "P102_Mage3Free"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "P102_Mage3Known"}),
		},
		Actions = {
			Say{Tag = "renya102_003", String = "Endlich kommt jemand, um mich zu befreien!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
			IsPlayerFlagTrue{Name = "P102_Mage3Known"},
		},
		Actions = {
			Say{Tag = "renya102_001", String = "Da seid Ihr ja wieder. K�nnt Ihr mich nun befreien?"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSchluesselbund"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "renya102_002PC", String = "Ja, hier ist der Schl�ssel. Ich �ffne Eure Ketten!", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSchluesselbund"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_004", String = "Die Kithar haben mich in Ketten gelegt. Helft mir!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "P102_Mage3Known"},
						  QuestBegin{QuestId = 635},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSchluesselbund"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "renya102_010PC", String = "Die Ketten sind mit einem Schloss gesichert.", AnswerId = 14},
		}}

	OnAnswer{7;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSchluesselbund"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "renya102_005PC", String = "Vielleicht mit diesem Schl�ssel? Ich fand ihn in einer Kiste im Lager.", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_006", String = "Hervorragend, er passt! Ich bin frei! Habt vielen Dank!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_007", String = "Sagt, w�rdet Ihr eventuell noch einen Auftrag f�r mich ausf�hren?"},
			Answer{Tag = "renya102_008PC", String = "Redet weiter.", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_009", String = "Nicht hier. Kommt zu meinem Haus, dort k�nnen wir in Ruhe sprechen."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 635},
					   QuestBegin{QuestId = 637},
					   StopEffect{TargetType = Figure, NpcId = self},
					   SetGlobalFlagTrue{Name = "P102_Mage3Free"},
					   SetGlobalFlagFalse { Name = "P102_Mage3CanSpeak"},
					   SetGlobalFlagTrue{Name = "P102_Mage3GoHome"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_011", String = "Sucht den Schl�ssel. Er ist bestimmt hier irgendwo im Lager versteckt."},
			Answer{Tag = "renya102_012PC", String = "Gut. Ich werde suchen.", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{17;
		Conditions = {
			IsGlobalFlagFalse { Name = "P102_Mage3ArrivedHome"},
		},
		Actions = {
			Say{Tag = "renya102_013", String = "Kommt nachher zu mir. Dann k�nnen wir alles besprechen."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsGlobalFlagFalse { Name = "P102_Mage3ArrivedHome"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
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
			QuestState{QuestId = 642 , State = StateUnknown},
		},
		Actions = {
			Say{Tag = "renya102_014", String = "Ein vertrautes Gesicht."},
			Answer{Tag = "renya102_015PC", String = "Als ich Euch befreite, spracht Ihr von einem Auftrag.", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 642 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_016", String = "Ihr habt es nicht vergessen, gut. Nun, dann h�rt zu: Ich werde von zwei Magiern bedroht, Zolowin und Gruolun."},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_017", String = "Die beiden wollen einen Gegenstand, der sich in meinem Besitz befindet, einen Stein."},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_018", String = "Dieser Stein ist einer von drei Schl�sseln zu einer Truhe, in der ein magisches Artefakt liegt: der Kriecherfetisch."},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_019", String = "Zolowin und Gruolon sind ebenfalls im Besitz je eines Steins. Nur mit allen drei Steinen gemeinsam l�sst sich die Truhe �ffnen."},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_020", String = "Nun wollen mich die beiden Magier beseitigen, um den Fetisch f�r sich zu haben."},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_021", String = "Kommt Gruolun und Zolowin zuvor, macht sie unsch�dlich und nehmt ihnen die Steine ab!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_022", String = "�ffnet dann die Truhe und bringt mir den Fetisch. Ihr findet sie weit im Osten, wo die Kriecher leben."},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_023", String = "Hier, nehmt meinen Stein."},
			Answer{Tag = "", String = "", AnswerId = 28},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 637},
					   QuestBegin{QuestId = 638},
					   QuestBegin{QuestId = 639},
					   QuestBegin{QuestId = 640},
					   QuestBegin{QuestId = 641},
					   QuestBegin{QuestId = 642},
					   QuestSolve{QuestId = 640},
					   TransferItem{GiveItem = 2379 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{30;
		Conditions = {
			QuestState{QuestId = 640 , State = StateActive},
		},
		Actions = {
			Say{Tag = "renya102_024", String = "Bei wem wart Ihr? Bei Gruolun? Bei Zolowin? Gleichg�ltig, beide sind L�gner, Diebe und M�rder."},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 640 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_025", String = "Bestimmt habt Ihr den Auftrag erhalten, mich zu t�ten und meinen Stein zu rauben."},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_026", String = "Doch h�rt mich an: Wenn Ihr f�r mich arbeitet, werde Ich Euch reichlicher belohnen, als Gruolun und Zolowin es je k�nnten."},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_027", String = "Hier, mein Stein. Besorgt Euch auch die anderen beiden. Dann �ffnet die Truhe und bringt mir den Kriecherfetisch!"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_028", String = "Ihr findet die Truhe weit im Osten, dort wo die Kriecher leben."},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 637},
					 QuestSolve{QuestId = 640},
					 TransferItem{GiveItem = 2379 , Flag = Give},
			Say{Tag = "", String = ""},
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

	OnAnswer{37;
		Conditions = {
			IsGlobalFlagFalse { Name = "P102_Mage3WonWar"},
		},
		Actions = {
			Say{Tag = "renya102_029", String = "War Eure Suche erfolgreich? Habt Ihr den Fetisch?"},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(IsGlobalFlagFalse { Name = "P102_Mage3WonWar"}),
		},
		Actions = {
			Say{Tag = "renya102_034", String = "Der Kriecherfetisch geh�rt mir und meine Feinde sind geschlagen!"},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{38;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemFetisch"},
			IsItemFlagTrue{Name = "PlayerHasItemFetisch"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "renya102_030PC", String = "Ja, hier. Ich �bergebe ihn Euch.", AnswerId = 39},
			OfferAnswer{Tag = "renya102_032PC", String = "Hm ... ich muss noch �berlegen.", AnswerId = 42},
		}}

	OnAnswer{38;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemFetisch"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemFetisch"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "renya102_030PC", String = "Ja, hier. Ich �bergebe ihn Euch.", AnswerId = 39},
		}}

	OnAnswer{38;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemFetisch"}),
			IsItemFlagTrue{Name = "PlayerHasItemFetisch"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "renya102_032PC", String = "Hm ... ich muss noch �berlegen.", AnswerId = 42},
		}}

	OnAnswer{38;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemFetisch"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemFetisch"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_031", String = "Vielen Dank! Jetzt werden sich Gruolun und Zolowin bestimmt r�chen ..."},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 643},
						 QuestSolve{QuestId = 633},
						SetItemFlagFalse{Name = "PlayerHasItemFetisch"},
						SetGlobalFlagTrue{Name = "P102_PlayerJoinsMage3"},
						SetGlobalFlagFalse { Name = "P102_Mage1CanSpeak"},
						SetGlobalFlagFalse { Name = "P102_Mage2CanSpeak"},
						SetGlobalFlagFalse { Name = "P102_Mage3CanSpeak"},
						ChangeRace{Race = 185 , NpcId = self},
						ChangeRace{Race = 121 , NpcId = 6968},
						ChangeRace{Race = 121 , NpcId = 6969},
						SetRewardFlagTrue{ Name = "DreiMagierRenyaGive"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 41},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_033", String = "Gut. Aber h�rt nicht auf das Ges�usel von Zolowin und Gruolun."},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			Say{Tag = "renya102_035", String = "Hier, nehmt dies als Belohnung f�r Eure Hilfe!"},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse { Name = "P102_Mage3CanSpeak"},
						   SetRewardFlagTrue{ Name = "DreiMagierRenyaSave"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 46},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{46;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end