-->INFO: Brok
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OneTimeInitAction( SetEffect{Effect = "Chain" , Length = 0 , TargetType = Figure , NpcId = 2798} )

--Dialogsteuerung

OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetDialogType{Type = SideQuest}
		}
}


OnIdleGoHome
{	
	WalkMode = Walk, X = _X, Y = _Y, Direction = South , 
	Conditions = 
	{
		IsGlobalFlagFalse{Name = "Q279DetonationSequenceGo"}
	}
}

OnIdleGoHome
{
	WalkMode = Run, X = 92, Y = 274, Direction = 7 , 
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Q279DetonationSequenceGo"},
--		IsGlobalFlagFalse{Name = "BorkSprengung"}, 
		IsGlobalFlagFalse{Name = "Q279WalkToRocks"},
		IsGlobalFlagFalse{Name = "TravelOn"},
	}
}

OnIdleGoHome
{
	WalkMode = Run, X = 87 , Y = 266, Direction = SouthWest , 
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Q279DetonationSequenceGo"},
		IsGlobalFlagTrue{Name = "Q279WalkToRocks"},
		IsGlobalFlagFalse {Name = "Explosionsschalter"}
	},
	HomeActions = {
				SetGlobalFlagFalse{Name = "Q279WalkToRocks"},
					}
}

OnIdleGoHome
{
	WalkMode = Run, X = 60, Y = 216, Direction = 7 , 
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "TravelOn"},
	},
	HomeActions =
	{
		Vanish {},
	}
}

--!EDS RESPAWN BEGIN
Respawn{WaitTime=120,
Conditions = {IsGlobalFlagFalse{Name = "TravelOn"}
			},
}
--!EDS RESPAWN END







