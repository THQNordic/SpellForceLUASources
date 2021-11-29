-->INFO: Adhira
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

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

OnToggleEvent
{
	OnConditions = {
		ODER( IsGlobalState{Name = "Plot", State = "JourneyOne"}, IsGlobalState{Name = "Plot", State = "JourneyTwo"} )
	},
	OnActions = {
		RemoveDialog{},
	},
	OffConditions = {
		ODER( IsGlobalState{Name = "Plot", State = "JourneyThree"}, IsGlobalState{Name = "Plot", State = "JourneyFour"} )
	},
	OffActions = {
		EnableDialog{},
	},
}


--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p63\n2993_Adhira.txt


	

	OnBeginDialog{
		Conditions = {
			QuestState{QuestId = 402 , State = StateSolved},
		},
		Actions = {
			Say{Tag = "adhira001", String = "Eine neue Zeit wird beginnen... der Trank des Helden...! Ich - ich, Adhira - werde die Nordlande retten!"},
			Answer{Tag = "adhira001PC", String = "Was ist mit Euch? Ihr redet wie im Fieber!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(QuestState{QuestId = 402 , State = StateSolved}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "adhira002", String = "Tombard! Er wird uns alle erlösen!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
			QuestState{QuestId = 402 , State = StateActive},
		},
		Actions = {
			Say{Tag = "adhira003", String = "Ich habe Euch schon erwartet! Nun, habt Ihr den Krug aus Adamantinum?"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{3;
		Conditions = {
			Negated(QuestState{QuestId = 402 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{5;
		Conditions = {
			IsPlayerFlagTrue{Name = "AdhiraKnown"},
		},
		Actions = {
			Say{Tag = "adhira004", String = "Ah, Ihr seid es wieder! Nun, habt Ihr alle Lebenssäfte gesammelt?"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "AdhiraKnown"}),
		},
		Actions = {
			Say{Tag = "adhira005", String = "Ein Runenkrieger! Die Götter mögen Euch segnen! Kämpft für uns! Helft uns, die Nordlande zu retten!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "adhira006", String = "Ich bin nur eine einfache Apothekerin! Ich kann nur hier sitzen und auf Neuigkeiten aus den Grenzlanden warten! Aber Ihr...!"},
			Answer{Tag = "adhira006PC", String = "Beneidet mich nicht, Frau! Meine Kunst zu töten ist nichts, verglichen mit Eurer Kunst zu heilen!", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "adhira007", String = "Oh, Ihr unterschätzt mich! Auch ich werde kämpfen! Ich werde den Gahir brauen! Und ich werde einen Erwählten zu meinem Streiter machen, der es Euch gleichtun soll!"},
			Answer{Tag = "adhira007PC", String = "Ihr sprecht in Rätseln?", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "adhira008", String = "Der Gahir ist der Trank des Helden! Er verleiht dem, der ihn trinkt, die Kräfte der Urgewalt! Er macht ihn unbesiegbar! Und er wird kämpfen an meiner Statt!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "adhira009", String = "Leider ist das Blut von drei mächtigen und gefährlichen Wesen nötig, um ihn zu brauen!"},
			Answer{Tag = "adhira009PC", String = "Welche Wesen sind das?", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "adhira010", String = "Eine Riesenspinne, ein Dämon und ein Drache! Bitte, bringt mir ihre Lebenssäfte! Ihr habt die Macht dazu! Findet diese Wesen und nehmt ihnen ihr Blut!"},
			Answer{Tag = "adhira010PC", String = "Es sind seltsame Dinge, die ihr da verlangt, Apothekerin! Aber ich werde sie im Gedächtnis behalten!", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "AdhiraKnown"},
			QuestBegin{QuestId = 395},
					 QuestBegin{QuestId = 396},
					 QuestBegin{QuestId = 399},
					 QuestBegin{QuestId = 400}, 
					 QuestBegin{QuestId = 406},
					 QuestBegin{QuestId = 407},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q395AllBlood"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "adhira010PCa", String = "Hier bringe ich Euch das Blut der drei Kreaturen!", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q395AllBlood"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "adhira011", String = "Wahrhaftig! Ihr habt viel erdulden müssen dafür! Doch leider sind Eure Mühen noch nicht vorbei!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "adhira012", String = "Um den Gahir zu brauen, muss das Blut in einem Gefäß aus reinem Adamantinum angesetzt werden!"},
			Answer{Tag = "adhira012PC", String = "Wo ist ein solches Gefäß zu bekommen?", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "adhira013", String = "Nur die Zwerge können Adamantinum formen! Skarvig, der Schmied in den südlichen Windwallbergen besitzt die Gabe dazu, so sagt man!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 3166 , Flag = Take},
				 TransferItem{TakeItem = 3165 , Flag = Take},
				 TransferItem{TakeItem = 2540 , Flag = Take},
				 QuestSolve{QuestId = 407},
				 QuestSolve{QuestId = 396},
				 QuestBegin{QuestId = 402},
				 QuestBegin{QuestId = 403},
				 QuestBegin{QuestId = 405},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			PlayerHasItem{ItemId = 3167},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "adhira013PC", String = "Hier ist das Gefäß, das Ihr benötigt!", AnswerId = 20},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(PlayerHasItem{ItemId = 3167}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "adhira014", String = "Tatsächlich! Es ist soweit! Die Stunde meines Streiters wird kommen!"},
			Answer{Tag = "adhira014PC", String = "Seid Ihr sicher, dass Ihr das Richtige tut?", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "adhira015", String = "Richtig oder falsch, der Streiter wird uns retten! Hier! Der Trank ist fertig! Seht nur wie er brodelt...!"},
			Answer{Tag = "adhira015PC", String = "Was soll nun damit geschehen?", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "adhira016", String = "Bringt den Trank meinem Erwählten! Tombard, mein Bruder! Er ist ein tumber Kerl, der von allen verlacht wird! Doch dieser Trank wird ihn zu einem mächtigen Krieger machen!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 3167 , Flag = Take},
				 QuestSolve{QuestId = 405},
				 QuestSolve{QuestId = 402},
				 QuestBegin{QuestId = 397},
				 EnableDialog{NpcId = 2992 , Important = TRUE},
				 TransferItem{GiveItem = 3169 , Flag = Give},
				 SetRewardFlagTrue{ Name = "BlutAdhiraTrank"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end