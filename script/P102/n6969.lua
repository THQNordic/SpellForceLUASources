-->INFO: MagierGruolun
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
---  Schaltet den Dialog von Magier 2 Gruolun an und ab
---------------------------------------------------------

OnToggleEvent
{
	OnConditions = 
	{
		IsGlobalFlagFalse { Name = "P102_Mage2CanSpeak" },
	 },
	OnActions = 
	{
		 RemoveDialog { NpcId = 6969} ,
		 SetGlobalFlagTrue { Name = "P102_Mage2MoveFree" },
	},
	OffConditions = 
	{
		IsGlobalFlagTrue { Name = "P102_Mage2CanSpeak" },
	},
	OffActions = 
	{
		EnableDialog { NpcId = 6969} ,
		SetDialogType {NpcId = self, Type = SideQuest},
		SetGlobalFlagFalse { Name = "P102_Mage2MoveFree" },
	},
}
----------------------------------------------------------




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p102\n6969_MagierGruolun.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagFalse{Name = "P102_Mage2Free"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagFalse{Name = "P102_Mage2Free"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "P102_Mage2Known"}),
		},
		Actions = {
			Say{Tag = "gruolun102_003", String = "Da naht Rettung!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
			IsPlayerFlagTrue{Name = "P102_Mage2Known"},
		},
		Actions = {
			Say{Tag = "gruolun102_001", String = "Und? Habt Ihr den Schlüssel gefunden?"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSchluesselbund"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gruolun102_002PC", String = "Ja, hier ist er. Ich öffne Eure Ketten!", AnswerId = 3},
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
			Say{Tag = "gruolun102_004", String = "Löst meine Ketten und befreit mich aus der Gewalt der Kithar!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "P102_Mage2Known"},
						  QuestBegin{QuestId = 636},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSchluesselbund"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "gruolun102_009PC", String = "Aber wie?", AnswerId = 14},
		}}

	OnAnswer{7;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSchluesselbund"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "gruolun102_005PC", String = "In einer Kiste fand ich diesen Schlüssel. Mal sehen, ob er passt.", AnswerId = 8},
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
			Say{Tag = "gruolun102_006", String = "Der Schlüssel passt ins Schloss! Danke, Ihr habt mich befreit!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruolun102_007", String = "Hm ... Ihr seht aus, als könntet Ihr einen etwas heiklen Auftrag ausführen."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruolun102_008", String = "Wir sollten uns einmal darüber unterhalten ... später."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 636},
					   QuestBegin{QuestId = 637},
					   StopEffect{TargetType = Figure, NpcId = self},
					   SetGlobalFlagTrue{Name = "P102_Mage2Free"},
					   SetGlobalFlagFalse { Name = "P102_Mage2CanSpeak"},
					   SetGlobalFlagTrue{Name = "P102_Mage2GoHome"},
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
			Say{Tag = "gruolun102_010", String = "Irgendwo im Lager muss eine Kiste mit dem Schlüssel sein."},
			Answer{Tag = "gruolun102_011PC", String = "Nun, ich werde mich umsehen.", AnswerId = 15},
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
			IsGlobalFlagFalse { Name = "P102_Mage2ArrivedHome"},
		},
		Actions = {
			Say{Tag = "gruolun102_012", String = "Nicht hier. Wir besprechen alles bei meinem Haus."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{17;
		Conditions = {
			Negated(IsGlobalFlagFalse { Name = "P102_Mage2ArrivedHome"}),
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
			Say{Tag = "", String = ""},
			Answer{Tag = "gruolun102_014PC", String = "Ich komme wegen des Auftrags.", AnswerId = 20},
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
			Say{Tag = "gruolun102_015", String = "Der Auftrag, richtig! Ihr sollt mir eine wertvolle Statue holen, den Kriecherfetisch."},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruolun102_016", String = "Die Statue liegt in einer Truhe, die nur mithilfe von drei Steinen geöffnet werden kann."},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruolun102_017", String = "Ich habe einen dieser Steine. Die anderen beiden werden von Zolowin, dem Weißmagier, und Renya, der Erdmagierin, bewacht."},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruolun102_018", String = "Renya hat Zolowin gegen mich aufgehetzt und jetzt wollen mich die beiden hintergehen und mir meinen Stein rauben."},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruolun102_019", String = "Das darf nicht geschehen! Der Fetisch gehört einzig und allein mir."},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruolun102_020", String = "Mein Auftrag lautet: Tötet Renya und Zolowin, nehmt ihnen die Steine ab und öffnet damit die Truhe!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruolun102_021", String = "Wenn Ihr mir den Fetisch bringt, werde ich Euch reich belohnen!"},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruolun102_022", String = "Hier habt Ihr meinen Stein."},
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
					   QuestSolve{QuestId = 641},
					   TransferItem{GiveItem = 2380 , Flag = Give},
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
			QuestState{QuestId = 641 , State = StateActive},
		},
		Actions = {
			Say{Tag = "gruolun102_023", String = "Wer schickt Euch? Die Schlange Renya? Der falsche Zolowin?"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{30;
		Conditions = {
			Negated(QuestState{QuestId = 641 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 37},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruolun102_024", String = "Glaubt Ihnen kein Wort. Die Wahrheit ist: Die beiden wollen mich hintergehen, um an meinen Stein und damit an den Kriecherfetisch zu gelangen."},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruolun102_025", String = "Mir allein gebührt der Fetisch. Außerdem kann ich Euch ein besseres Angebot machen als die beiden zusammen."},
			Answer{Tag = "", String = "", AnswerId = 33},
		}}

	OnAnswer{33;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruolun102_026", String = "Nehmt Renya und Zolowin die Steine ab und bringt mir den Kriecherfetisch! Dann werde ich Euch reich belohnen."},
			Answer{Tag = "", String = "", AnswerId = 34},
		}}

	OnAnswer{34;
		Conditions = {
		},
		Actions = {
			Say{Tag = "gruolun102_027", String = "Hier, nehmt meinen Stein."},
			Answer{Tag = "", String = "", AnswerId = 35},
		}}

	OnAnswer{35;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 637},
					 QuestSolve{QuestId = 641},
					 TransferItem{GiveItem = 2380 , Flag = Give},
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
			IsGlobalFlagFalse { Name = "P102_Mage2WonWar"},
		},
		Actions = {
			Say{Tag = "gruolun102_028", String = "Habt Ihr das Artefakt gefunden?"},
			Answer{Tag = "", String = "", AnswerId = 38},
		}}

	OnAnswer{37;
		Conditions = {
			Negated(IsGlobalFlagFalse { Name = "P102_Mage2WonWar"}),
		},
		Actions = {
			Say{Tag = "gruolun102_033", String = "Der Kriecherfetisch gehört mir und meine Feinde sind geschlagen!"},
			Answer{Tag = "", String = "", AnswerId = 44},
		}}

	OnAnswer{38;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemFetisch"},
			IsItemFlagTrue{Name = "PlayerHasItemFetisch"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gruolun102_029PC", String = "Ja, hier. Ich übergebe es Euch.", AnswerId = 39},
			OfferAnswer{Tag = "gruolun102_031PC", String = "Hmm ... ich muss noch überlegen.", AnswerId = 42},
		}}

	OnAnswer{38;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemFetisch"},
			Negated(IsItemFlagTrue{Name = "PlayerHasItemFetisch"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gruolun102_029PC", String = "Ja, hier. Ich übergebe es Euch.", AnswerId = 39},
		}}

	OnAnswer{38;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemFetisch"}),
			IsItemFlagTrue{Name = "PlayerHasItemFetisch"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "gruolun102_031PC", String = "Hmm ... ich muss noch überlegen.", AnswerId = 42},
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
			Say{Tag = "gruolun102_030", String = "Zolowin! Renya! Jetzt werde ich euch vernichten!"},
			Answer{Tag = "", String = "", AnswerId = 40},
		}}

	OnAnswer{40;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 643},
						 QuestSolve{QuestId = 633},
						SetItemFlagFalse{Name = "PlayerHasItemFetisch"},
						SetGlobalFlagTrue{Name = "P102_PlayerJoinsMage2"},
						SetGlobalFlagFalse { Name = "P102_Mage1CanSpeak"},
						SetGlobalFlagFalse { Name = "P102_Mage2CanSpeak"},
						SetGlobalFlagFalse { Name = "P102_Mage3CanSpeak"},
						ChangeRace{Race = 185 , NpcId = self},
						ChangeRace{Race = 121 , NpcId = 6968},
						ChangeRace{Race = 121 , NpcId = 6970},
						SetRewardFlagTrue{ Name = "DreiMagierGruolunGive"},
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
			Say{Tag = "gruolun102_032", String = "Wehe, Ihr wagt es, den Fetisch einem anderen zu geben!"},
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
			Say{Tag = "gruolun102_034", String = "Hier, nehmt dies als Belohnung für Eure Hilfe!"},
			Answer{Tag = "", String = "", AnswerId = 45},
		}}

	OnAnswer{45;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse { Name = "P102_Mage2CanSpeak"},
						  SetRewardFlagTrue{ Name = "DreiMagierGruolunSave"},
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