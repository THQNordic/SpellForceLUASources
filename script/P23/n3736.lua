-->INFO: Talia
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- am Anfang
OnIdleGoHome
{
	WalkMode = Walk, X = _X, Y = _Y, Direction = SouthEast,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "RiftIdleOn"},
		QuestState{QuestId = 312 , State = StateUnknown},
	},
}

--bei Ulathers Tor
OnIdleGoHome
{
	WalkMode = Walk, X = 410 , Y = 194, Direction = NorthEast, WalkMode = Run,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "RiftIdleOn"},
		QuestState{QuestId = 312 , State = StateActive},
	},
	HomeActions = {
		EnableDialog{},
	},
}
OnDeadPlayerGoHome
{
	X = 410, Y = 194, Direction = West, KeepFollowing = TRUE ,
	Conditions = {
		IsGlobalFlagTrue {Name = "RiftIdleOn"},
		QuestState{QuestId = 498 , State = StateActive},
	},
	Actions = {
		--TEST:
		--EnableDialog{},
		--SetGlobalFlagTrue{Name = "Q310PLayerHasDied"},
	},
	HomeActions = {
	},
}


--im Flammenkreis
OnIdleGoHome
{
	WalkMode = Walk, X = 438 , Y = 198, Direction = NorthEast,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "RiftIdleOn"},
		QuestState{QuestId = 497 , State = StateActive},
		QuestState{QuestId = 312 , State = StateSolved},
	},
	HomeActions = 
	{
		--RemoveDialog{},
	},
}
--am Ende
OnIdleGoHome
{
	WalkMode = Walk, X = _X , Y = _Y, Direction = SouthEast,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "RiftIdleOn"},
		QuestState{QuestId = 498 , State = StateSolved},
		QuestState{QuestId = 497 , State = StateSolved},
		QuestState{QuestId = 312 , State = StateSolved},
	},
}
--am Ende
OnIdleGoHome
{
	WalkMode = Walk, X = 90 , Y = 210, Direction = South,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "RiftIdleOn"},
		QuestState{QuestId = 498 , State = StateSolved},
		QuestState{QuestId = 497 , State = StateSolved},
		QuestState{QuestId = 312 , State = StateSolved},
		QuestState{QuestId = 310 , State = StateSolved},
		
	},
}



Despawn
{
Conditions = {
		IsGlobalFlagTrue{Name = "Q310DespawnTalia"},		
			},
Actions = {
		SetGlobalFlagFalse{Name = "Q310DespawnTalia"},
		}
}
Despawn
{
Conditions = {
		QuestState{QuestId = 310 , State = StateSolved},
		FigureInRange{X = 90 , Y = 210 , NpcId = self , Range = 1}		
			},
}
Respawn
{
X = 410 , Y = 197 , WaitTime = 3,
Conditions = {
			QuestState{QuestId = 312 , State = StateActive},
			},
}
--Toggle Simulation
PlatformInitAction( SetNpcFlagFalse{Name = "ToggelSimul"} )
--on
OnEvent
{
Conditions = {
				IsNpcFlagTrue{Name = "FollowMainChar"},
				IsNpcFlagFalse{Name = "ToggelSimul" , UpdateInterval = 10},
				FigureJob{Job = JobIdle , NpcId = self},
				FigureAlive{NpcId = Avatar},
				},
Actions = 	{
				-- safe, da reiner aggro toggle follow
				Follow{Target = Avatar , NpcId = self},
				SetNpcFlagTrue{Name = "ToggelSimul"},
				}
}
--off
OnEvent
{
Conditions = {
				IsNpcFlagTrue{Name = "ToggelSimul" , UpdateInterval = 10},
				FigureHasAggro{NpcId = self , UpdateInterval = 10},
				FigureAlive{NpcId = Avatar},
				},		
Actions = 	{
				StopFollow{Target = Avatar , NpcId = self},
				SetNpcFlagFalse{Name = "ToggelSimul"},
				}
}
--off
OnOneTimeEvent
{
Conditions = {
				QuestState{QuestId = 498 , State = StateSolved},
				FigureAlive{NpcId = Avatar},
				},		
Actions = 	{
				StopFollow{Target = Avatar , NpcId = self},
				SetNpcFlagFalse{Name = "FollowMainChar"},
				SetGlobalFlagFalse{Name = "TaliaDuchDenSpaltBegleiten"},
			}
}
-------------------DIALOGSTEUERUNG
OneTimeInitAction(	RemoveDialog{}	)

