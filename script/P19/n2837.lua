-->INFO: mechlan
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 0}
--!EDS ONIDLEGOHOME END


OnPlatformOneTimeEvent
{
	Conditions = {
		IsNpcFlagTrue{Name = "MechlanMustAttackAvatar", UpdateInterval = 10},
	},
	Actions = {
		AttackTarget{Target = Avatar , NpcId = 2837 , FriendlyFire = TRUE},
	},
}

OnOneTimeEvent
{
	Conditions = {
		FigureInRangeNpc{TargetNpcId = Avatar, NpcId = self , Range = 7 , UpdateInterval = 10},
	},
	Actions = {
		Outcry{ Tag = "outcryMechlanMul001"      , NpcId = 2837, String = "Bitte! Habt Erbarmen! Verschont mich!"                                                       , Color = ColorWhite },
	},
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p19\n2837_mechlan.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagMechlanKnown"},
		},
		Actions = {
			Say{Tag = "mechlan001", String = "Bitte! Verschont mich! Ihr versteht nicht... dieses Kunstwerk zu sehen, zu besitzen... ist wie ein Zwang... bitte... habt Erbarmen!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagMechlanKnown"}),
			QuestState{QuestId = 322, State = StateActive},
		},
		Actions = {
			Say{Tag = "mechlan003", String = "Geht bitte! Lasst mich allein in meiner Qual!"},
			OfferAnswer{Tag = "mechlan003PC", String = "Ihr habt gemordet für dieses Stück Glas!", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagMechlanKnown"}),
			Negated(QuestState{QuestId = 322, State = StateActive}),
		},
		Actions = {
			Say{Tag = "mechlan003", String = "Geht bitte! Lasst mich allein in meiner Qual!"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mechlan002", String = "Hier, nehmt ihn! Nehmt den Phönix! Diesmal ist es keine Täuschung! Nur bitte... verschont mein Leben!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 322, State = StateActive},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagMechlanKnown"},
			TransferItem{GiveItem = 2814 , Flag = Give} , 
				QuestBegin{QuestId = 322} , QuestSolve{QuestId = 321},
				SetRewardFlagTrue{ Name = "DerPhoenix6Ablieferung"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "mechlan003PC", String = "Ihr habt gemordet für dieses Stück Glas!", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 322, State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagMechlanKnown"},
			TransferItem{GiveItem = 2814 , Flag = Give} , 
				QuestBegin{QuestId = 322} , QuestSolve{QuestId = 321},
				SetRewardFlagTrue{ Name = "DerPhoenix6Ablieferung"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mechlan004", String = "Bitte... ich... ich konnte nicht anders... Ihr wisst nicht, wie das ist..."},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mechlan005", String = "Gegenüber seiner Vollkommenheit wirkt alles andere öde und leer! Die Sehnsucht danach trieb mich dazu... versteht doch! Es hat mich verblendet... diese Schmerzen!"},
			OfferAnswer{Tag = "mechlan005PC", String = "Dann werde ich Euch erlösen! Der Seelenfluss ruft nach Euch!", AnswerId = 5},
			OfferAnswer{Tag = "mechlan006PC", String = "Dann hoffe ich, dass Ihr Euren Frieden damit finden werdet!", AnswerId = 8},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mechlan006", String = "Ihr seid ein Narr! Aber gut! Wenn Ihr es so wollt! Kommt nur her, Runensklave!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			ChangeRace{Race = 150 , NpcId = 2837}, 
				SetNpcFlagTrue{Name = "MechlanMustAttackAvatar"},
			RemoveDialog{},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mechlan007", String = "Ich danke Euch! Ich werde versuchen, die Splitter wieder zusammenzusetzen! Oh, sie sind so wundervoll..."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mechlan008", String = "Der wahre Phönix soll Euch gehören! Als Dank dafür, dass Ihr mein Leben verschont habt! Für mich ist er doch nur ein öder Stein ohne Glanz!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "mechlan009", String = "Nun geht! Ihr habt eine Welt zu retten!"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			RemoveDialog{},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
			QuestState{QuestId = 322, State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "mechlan003PC", String = "Ihr habt gemordet für dieses Stück Glas!", AnswerId = 3},
		}}

	OnAnswer{12;
		Conditions = {
			Negated(QuestState{QuestId = 322, State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end