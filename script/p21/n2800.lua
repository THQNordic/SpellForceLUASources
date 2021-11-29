-->INFO: Seth
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OneTimeInitAction( SetEffect{Effect = "Chain" , Length = 0 , TargetType = Figure , NpcId = 2800} )

OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 1 , 
Conditions = {IsGlobalFlagFalse{Name = "SethIdleOff"}}}

--Dialogsteuerung
--Umschalter
OnToggleEvent
{
OnConditions = {
			IsNpcFlagTrue{Name = "HasMainquest"},
			},
OnActions = {
		SetDialogType{Type = MainQuest}
		},
OffConditions = {
			IsNpcFlagFalse{Name = "HasMainquest"},
			},
OffActions = {
		SetDialogType{Type = SideQuest}
		},
}
--initial
OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetDialogType{Type = SideQuest}
		}
}
--Mit Flint gesprochen?
OnOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 274 , State = StateActive}
			},
Actions = {
		SetNpcFlagTrue{Name = "HasMainquest"},
		}
}


-- WICHTIG FUER DIE CUTSCENE MIT SETH UND BRANNIGAN --------------------
Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "SethDespawn", UpdateInterval = 10},
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "SethDespawn"},
	},
}

Respawn
{
	X = 83, Y = 309, WaitTime = 1,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "SethRespawn", UpdateInterval = 10},
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "SethRespawn"},
	},
}
----------------------------------------------------------------





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p21\n2800_Seth.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagSethKnown"},
		},
		Actions = {
			Say{Tag = "seth001", String = "Lasst mich frei... Ihr werdet es nicht bereuen..."},
			Answer{Tag = "seth001PC", String = "Wer seid Ihr?", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSethKnown"}),
			UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"}),
			UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive})),
			QuestState{QuestId = 277 , State = StateActive},
		},
		Actions = {
			Say{Tag = "seth003a", String = "Ah."},
			OfferAnswer{Tag = "seth003PC", String = "Also gut - ich werde Euch befreien!", AnswerId = 3},
			OfferAnswer{Tag = "seth010PC", String = "Ich habe hier Rüstung und Dolch!", AnswerId = 12},
			OfferAnswer{Tag = "seth013PC", String = "Ich bin bereit!", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSethKnown"}),
			UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"}),
			UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive})),
			Negated(QuestState{QuestId = 277 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "seth003a", String = "Ah."},
			OfferAnswer{Tag = "seth003PC", String = "Also gut - ich werde Euch befreien!", AnswerId = 3},
			OfferAnswer{Tag = "seth010PC", String = "Ich habe hier Rüstung und Dolch!", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSethKnown"}),
			UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"}),
			Negated(UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive}))),
			QuestState{QuestId = 277 , State = StateActive},
		},
		Actions = {
			Say{Tag = "seth003a", String = "Ah."},
			OfferAnswer{Tag = "seth003PC", String = "Also gut - ich werde Euch befreien!", AnswerId = 3},
			OfferAnswer{Tag = "seth013PC", String = "Ich bin bereit!", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSethKnown"}),
			UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"}),
			Negated(UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive}))),
			Negated(QuestState{QuestId = 277 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "seth003a", String = "Ah."},
			OfferAnswer{Tag = "seth003PC", String = "Also gut - ich werde Euch befreien!", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSethKnown"}),
			Negated(UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"})),
			UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive})),
			QuestState{QuestId = 277 , State = StateActive},
		},
		Actions = {
			Say{Tag = "seth003a", String = "Ah."},
			OfferAnswer{Tag = "seth010PC", String = "Ich habe hier Rüstung und Dolch!", AnswerId = 12},
			OfferAnswer{Tag = "seth013PC", String = "Ich bin bereit!", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSethKnown"}),
			Negated(UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"})),
			UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive})),
			Negated(QuestState{QuestId = 277 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "seth003a", String = "Ah."},
			OfferAnswer{Tag = "seth010PC", String = "Ich habe hier Rüstung und Dolch!", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSethKnown"}),
			Negated(UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"})),
			Negated(UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive}))),
			QuestState{QuestId = 277 , State = StateActive},
		},
		Actions = {
			Say{Tag = "seth003a", String = "Ah."},
			OfferAnswer{Tag = "seth013PC", String = "Ich bin bereit!", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagSethKnown"}),
			Negated(UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"})),
			Negated(UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive}))),
			Negated(QuestState{QuestId = 277 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "seth003a", String = "Ah."},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "seth002", String = "Jemand, der Euch ein Angebot unterbreiten will... ein Angebot, das Ihr nicht ausschlagen könnt... wenn Ihr mich losmacht!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"}),
			UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive})),
			QuestState{QuestId = 277 , State = StateActive},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSethKnown"},
			Say{Tag = "seth003", String = "Ich kann Euch von großem Nutzen sein... bitte, macht mich los...!"},
			OfferAnswer{Tag = "seth003PC", String = "Also gut - ich werde Euch befreien!", AnswerId = 3},
			OfferAnswer{Tag = "seth010PC", String = "Ich habe hier Rüstung und Dolch!", AnswerId = 12},
			OfferAnswer{Tag = "seth013PC", String = "Ich bin bereit!", AnswerId = 17},
		}}

	OnAnswer{2;
		Conditions = {
			UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"}),
			UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive})),
			Negated(QuestState{QuestId = 277 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSethKnown"},
			Say{Tag = "seth003", String = "Ich kann Euch von großem Nutzen sein... bitte, macht mich los...!"},
			OfferAnswer{Tag = "seth003PC", String = "Also gut - ich werde Euch befreien!", AnswerId = 3},
			OfferAnswer{Tag = "seth010PC", String = "Ich habe hier Rüstung und Dolch!", AnswerId = 12},
		}}

	OnAnswer{2;
		Conditions = {
			UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"}),
			Negated(UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive}))),
			QuestState{QuestId = 277 , State = StateActive},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSethKnown"},
			Say{Tag = "seth003", String = "Ich kann Euch von großem Nutzen sein... bitte, macht mich los...!"},
			OfferAnswer{Tag = "seth003PC", String = "Also gut - ich werde Euch befreien!", AnswerId = 3},
			OfferAnswer{Tag = "seth013PC", String = "Ich bin bereit!", AnswerId = 17},
		}}

	OnAnswer{2;
		Conditions = {
			UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"}),
			Negated(UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive}))),
			Negated(QuestState{QuestId = 277 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSethKnown"},
			Say{Tag = "seth003", String = "Ich kann Euch von großem Nutzen sein... bitte, macht mich los...!"},
			OfferAnswer{Tag = "seth003PC", String = "Also gut - ich werde Euch befreien!", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"})),
			UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive})),
			QuestState{QuestId = 277 , State = StateActive},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSethKnown"},
			Say{Tag = "seth003", String = "Ich kann Euch von großem Nutzen sein... bitte, macht mich los...!"},
			OfferAnswer{Tag = "seth010PC", String = "Ich habe hier Rüstung und Dolch!", AnswerId = 12},
			OfferAnswer{Tag = "seth013PC", String = "Ich bin bereit!", AnswerId = 17},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"})),
			UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive})),
			Negated(QuestState{QuestId = 277 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSethKnown"},
			Say{Tag = "seth003", String = "Ich kann Euch von großem Nutzen sein... bitte, macht mich los...!"},
			OfferAnswer{Tag = "seth010PC", String = "Ich habe hier Rüstung und Dolch!", AnswerId = 12},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"})),
			Negated(UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive}))),
			QuestState{QuestId = 277 , State = StateActive},
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSethKnown"},
			Say{Tag = "seth003", String = "Ich kann Euch von großem Nutzen sein... bitte, macht mich los...!"},
			OfferAnswer{Tag = "seth013PC", String = "Ich bin bereit!", AnswerId = 17},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"})),
			Negated(UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive}))),
			Negated(QuestState{QuestId = 277 , State = StateActive}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagSethKnown"},
			Say{Tag = "seth003", String = "Ich kann Euch von großem Nutzen sein... bitte, macht mich los...!"},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			StopEffect{TargetType = Figure , X = 0 , Y = 0 , NpcId = 2800},
			Say{Tag = "seth004", String = "Ah! Danke! So, nun lasst Euch ansehen! Ein Runenkrieger, hm...? Lasst mich raten... Ihr seid hier, um die Briarwölfe zu vernichten...!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "seth005", String = "Aber Ihr werdet nicht weit kommen! Briars Elite wird jeden Eurer Angriffe zurückschlagen, soviel ist sicher!"},
			Answer{Tag = "seth005PC", String = "Ihr scheint die Briarwölfe recht gut zu kennen?", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "seth006", String = "Ich habe noch eine alte... Rechnung zu begleichen...! Mit Briar höchstpersönlich! Hat etwas damit zu tun, weshalb ich hier angekettet war..."},
			Answer{Tag = "seth006PC", String = "Nun, Ihr könnt mit mir kommen!", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "seth007", String = "Danke! Ich arbeite immer alleine, mein Freund! Schon einmal etwas von Assassinen gehört? Ich werde ins Lager huschen und diesem Hund Briar sein kleines Lichtlein ausblasen, bevor überhaupt jemand merkt, was los ist!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "seth008", String = "Dabei werde ich dann zufällig einen bestimmten Dolch zurücklasse... sagen wir mal, einen Dolch der roten Legion! Sie werden rasen vor Wut - und Vergeltung fordern...!"},
			Answer{Tag = "seth008PC", String = "Und wenn sie zu ihrem Gegenschlag ausrücken, ist ihr Lager leer und unbewacht!", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "seth009", String = "Ich sehe, Ihr habt verstanden, Krieger! Ein Problem gibt es allerdings noch... nur Mitglieder der Wolfselite kommen an Briar heran..."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "seth010", String = "Ich brauche deshalb eine ihrer Rüstungen, um mich zu tarnen! Nur Briars Offiziere tragen diese Panzer! Besorgt mir einen - und einen Dolch der roten Legion! Davon findet Ihr sicher noch welche auf dem Schlachtfeld..."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 510} , QuestBegin{QuestId = 511}, QuestSolve{QuestId = 276} , 
				QuestSolve{QuestId = 274} , SetRewardFlagTrue{ Name = "WolfUndDrache1"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
			UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"}),
			UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive})),
			QuestState{QuestId = 277 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "seth003PC", String = "Also gut - ich werde Euch befreien!", AnswerId = 3},
			OfferAnswer{Tag = "seth010PC", String = "Ich habe hier Rüstung und Dolch!", AnswerId = 12},
			OfferAnswer{Tag = "seth013PC", String = "Ich bin bereit!", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"}),
			UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive})),
			Negated(QuestState{QuestId = 277 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "seth003PC", String = "Also gut - ich werde Euch befreien!", AnswerId = 3},
			OfferAnswer{Tag = "seth010PC", String = "Ich habe hier Rüstung und Dolch!", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"}),
			Negated(UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive}))),
			QuestState{QuestId = 277 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "seth003PC", String = "Also gut - ich werde Euch befreien!", AnswerId = 3},
			OfferAnswer{Tag = "seth013PC", String = "Ich bin bereit!", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"}),
			Negated(UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive}))),
			Negated(QuestState{QuestId = 277 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "seth003PC", String = "Also gut - ich werde Euch befreien!", AnswerId = 3},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"})),
			UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive})),
			QuestState{QuestId = 277 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "seth010PC", String = "Ich habe hier Rüstung und Dolch!", AnswerId = 12},
			OfferAnswer{Tag = "seth013PC", String = "Ich bin bereit!", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"})),
			UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive})),
			Negated(QuestState{QuestId = 277 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "seth010PC", String = "Ich habe hier Rüstung und Dolch!", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"})),
			Negated(UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive}))),
			QuestState{QuestId = 277 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "seth013PC", String = "Ich bin bereit!", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"})),
			Negated(UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive}))),
			Negated(QuestState{QuestId = 277 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "seth011", String = "Gut, sehr gut... dann sind wir ja soweit."},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "seth012", String = "Sobald Ihr bereit seid, werde ich in Briars Lager schleichen! Dieser Dolch wird ihm nicht gut bekommen...!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "seth013", String = "Gebt mir Bescheid, wenn es losgehen soll..."},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 277} , QuestSolve{QuestId = 510}, QuestSolve{QuestId = 511},
			TransferItem{TakeItem = 3315 , Amount = 1 , Flag = Take},
			TransferItem{TakeItem = 3316 , Amount = 1 , Flag = Take},
			ChangeUnit{Unit = 1343 , NpcId = self},
			SetRewardFlagTrue{ Name = "WolfUndDrache2"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
			UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"}),
			UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive})),
			QuestState{QuestId = 277 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "seth003PC", String = "Also gut - ich werde Euch befreien!", AnswerId = 3},
			OfferAnswer{Tag = "seth010PC", String = "Ich habe hier Rüstung und Dolch!", AnswerId = 12},
			OfferAnswer{Tag = "seth013PC", String = "Ich bin bereit!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"}),
			UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive})),
			Negated(QuestState{QuestId = 277 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "seth003PC", String = "Also gut - ich werde Euch befreien!", AnswerId = 3},
			OfferAnswer{Tag = "seth010PC", String = "Ich habe hier Rüstung und Dolch!", AnswerId = 12},
		}}

	OnAnswer{16;
		Conditions = {
			UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"}),
			Negated(UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive}))),
			QuestState{QuestId = 277 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "seth003PC", String = "Also gut - ich werde Euch befreien!", AnswerId = 3},
			OfferAnswer{Tag = "seth013PC", String = "Ich bin bereit!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"}),
			Negated(UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive}))),
			Negated(QuestState{QuestId = 277 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "seth003PC", String = "Also gut - ich werde Euch befreien!", AnswerId = 3},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"})),
			UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive})),
			QuestState{QuestId = 277 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "seth010PC", String = "Ich habe hier Rüstung und Dolch!", AnswerId = 12},
			OfferAnswer{Tag = "seth013PC", String = "Ich bin bereit!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"})),
			UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive})),
			Negated(QuestState{QuestId = 277 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "seth010PC", String = "Ich habe hier Rüstung und Dolch!", AnswerId = 12},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"})),
			Negated(UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive}))),
			QuestState{QuestId = 277 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "seth013PC", String = "Ich bin bereit!", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(UND(QuestState{QuestId = 276 , State = StateActive} , IsGlobalFlagTrue{Name = "AssassinFree"})),
			Negated(UND(PlayerHasItem{ItemId = 3315} , UND(PlayerHasItem{ItemId = 3316} , QuestState{QuestId = 510 , State = StateActive}))),
			Negated(QuestState{QuestId = 277 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "seth014", String = "Verstanden! Jetzt wird Briar bezahlen...! Beginnt Euren Angriff, sobald ich mein Werk vollendet habe! Viel Glück... Freund!"},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue {Name = "SethAttacks"} , RemoveDialog{},
			EndDialog(),
		}}


	EndDefinition()
end