-->INFO: Brok
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- ? setzen:
OnOneTimeEvent
{
	Actions = {
		SetDialogType{Type = SideQuest},
		ChangeRace{Race = 152}, -- test neutral elf prisoner
	},
}

Respawn{WaitTime = 15}

OnIdleGoHome{X = _X, Y = _Y, Direction = NorthWest}

--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p1\n1393_Brok.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagBrokKnown"},
		},
		Actions = {
			Say{Tag = "brok001", String = "Vorsicht! Geht nicht zu nahe an die Mine heran!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBrokKnown"}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok002", String = "Grüße!"},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBrokKnown"},
			Say{Tag = "", String = ""},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brok003", String = "Ein Schemen ist aus den alten Schächten aufgestiegen und streift seitdem dort umher! Einige haben schon versucht ihn zu vertreiben!"},
			Answer{Tag = "brok003PC", String = "Ohne Erfolg?", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brok004", String = "Ja, sie gingen alle in den Tod! Starben unter der rostigen Klinge des Geistes! Er tötet alles, was in seine Nähe kommt!"},
			Answer{Tag = "brok004PC", String = "Verstehe... Nun, vielleicht kann ich Euch helfen?", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 36} , QuestBegin{QuestId = 38},
			Say{Tag = "brok005", String = "Leutnant Fell verlangt das Schwert der Erscheinung als Beweis dafür, dass die Gefahr gebannt wurde! Solltet Ihr den Geist bezwingen können, bringt es zu mir!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brok006", String = "Habt Ihr das Schwert?"},
			Answer{Tag = "brok006PC", String = "Hier ist es!", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 1998, GiveItem = 0, Flag = Take},
			QuestSolve{QuestId = 39} , QuestSolve{QuestId = 36},
			SetRewardFlagTrue{ Name = "GeistInDerMine"},
			Say{Tag = "brok007", String = "Danke! Ihr habt einem Soldaten einen großen Dienst erwiesen! Hier, bitte nehmt! Das ist alles, was ich euch geben kann!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brok008", String = "Hmm... er sieht alt aus... Woher habt Ihr ihn?"},
			Answer{Tag = "brok008PC", String = "Er blieb zurück, als ich den Geist erschlug!", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brok009", String = "Seltsame Zeichen darauf..."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brok010", String = "Geht am besten zu Ortah Gelbbarth, dem Händler! Er sammelt allerlei kurioses Zeug! Vielleicht kennt er sich damit aus..."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 41} , QuestBegin{QuestId = 42} , QuestBegin{QuestId = 44},
			Say{Tag = "brok011", String = "Seine Hütte befindet sich westlich der Stadt, am Weg nach Eloni!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{13;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brok012", String = "Nach Shiel, ins Land des Hauses Utran! Die Torfeste ist allerdings verschlossen!"},
			Answer{Tag = "brok012PC", String = "Warum?", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brok013", String = "In Shiel herrscht Krieg! Brannigans Horden haben das Land fast komplett überrant! Sie haben bereits das Portal in Shiel besetzt!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "brok014", String = "Die utranischen Wachen lassen niemanden mehr durch, solange das Portal auf der anderen Seite nicht sicher ist!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "RoadAsked"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			Negated(AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20}),
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok016", String = "Hm, wenn ich Euch so ansehe... vielleicht seid Ihr noch ein wenig zu unerfahren für eine solche Begegnung! Das würde ein schlimmes Ende nehmen!"},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			QuestState{QuestId = 36 , State = StateUnknown},
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			QuestState{QuestId = 36 , State = StateUnknown},
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok002PC", String = "Welche Mine? Was ist dort?", AnswerId = 2},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			QuestState{QuestId = 39 , State = StateActive},
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok005PC", String = "Der Geist ist besiegt!", AnswerId = 6},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown}),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok007PC", String = "Kennt Ihr diesen Ring, Soldat?", AnswerId = 9},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"}),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok011PC", String = "Wohin führt dieser Weg?", AnswerId = 14},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			QuestState{QuestId = 38 , State = StateActive},
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
			OfferAnswer{Tag = "brok014PC", String = "Glaubt Ihr, ich kann den Geist bezwingen?", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
			AvatarIsLevel{Level = 5 , Player = self , UpdateInterval = 20},
			Negated(QuestState{QuestId = 36 , State = StateUnknown}),
			Negated(QuestState{QuestId = 39 , State = StateActive}),
			Negated(UND(PlayerHasItem{ItemId = 1995} , QuestState{QuestId = 41 , State = StateUnknown})),
			Negated(UND(QuestState{QuestId = 86 , State = StateUnknown} , IsNpcFlagFalse{Name = "RoadAsked"})),
			Negated(QuestState{QuestId = 38 , State = StateActive}),
		},
		Actions = {
			Say{Tag = "brok015", String = "Nun, Ihr wirkt stark genug auf mich!"},
		}}


	EndDefinition()
end