--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p21\n2798_Brok.txt


	

	OnBeginDialog{
		Conditions = {
			IsNpcFlagFalse{Name = "FlagBrokKnown"},
		},
		Actions = {
			Say{Tag = "brokGorinson001", String = "Jetzt steht nicht da und glotzt! Nehmt mir schon diese verdammten Ketten ab!"},
			Answer{Tag = "brokGorinson001PC", String = "Wie Ihr wünscht, Herr Zwerg!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "brokGorinson003a", String = "Hm?"},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "brokGorinson003a", String = "Hm?"},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "brokGorinson003a", String = "Hm?"},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "brokGorinson003a", String = "Hm?"},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "brokGorinson003a", String = "Hm?"},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "brokGorinson003a", String = "Hm?"},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "brokGorinson003a", String = "Hm?"},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "brokGorinson003a", String = "Hm?"},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "brokGorinson003a", String = "Hm?"},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "brokGorinson003a", String = "Hm?"},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "brokGorinson003a", String = "Hm?"},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "brokGorinson003a", String = "Hm?"},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "brokGorinson003a", String = "Hm?"},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "brokGorinson003a", String = "Hm?"},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "brokGorinson003a", String = "Hm?"},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "brokGorinson003a", String = "Hm?"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			StopEffect{TargetType = Figure , X = 0 , Y = 0 , NpcId = 2798},
			Say{Tag = "brokGorinson002", String = "Na endlich! Bei Niethalf! Noch einen Tag länger zusammen mit dieser Elfin und ich wäre dem Wahnsinn verfallen! Aber wer oder was seid Ihr eigentlich? Ein Krieger?"},
			Answer{Tag = "brokGorinson002PC", String = "Ein Streiter des Ordens!", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "brokGorinson003", String = "Der Orden, hm? Wurde auch Zeit, dass Ihr Euch hier blicken lasst! Diese verfluchten Söldner habe meine ganze Ausrüstung mitgenommen! Bei den heulenden Schlünden von Barga Gor! Dieses Lumpenpack! Wenn ich sie in die Finger kriege!"},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "brokGorinson003", String = "Der Orden, hm? Wurde auch Zeit, dass Ihr Euch hier blicken lasst! Diese verfluchten Söldner habe meine ganze Ausrüstung mitgenommen! Bei den heulenden Schlünden von Barga Gor! Dieses Lumpenpack! Wenn ich sie in die Finger kriege!"},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "brokGorinson003", String = "Der Orden, hm? Wurde auch Zeit, dass Ihr Euch hier blicken lasst! Diese verfluchten Söldner habe meine ganze Ausrüstung mitgenommen! Bei den heulenden Schlünden von Barga Gor! Dieses Lumpenpack! Wenn ich sie in die Finger kriege!"},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "brokGorinson003", String = "Der Orden, hm? Wurde auch Zeit, dass Ihr Euch hier blicken lasst! Diese verfluchten Söldner habe meine ganze Ausrüstung mitgenommen! Bei den heulenden Schlünden von Barga Gor! Dieses Lumpenpack! Wenn ich sie in die Finger kriege!"},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "brokGorinson003", String = "Der Orden, hm? Wurde auch Zeit, dass Ihr Euch hier blicken lasst! Diese verfluchten Söldner habe meine ganze Ausrüstung mitgenommen! Bei den heulenden Schlünden von Barga Gor! Dieses Lumpenpack! Wenn ich sie in die Finger kriege!"},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "brokGorinson003", String = "Der Orden, hm? Wurde auch Zeit, dass Ihr Euch hier blicken lasst! Diese verfluchten Söldner habe meine ganze Ausrüstung mitgenommen! Bei den heulenden Schlünden von Barga Gor! Dieses Lumpenpack! Wenn ich sie in die Finger kriege!"},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "brokGorinson003", String = "Der Orden, hm? Wurde auch Zeit, dass Ihr Euch hier blicken lasst! Diese verfluchten Söldner habe meine ganze Ausrüstung mitgenommen! Bei den heulenden Schlünden von Barga Gor! Dieses Lumpenpack! Wenn ich sie in die Finger kriege!"},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "brokGorinson003", String = "Der Orden, hm? Wurde auch Zeit, dass Ihr Euch hier blicken lasst! Diese verfluchten Söldner habe meine ganze Ausrüstung mitgenommen! Bei den heulenden Schlünden von Barga Gor! Dieses Lumpenpack! Wenn ich sie in die Finger kriege!"},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "brokGorinson003", String = "Der Orden, hm? Wurde auch Zeit, dass Ihr Euch hier blicken lasst! Diese verfluchten Söldner habe meine ganze Ausrüstung mitgenommen! Bei den heulenden Schlünden von Barga Gor! Dieses Lumpenpack! Wenn ich sie in die Finger kriege!"},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "brokGorinson003", String = "Der Orden, hm? Wurde auch Zeit, dass Ihr Euch hier blicken lasst! Diese verfluchten Söldner habe meine ganze Ausrüstung mitgenommen! Bei den heulenden Schlünden von Barga Gor! Dieses Lumpenpack! Wenn ich sie in die Finger kriege!"},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "brokGorinson003", String = "Der Orden, hm? Wurde auch Zeit, dass Ihr Euch hier blicken lasst! Diese verfluchten Söldner habe meine ganze Ausrüstung mitgenommen! Bei den heulenden Schlünden von Barga Gor! Dieses Lumpenpack! Wenn ich sie in die Finger kriege!"},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "brokGorinson003", String = "Der Orden, hm? Wurde auch Zeit, dass Ihr Euch hier blicken lasst! Diese verfluchten Söldner habe meine ganze Ausrüstung mitgenommen! Bei den heulenden Schlünden von Barga Gor! Dieses Lumpenpack! Wenn ich sie in die Finger kriege!"},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "brokGorinson003", String = "Der Orden, hm? Wurde auch Zeit, dass Ihr Euch hier blicken lasst! Diese verfluchten Söldner habe meine ganze Ausrüstung mitgenommen! Bei den heulenden Schlünden von Barga Gor! Dieses Lumpenpack! Wenn ich sie in die Finger kriege!"},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "brokGorinson003", String = "Der Orden, hm? Wurde auch Zeit, dass Ihr Euch hier blicken lasst! Diese verfluchten Söldner habe meine ganze Ausrüstung mitgenommen! Bei den heulenden Schlünden von Barga Gor! Dieses Lumpenpack! Wenn ich sie in die Finger kriege!"},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "brokGorinson003", String = "Der Orden, hm? Wurde auch Zeit, dass Ihr Euch hier blicken lasst! Diese verfluchten Söldner habe meine ganze Ausrüstung mitgenommen! Bei den heulenden Schlünden von Barga Gor! Dieses Lumpenpack! Wenn ich sie in die Finger kriege!"},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			SetNpcFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "brokGorinson003", String = "Der Orden, hm? Wurde auch Zeit, dass Ihr Euch hier blicken lasst! Diese verfluchten Söldner habe meine ganze Ausrüstung mitgenommen! Bei den heulenden Schlünden von Barga Gor! Dieses Lumpenpack! Wenn ich sie in die Finger kriege!"},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brokGorinson004", String = "Meine Messgeräte! Pläne und alchemische Substanzen! Als ob diese Burschen etwas damit anfangen könnten!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
			IsPlayerFlagTrue{Name = "Q279HasInfoPortal"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "brokGorinson004PC", String = "Dann seid Ihr der Zwerg, der das verschüttete Portal wieder freilegen soll?", AnswerId = 5},
		}}

	OnAnswer{4;
		Conditions = {
			Negated(IsPlayerFlagTrue{Name = "Q279HasInfoPortal"}),
		},
		Actions = {
			Say{Tag = "brokGorinson007", String = "Ich wurde nämlich gerufen, um eine Steinlawine beiseite zu schaffen, die in dieser Gegend ein Portal verschüttet hat!"},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brokGorinson005", String = "Allerdings! Da kämpft man sich durch dieses Ödland, schafft sich diesen elenden Wall hinauf und wird dann vom erstbesten, dahergelaufenen Soldaten in Ketten gelegt!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brokGorinson006", String = "Inzwischen sitze ich schon seit Wochen hier fest!"},
			Answer{Tag = "brokGorinson009PC", String = "Gibt es einen Weg, Eure Ausrüstung wiederzubeschaffen?", AnswerId = 9},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brokGorinson008", String = "Dazu brauche ich allerdings meine Geräte! Und diese Schwachköpfe haben alles davon geschleppt!"},
			Answer{Tag = "brokGorinson008PC", String = "Was für ein Portal?", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brokGorinson009", String = "Es gibt ein Portal von hier direkt nach Graufurt! Ein Steinschlag hat es wohl verschüttet! Und deshalb hat man mich damit beauftragt, es wieder freizuräumen!"},
			Answer{Tag = "brokGorinson009PC", String = "Gibt es einen Weg, Eure Ausrüstung wiederzubeschaffen?", AnswerId = 9},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brokGorinson010", String = "Kaum! Das meiste ist bestimmt schon zerlegt oder verbrannt! Oder versoffen! Oder schlimmeres!"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 279} ,  SetPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{11;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brokGorinson011", String = "Nun, ich benötige hauptsächlich meine alchemischen Substanzen! Den Rest mache ich aus dem Bauch heraus! Har, har!"},
			Answer{Tag = "brokGorinson011PC", String = "Was für Substanzen benötigt Ihr?", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brokGorinson012", String = "Feuerpulver, Schwefelbinder, etwas Brennsalz und eine gute Phiole, um es zu mischen!"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brokGorinson013", String = "Würde mich wundern, wenn so was in dieser Gegend aufzutreiben wäre! Fragt bei den Freihändlern! Wenn hier jemand solche Dinge besitzt, dann sie!"},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 281} , SetPlayerFlagFalse{Name = "Q279InfoEquipment"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{16;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{16;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brokGorinson014", String = "Im Ernst? Gebt her..."},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brokGorinson015", String = "Hm, sieht gut aus! Das wird ordentlich krachen! Damit bekommen wir die paar Felsen schon aus dem Weg, was?"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brokGorinson016", String = "Ich werde die Substanz ansetzen! Gebt mir Bescheid, wenn Ihr soweit seid! Dann gibt's hier einen ordentlichen Rumms! Har har!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
				TransferItem{TakeItem = 2750, Flag = Take} , 
							TransferItem{TakeItem = 2751, Flag = Take} , 
							TransferItem{TakeItem = 2752, Flag = Take} , 
							TransferItem{TakeItem = 2668, Flag = Take} , 
							QuestSolve{QuestId = 290} ,
							QuestSolve{QuestId = 280} ,  
							QuestBegin{QuestId = 291},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brokGorinson017", String = "Ha, das ist die richtige Einstellung! Auf geht´s! Das wird ein Paukenschlag, der selbst den Göttern in den Ohren hallen wird! Kommt mit!"},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "Q279DetonationSequenceGo"},
							SetNpcFlagTrue{Name = "DetonationSaid"},
							SetRewardFlagTrue{ Name = "Steinbrecher"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{24;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnAnswer{24;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{24;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
		}}

	OnAnswer{24;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{24;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnAnswer{24;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{24;
		Conditions = {
			QuestState{QuestId = 279 , State = StateUnknown},
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson003PC", String = "Von was für einer Ausrüstung habt Ihr gesprochen?", AnswerId = 3},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			IsPlayerFlagTrue{Name = "Q279InfoEquipment"},
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson010PC", String = "Ist Eure Ausrüstung zu ersetzen?", AnswerId = 12},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			QuestState{QuestId = 290 , State = StateActive},
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson013PC", String = "Ich habe Eure Sachen zusammen.", AnswerId = 17},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brokGorinson016PC", String = "Dann lasst uns mal ein bisschen Lärm machen!", AnswerId = 22},
		}}

	OnAnswer{24;
		Conditions = {
			Negated(QuestState{QuestId = 279 , State = StateUnknown}),
			Negated(IsPlayerFlagTrue{Name = "Q279InfoEquipment"}),
			Negated(QuestState{QuestId = 290 , State = StateActive}),
			Negated(UND(QuestState{QuestId = 291 , State = StateActive} , IsNpcFlagFalse{Name = "DetonationSaid"})),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end