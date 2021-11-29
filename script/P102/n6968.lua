-->INFO: MagierZolowin
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
---  Schaltet den Dialog von Magier 1 Zolowin an und ab
---------------------------------------------------------

OnToggleEvent
{
	OnConditions = 
	{
		IsGlobalFlagFalse { Name = "P102_Mage1CanSpeak" },
	 },
	OnActions = 
	{
		 RemoveDialog { NpcId = 6968} ,
		 SetGlobalFlagTrue { Name = "P102_Mage1MoveFree" },
	},
	OffConditions = 
	{
		IsGlobalFlagTrue { Name = "P102_Mage1CanSpeak" },
	},
	OffActions = 
	{
		EnableDialog { NpcId = 6968} ,
		SetDialogType {NpcId = self, Type = SideQuest},
		SetGlobalFlagFalse { Name = "P102_Mage1MoveFree" },
	},
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p102\n6968_MagierZolowin.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagFalse{Name = "P102_Mage1Free"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "P102_Mage1Free"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "P102_Mage1Known"}),
		},
		Actions = {
			Say{Tag = "zolowin102_003", String = "Ah! Ihr kommt, um mich zu retten!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
			IsPlayerFlagTrue{Name = "P102_Mage1Known"},
		},
		Actions = {
			Say{Tag = "zolowin102_001", String = "Da seid Ihr ja wieder! Habt Ihr den Schlüssel gefunden, um mich zu befreien?"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSchluesselbund"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zolowin102_002PC", String = "Ja, hier ist er. Ich öffne Eure Ketten!", AnswerId = 3},
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
			Say{Tag = "zolowin102_004", String = "Die Kithar haben mich verschleppt und hier angekettet. Befreit mich."},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "P102_Mage1Known"},
						  QuestBegin{QuestId = 634},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSchluesselbund"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "zolowin102_005PC", String = "Dieser Schlüssel ist aus einer Kiste im Lager. Mal sehen, ob er die Ketten öffnet!", AnswerId = 8},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSchluesselbund"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "zolowin102_009PC", String = "Womit? Ich kann das Schloss nicht öffnen.", AnswerId = 14},
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
			Say{Tag = "zolowin102_006", String = "Er passt! Ihr habt mich befreit! Nehmt diese kleine Aufmerksamkeit zum Dank."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zolowin102_007", String = "Ich bin bereit, Euch noch viel mehr zu geben ... wenn Ihr einen Auftrag für mich erledigt."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zolowin102_008", String = "Aber dies ist nicht die richtige Zeit und der richtige Ort, um darüber zu sprechen."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 634},
					   QuestBegin{QuestId = 637},
					   StopEffect{TargetType = Figure, NpcId = self},
					   SetGlobalFlagTrue{Name = "P102_Mage1Free"},
					   SetGlobalFlagFalse { Name = "P102_Mage1CanSpeak"},
					   SetGlobalFlagTrue{Name = "P102_Mage1GoHome"},
					   SetRewardFlagTrue{Name = "DreiMagierZolowinFree"},
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
			Say{Tag = "zolowin102_010", String = "Der Schlüssel muss irgendwo in einer Kiste hier im Lager liegen."},
			Answer{Tag = "zolowin102_011PC", String = "Ich werde ihn suchen.", AnswerId = 15},
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
			IsGlobalFlagFalse { Name = "P102_Mage1ArrivedHome"},
		},
		Actions = {
			Say{Tag = "zolowin102_012", String = "Kommt zu meinem Haus. Dort können wir alles besprechen."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsGlobalFlagFalse { Name = "P102_Mage1ArrivedHome"}),
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
			Say{Tag = "zolowin102_013", String = "Ah, da seid Ihr wieder!"},
			Answer{Tag = "zolowin102_014PC", String = "Ihr spracht von einem Auftrag.", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(QuestState{QuestId = 642 , State = StateUnknown}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zolowin102_015", String = "Richtig. Es geht um ein magisches Artefakt, den Kriecherfetisch."},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zolowin102_016", String = "Gemeinsam mit Gruolun, dem Schwarzzauberer, und Renya, der Erdmagierin, konnte ich diese kostbare Statue erbeuten."},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zolowin102_017", String = "Da wir alle drei denselben Anteil an ihrer Bergung hatten und keinem von uns allein sein Besitz zustand, verstauten wir sie in einer Truhe."},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zolowin102_018", String = "Diese Truhe kann nur von uns dreien gemeinsam geöffnet werden, da jeder von uns einen Stein besitzt, der zur Öffnung benötigt wird."},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zolowin102_019", String = "So hatten wir es damals vereinbart. Doch Gruolun und Renya haben sich gegen mich verschworen. Sie wollen mich heimtückisch ermorden und meinen Stein an sich nehmen."},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zolowin102_020", String = "Das müsst Ihr verhindern. Erbeutet die Steine der beiden anderen, öffnet damit die Truhe und bringt mir, was mir zusteht: den Fetisch!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zolowin102_021", String = "Hier habt Ihr meinen Stein."},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 637},
					   QuestBegin{QuestId = 638},
					   QuestBegin{QuestId = 639},
					   QuestBegin{QuestId = 640},
					   QuestBegin{QuestId = 641},
					   QuestBegin{QuestId = 642},
					   QuestSolve{QuestId = 639},
					   TransferItem{GiveItem = 2378 , Flag = Give},
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
			QuestState{QuestId = 639 , State = StateActive},
		},
		Actions = {
			Say{Tag = "zolowin102_022", String = "Ihr habt bereits mit den anderen über den Fetisch gesprochen?"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{29;
		Conditions = {
			Negated(QuestState{QuestId = 639 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 36},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zolowin102_023", String = "Bestimmt haben Sie Euch viele Lügen erzählt!"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zolowin102_024", String = "Die Wahrheit ist: Groulon und Renya haben sich gegen mich verschworen! Sie wollen mich ermorden lassen und meinen Stein an sich nehmen."},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zolowin102_025", String = "Weil Ihr mich gerettet habt, vertraue ich Euch. Hier habt Ihr meinen Stein. Erbeutet die beiden anderen und bringt mir, was mir zusteht: den Kriecherfetisch!"},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zolowin102_026", String = "Dann werde ich Euch reich belohnen!"},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 637},
					 QuestSolve{QuestId = 639},
					 TransferItem{GiveItem = 2378 , Flag = Give},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{36;
		Conditions = {
			IsGlobalFlagFalse { Name = "P102_Mage1WonWar"},
		},
		Actions = {
			Say{Tag = "zolowin102_027", String = "Und? Habt Ihr den Fetisch gefunden?"},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{36;
		Conditions = {
			Negated(IsGlobalFlagFalse { Name = "P102_Mage1WonWar"}),
		},
		Actions = {
			Say{Tag = "zolowin102_032", String = "Der Kriecherfetisch gehört mir und meine Feinde sind geschlagen!"},
			Answer{Tag = "", String = "", AnswerId = 43},
		}}

	OnAnswer{37;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemFetisch"},
			IsItemFlagTrue{Name = "PlayerHasItemFetisch"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zolowin102_028PC", String = "Ja, hier. Ich übergebe ihn Euch.", AnswerId = 38},
			OfferAnswer{Tag = "zolowin102_030PC", String = "Hmm ... ich muss noch überlegen.", AnswerId = 41},
		}}

	OnAnswer{37;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemFetisch"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemFetisch"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zolowin102_028PC", String = "Ja, hier. Ich übergebe ihn Euch.", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemFetisch"}),
			IsItemFlagTrue{Name = "PlayerHasItemFetisch"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "zolowin102_030PC", String = "Hmm ... ich muss noch überlegen.", AnswerId = 41},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemFetisch"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemFetisch"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{38;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zolowin102_029", String = "Der Fetisch! Endlich! Er gehört mir!"},
			Answer{Tag = "", String = "", AnswerId = 39},
		}}

	OnAnswer{39;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 643},
						 QuestSolve{QuestId = 633},
						SetItemFlagFalse{Name = "PlayerHasItemFetisch"},
						SetGlobalFlagTrue{Name = "P102_PlayerJoinsMage1"},
						SetGlobalFlagFalse { Name = "P102_Mage1CanSpeak"},
						SetGlobalFlagFalse { Name = "P102_Mage2CanSpeak"},
						SetGlobalFlagFalse { Name = "P102_Mage3CanSpeak"},
						ChangeRace{Race = 185 , NpcId = self},
						ChangeRace{Race = 121 , NpcId = 6969},
						ChangeRace{Race = 121 , NpcId = 6970},
						SetRewardFlagTrue{ Name = "DreiMagierZolowinGive"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{41;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zolowin102_031", String = "Lasst Euch nicht einfallen, die Statue einem anderen zu geben! Ihr würdet es bereuen."},
			Answer{Tag = "", String = "", AnswerId = 42},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{42;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{43;
		Conditions = {
		},
		Actions = {
			Say{Tag = "zolowin102_033", String = "Hier, nehmt dies als Belohnung für Eure Hilfe!"},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{44;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse { Name = "P102_Mage1CanSpeak"},
						 SetRewardFlagTrue{ Name = "DreiMagierZolowinSave"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end