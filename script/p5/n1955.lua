-->INFO: Captain_Bahir
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Respawn{WaitTime=10}

OnIdleGoHome
{
X = _X , Y = _Y , Direction = 0 , Range = 0 , WalkMode = Walk , UpdateInterval = 10 ,
Conditions = 	{
		IsGlobalFlagFalse{Name = "Q89BahirBringMedicineToTynar"},
		Negated(QuestState{QuestId = 467 , State = StateSolved , UpdateInterval = 50}),
		},
Actions = 	{ }
}

OnIdleGoHome
{
X = 72 , Y = 398 , Direction = 0 , Range = 0 , WalkMode = Walk , UpdateInterval = 10 ,
Conditions = 	{
		IsGlobalFlagTrue{Name = "Q89BahirBringMedicineToTynar"},
		},
Actions = 	{ }
}

OnOneTimeEvent
{
Conditions = {
				QuestState{QuestId = 95 , State = StateSolved}
				},
Actions = {
			RemoveDialog{NpcId = self}
			},
}



-- Utraner nach Hause
OnIdleGoHome
{
	X = 308, Y = 140, Direction = 1 , 
	Conditions =
	{
		QuestState{QuestId = 467 , State = StateSolved , UpdateInterval = 50},
	}
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p5\n1955_Captain_Bahir.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagBahirKnown"},
		},
		Actions = {
			Say{Tag = "captainBahir001", String = "Was treibt ein Runengebundener hier in Shiel? Sprecht rasch, bevor ich Euch aufspießen lasse!"},
			Answer{Tag = "captainBahir001PC", String = "Ich bin auf der Suche nach Meister Rohen! Mein Weg führt nach Osten ins Wildland!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBahirKnown"}),
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "captainBahir003", String = "Was gibt es?"},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBahirKnown"}),
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "captainBahir003", String = "Was gibt es?"},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBahirKnown"}),
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "captainBahir003", String = "Was gibt es?"},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBahirKnown"}),
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "captainBahir003", String = "Was gibt es?"},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBahirKnown"}),
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "captainBahir003", String = "Was gibt es?"},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBahirKnown"}),
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "captainBahir003", String = "Was gibt es?"},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBahirKnown"}),
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "captainBahir003", String = "Was gibt es?"},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBahirKnown"}),
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "captainBahir003", String = "Was gibt es?"},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBahirKnown"}),
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "captainBahir003", String = "Was gibt es?"},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBahirKnown"}),
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "captainBahir003", String = "Was gibt es?"},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBahirKnown"}),
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "captainBahir003", String = "Was gibt es?"},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBahirKnown"}),
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "captainBahir003", String = "Was gibt es?"},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBahirKnown"}),
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "captainBahir003", String = "Was gibt es?"},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBahirKnown"}),
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "captainBahir003", String = "Was gibt es?"},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBahirKnown"}),
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "captainBahir003", String = "Was gibt es?"},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagBahirKnown"}),
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "captainBahir003", String = "Was gibt es?"},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBahirKnown"},
			Say{Tag = "captainBahir002", String = "Ins Wildland? Dann macht Euch nicht allzu viel Hoffnung!"},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBahirKnown"},
			Say{Tag = "captainBahir002", String = "Ins Wildland? Dann macht Euch nicht allzu viel Hoffnung!"},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBahirKnown"},
			Say{Tag = "captainBahir002", String = "Ins Wildland? Dann macht Euch nicht allzu viel Hoffnung!"},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBahirKnown"},
			Say{Tag = "captainBahir002", String = "Ins Wildland? Dann macht Euch nicht allzu viel Hoffnung!"},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBahirKnown"},
			Say{Tag = "captainBahir002", String = "Ins Wildland? Dann macht Euch nicht allzu viel Hoffnung!"},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBahirKnown"},
			Say{Tag = "captainBahir002", String = "Ins Wildland? Dann macht Euch nicht allzu viel Hoffnung!"},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBahirKnown"},
			Say{Tag = "captainBahir002", String = "Ins Wildland? Dann macht Euch nicht allzu viel Hoffnung!"},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBahirKnown"},
			Say{Tag = "captainBahir002", String = "Ins Wildland? Dann macht Euch nicht allzu viel Hoffnung!"},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBahirKnown"},
			Say{Tag = "captainBahir002", String = "Ins Wildland? Dann macht Euch nicht allzu viel Hoffnung!"},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBahirKnown"},
			Say{Tag = "captainBahir002", String = "Ins Wildland? Dann macht Euch nicht allzu viel Hoffnung!"},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBahirKnown"},
			Say{Tag = "captainBahir002", String = "Ins Wildland? Dann macht Euch nicht allzu viel Hoffnung!"},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBahirKnown"},
			Say{Tag = "captainBahir002", String = "Ins Wildland? Dann macht Euch nicht allzu viel Hoffnung!"},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBahirKnown"},
			Say{Tag = "captainBahir002", String = "Ins Wildland? Dann macht Euch nicht allzu viel Hoffnung!"},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBahirKnown"},
			Say{Tag = "captainBahir002", String = "Ins Wildland? Dann macht Euch nicht allzu viel Hoffnung!"},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBahirKnown"},
			Say{Tag = "captainBahir002", String = "Ins Wildland? Dann macht Euch nicht allzu viel Hoffnung!"},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagBahirKnown"},
			Say{Tag = "captainBahir002", String = "Ins Wildland? Dann macht Euch nicht allzu viel Hoffnung!"},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "captainBahir004", String = "Zwei große Armeen der Schwarzen Faust kamen aus dem Wildland bei Nacht!"},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "captainBahir005", String = "Ein Verräter in unseren Reihen öffnete ihnen die Tore und vergiftete unsere Herren! Wir wurden im Schlaf überrannt!"},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "Q88InfoMonumentsTaken"} , SetPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Say{Tag = "captainBahir006", String = "Nun halten sie den gesamten Osten sowie das Dorf Gannan! Sie haben alles besetzt - selbst Eure Runenmonumente!"},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			QuestSolve{QuestId = 87} , SetPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{6;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "captainBahir007", String = "Ha! Wer seid Ihr? Utran schuldet Euch nichts! Kämpft Ihr Euren Krieg - wir kämpfen den unseren!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
			IsGlobalFlagTrue{Name = "Q18EinarToPortalFinal"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "captainBahir007PC", String = "Ich kämpfe bereits den Euren! Ohne meine Hilfe wären Eure Männer für immer im Schattenhain geblieben!", AnswerId = 9},
		}}

	OnAnswer{8;
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "Q18EinarToPortalFinal"}),
		},
		Actions = {
			Say{Tag = "captainBahir012", String = "Ihr habt nichts, was Euch ausweist! Und wer vertraut schon einem Zirkelknecht?"},
			Answer{Tag = "", String = "", AnswerId = 14},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "captainBahir008", String = "Dann wart Ihr es... der Einar gerettet und ihre Nachschubwege unterbrochen hat...?"},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "captainBahir009", String = "Nun denn, es soll Euch Hilfe gewährt werden! Was braucht Ihr?"},
			Answer{Tag = "captainBahir009PC", String = "Einige Eurer Krieger, um die Runenmonumente zurückzuerobern!", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "captainBahir010", String = "Männer wollt Ihr? Seht euch um! Wir haben kaum genug, dieses Lager zu halten!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetPlayerFlagTrue{Name = "Q89LordQuestionTrue"} ,SetPlayerFlagFalse{Name = "Q88HasInfoMonumentsAndBossIll"},
			Say{Tag = "captainBahir011", String = "Das kann und will ich nicht entscheiden! Nur der Lord Kommandant kann das!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{14;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "captainBahir013", String = "Er ist schwach und ohne Bewusstsein! Das Gift des Verräters frisst sich durch seinen Körper! Unser Feldscher ist machtlos!"},
			Answer{Tag = "captainBahir013PC", String = "Wenn nur der Lord entscheiden kann, was Ihr nicht zu entscheiden wagt, dann muss er so rasch wie möglich geheilt werden!", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "captainBahir014", String = "Wie ich bereits sagte: dazu reicht unsere Heilkunst nicht aus! Das Gift Brannigans ist grausamer und tödlicher als alles, was wir kennen!"},
			Answer{Tag = "captainBahir014PC", String = "Dann bedarf es dazu elfischer Arznei!", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			Say{Tag = "captainBahir015", String = "Nun, Shan Muir aus Liannon ist eine Heilerin der weißen Schule! Wir hätten nach ihr geschickt, aber es ist nicht ihr Krieg!"},
			Answer{Tag = "captainBahir015PC", String = "Wenn Euer Kommandant stirbt und ich die Monumente nicht erreiche, dann wird es sehr bald ihr Krieg sein!", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 89} , QuestBegin{QuestId = 90} , SetGlobalFlagTrue{Name = "Q90MoveShanNorth"} , SetPlayerFlagFalse{Name = "Q89LordCommanderQuestion"},
			Say{Tag = "captainBahir016", String = "Dann geht und ersucht sie um Rat! Im Süden - dort auf der Anhöhe - befindet sich das Portal nach Liannon!"},
			Answer{Tag = "", String = "", AnswerId = 19},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "captainBahir017", String = "Aber seht Euch vor! Unsere Späher berichten, dass sich in der Nähe des Portals einige gefährliche Kreaturen herumtreiben!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(QuestState{QuestId = 87 ,  State = StateSolved}),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir003PC", String = "Was ist hier geschehen?", AnswerId = 2},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"},
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir006PC", String = "Helft mir, die Monumente zu befreien!", AnswerId = 7},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"},
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir012PC", String = "Wo finde ich den Lord Kommandant?", AnswerId = 15},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			PlayerHasItem{ItemId = 2360},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "captainBahir017PC", String = "Ich habe ein Heilmittel für den Lord Kommandant!", AnswerId = 21},
		}}

	OnAnswer{20;
		Conditions = {
			Negated(Negated(QuestState{QuestId = 87 ,  State = StateSolved})),
			Negated(IsPlayerFlagTrue{Name = "Q88HasInfoMonumentsAndBossIll"}),
			Negated(IsPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}),
			Negated(PlayerHasItem{ItemId = 2360}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "captainBahir018", String = "Gebt es mir! Ich werde es ihm bringen!"},
			Answer{Tag = "captainBahir018PC", String = "Hier, nehmt!", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2360 , Flag = Take},
			SetGlobalFlagTrue{Name = "Q89BahirBringMedicineToTynar"},
			EndDialog(),
		}}


	EndDefinition()
end