OnOneTimeEvent
{
Conditions = {
				QuestState{QuestId = 499 , State = StateActive},
				},		
Actions = 	{
				EnableDialog{}
			}
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p23\n3736_Talia.txt


	

	OnBeginDialog{
		Conditions = {
			QuestState{QuestId = 499 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(QuestState{QuestId = 499 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "NotFirsTimeEnd"}),
		},
		Actions = {
			Say{Tag = "talia004", String = "Der Winter ist nah!"},
		}}

	OnAnswer{1;
		Conditions = {
			IsNpcFlagFalse{Name = "NotFirsTimeEnd"},
		},
		Actions = {
			Say{Tag = "talia001", String = "Ihr habt mich gerettet, Runenkrieger! Verzeiht meine hochmütigen Worte! Ihr seid also auf der Suche nach meinem Splitter?"},
			Answer{Tag = "talia001PC", String = "Ja, das bin ich!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "talia002", String = "Ich trenne mich nur ungern von ihm! Doch er ist ein geringer Preis für mein Leben! Nehmt ihn, er gehört Euch!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			TransferItem{GiveItem = 2746 , Flag = Give} , 
			QuestSolve{QuestId = 499} , 
			SetNpcFlagTrue{Name = "NotFirsTimeEnd"},
			QuestSolve{QuestId = 310},
			QuestSolve{QuestId = 304},
			QuestSolve{QuestId = 302},
			SetRewardFlagTrue{ Name = "DurchdenSpalt2Her"},
			Say{Tag = "talia003", String = "Viel Glück damit! Wofür immer Ihr ihn auch braucht! Lebt wohl!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			RemoveDialog{},
			EndDialog(),
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 497 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 497 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "NotFirstTimeFree"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{6;
		Conditions = {
			IsNpcFlagFalse{Name = "NotFirstTimeFree"},
		},
		Actions = {
			Say{Tag = "talia005", String = "Danke! Ich schulde Euch mein Leben! Ich war eine Närrin, Ulathers Macht zu unterschätzen!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "talia006", String = "Sein Feuer hat meine Magie verzehrt... ich bin schwach... die Bestien im Spalt werden in mir eine leicht Beute finden!"},
			Answer{Tag = "talia006PC", String = "Dann folgt mir! Wir werden den Spalt gemeinsam durchqueren!", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "talia007", String = "Ich nehme Euer Angebot gerne an... Doch Ihr solltet zuerst Eure Truppen verstärken!"},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "talia008", String = "Vielleicht gibt es auf dieser Seite des Spalts noch ein Runenmonument..."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 498} , QuestSolve{QuestId = 497} , 
			SetNpcFlagTrue{Name = "FollowMainChar"} , 
			SetNpcFlagTrue{Name = "NotFirstTimeFree"} , 
			ChangeRace{Race = 5 , NpcId = self},
			SetRewardFlagTrue{ Name = "Ulather"},
			RemoveDialog{},
			EndDialog(),
		}}

	OnAnswer{11;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q310PlayerHasDied"}),
		},
		Actions = {
			Say{Tag = "talia010", String = "Die Dämonen sind führerlos, aber nicht geschlagen! Wir müssen vorsichtig sein!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{11;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q310PlayerHasDied"},
		},
		Actions = {
			Say{Tag = "talia009", String = "Ich wusste, dass ich Euch hier wieder treffen würde! Das war knapp! Ich wünschte, ich würde Eure Fähigkeiten besitzen!"},
			Answer{Tag = "talia009PC", String = "Das wünscht Ihr nicht! Glaubt mir! Kommt, wir versuchen es noch einmal!", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "FollowMainChar"} , SetGlobalFlagFalse{Name = "Q310PLayerHasDied"},
			EndDialog(),
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{14;
		Conditions = {
			FigureInRange{X = 411 , Y = 196 , NpcId = 3736 , Range = 5},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(FigureInRange{X = 411 , Y = 196 , NpcId = 3736 , Range = 5}),
		},
		Actions = {
			Say{Tag = "talia016", String = "Der Winter ist nah!"},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{15;
		Conditions = {
			IsNpcFlagFalse{Name = "NotFirstTimeGate"},
		},
		Actions = {
			Say{Tag = "talia011", String = "Beeindruckend! Ihr habt Euch gut geschlagen! Doch jetzt tretet zurück!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{15;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "NotFirstTimeGate"}),
		},
		Actions = {
			Say{Tag = "talia015", String = "Bindet Euch an den Seelenfels! Dann können wir beginnen!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "talia012", String = "Hinter diesem Tor wartet Ulather, der große Dämon! Er befehligt die Heere der Finsternis - die Horden, die uns bald überrennen werden!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "talia013", String = "Aber mein ist die Macht des Winters! Gegen die allmächtige Kälte kann sein Feuer nicht bestehen! Ich werde ihm ein Ende bereiten!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "talia014", String = "Ich werde Ulathers Kammer öffnen und ihn niederstrecken! Gebt mir Rückendeckung! Und vergesst nicht, Euch an diesen Seelenfels dort zu binden!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "NotFirstTimeGate"}, QuestBegin{QuestId = 496} , QuestSolve{QuestId = 312},
		SetRewardFlagTrue{ Name = "DurchdenSpalt1Hin"},
			EndDialog(),
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end