-->INFO: Devus
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{
	
	Conditions = 
	{
		
	},
	Actions =	
	{
		HoldPosition{ NpcId = self},
		SetDialogType{ NpcId = self , Type = SideQuest},
	}
	
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p107\n5671_Devus.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagTrue{Name = "Q598_DevusKnown"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q598_DevusKnown"}),
		},
		Actions = {
			Say{Tag = "devus107_015", String = "Sagt an, Fremdling, steigt Ihr hinab ins Wintertal?"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{1;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q598_TinkturGiven"},
		},
		Actions = {
			Say{Tag = "devus107_001", String = "Niethalf, gib mir Kraft! Soll nun mein Bruder oder die Elfe das Leben erhalten?"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q598_TinkturGiven"}),
			IsItemFlagTrue{Name = "PlayerHasItemWundtinktur"},
		},
		Actions = {
			Say{Tag = "devus107_009", String = "Ah, Ihr seid es! Habt Ihr das Mittel?"},
			OfferAnswer{Tag = "devus107_010PC", String = "Hier ist es!", AnswerId = 11},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q598_TinkturGiven"}),
			Negated(IsItemFlagTrue{Name = "PlayerHasItemWundtinktur"}),
		},
		Actions = {
			Say{Tag = "devus107_009", String = "Ah, Ihr seid es! Habt Ihr das Mittel?"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "devus107_002PC", String = "Gebt Sie eurem Zwergenbruder!", AnswerId = 3},
			OfferAnswer{Tag = "devus107_004PC", String = "Gebt Sie der Elfe!", AnswerId = 6},
			OfferAnswer{Tag = "devus107_006PC", String = "Eine schwere Entscheidung ...", AnswerId = 9},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "devus107_003", String = "Ihr habt Recht, ich muss meinem Blute treu bleiben! Er wird sie erhalten! Mögen die Ahnen der Elfen ihre Schwester in Frieden aufnehmen."},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "TrankUebergabeZwerg"},
					QuestSolve{QuestId = 600},
					QuestSolve{QuestId = 598},
					SetGlobalFlagTrue{Name = "Q598DwarfCanSpeak"},
					RemoveDialog{NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "devus107_005", String = "Ja. Mein Bruder ist ein Krieger, er kennt den Preis seiner Zunft! Doch dieses liebliche Geschöpf soll nicht so grausam sterben!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "TrankUebergabeElfe"},
				 QuestSolve{QuestId = 600},
				 QuestSolve{QuestId = 598},
				 SetGlobalFlagTrue{Name = "Q598ElfCanSpeak"},
				 RemoveDialog{NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "devus107_007", String = "Was soll ich tun? Wer soll leben? Niethalf, schenke mir Weisheit!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "devus107_008", String = "Wenn nur ein Fingerzeig mir helfen würde! Welches Leben soll ich retten?"},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "devus107_011", String = "Seid bedankt, Fremdling! Nun kann ich ... Oh nein, es ist, wie ich befürchtet hatte!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "devus107_012", String = "Es ist nur noch wenig in der Flasche! Nicht genug für beide Verletzte ..."},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "devus107_013", String = "Niethalf, Gnade, was soll ich tun? Soll ich nun entscheiden, wer leben darf und wer stirbt?"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "devus107_014", String = "Mein Zwergenbruder oder die Elfe ... wer soll leben? Wer?"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 599},
								   QuestBegin{QuestId = 600},
								   SetPlayerFlagTrue{Name = "Q598_TinkturGiven"},
								   TransferItem{TakeItem = 3747, Flag = Take},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "devus107_016", String = "Ich habe zwei Verletzte hier mit starkem Wundbrand! Unheilige Kraft hat diese Wunden geschlagen, Zauber können sie nicht schließen!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "devus107_017", String = "Aber es gibt noch ein wenig geweihte Wundmedizin, in unserem Lager im Tal! Sie kann die Wunden vielleicht schließen und den Brand heilen!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "devus107_018", String = "Sucht in unserem Lager nach der Kiste mit der Medizin und bringt sie mir. Hier, ich gebe Euch den Schlüssel."},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "DialogDevusEnded"},
							SetPlayerFlagTrue{Name = "Q598_DevusKnown"},
							QuestBegin{QuestId = 598},
							QuestBegin{QuestId = 599},
							TransferItem{GiveItem = 3748, Flag = Give},
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


	EndDefinition()
end