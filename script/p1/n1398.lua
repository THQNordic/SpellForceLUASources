-->INFO: Udwin
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- ? setzen:
OnOneTimeEvent
{
	Actions = {
		SetDialogType{Type = SideQuest},
	},
}


---Spawn only wenn Quest aktiv und Flag gesetzt.
---- -Q41- -Q49-
SpawnOnlyWhen
{
--- !TO DO! Verscheidene Spawnlocation und Roambereich
X = 209 , Y = 115 ,
Conditions = 	{
		Negated(QuestState{QuestId = 41 , State = StateUnknown}),
		Negated(QuestState{QuestId = 49 , State = StateSolved}),
		IsPlayerFlagTrue{Name = "SpawnFlagForUdwin"},
		},
Actions = {
	SetGlobalFlagTrue{Name = "UdwinSpawned"},
},
}



OnIdleGoHome{X = 211, Y = 117, Direction = SouthWest, 
	Conditions = {
		IsNpcFlagFalse{Name = "NowVanishing", UpdateInterval = 10},
	},
}

-- verschwinden event
OnEvent
{
	Conditions = {
		FigureHasAggro{},
		ODER(
			FigureInRange{X = 197, Y = 95, Range = 8, UpdateInterval = 20},
			FigureInRange{X = 205, Y = 95, Range = 5, UpdateInterval = 20}
			),
		IsNpcFlagFalse{Name = "NowVanishing", UpdateInterval = 5},
	},
	Actions = {
		ChangeRace{Race = 152},
		SetEffect{Effect = "DeMaterialize", Length = 1550},
		SetNpcTimeStamp{Name = "DespawnTimer"},
		SetNpcFlagTrue{Name = "NowVanishing"},
		SetGlobalFlagTrue{Name = "GhostIsNowVanishing"},
		SetFreezeFlagTrue{},
	},
}

Despawn
{
	Conditions = {
		IsNpcTimeElapsed{Name = "DespawnTimer", Seconds = 1.5, UpdateInterval = 5},
	},
	Actions = {
		ClearNpcTimeStamp{Name = "DespawnTimer"},
		SetNpcFlagTrue{Name = "AllowRespawn"},
		SetFreezeFlagFalse{},
	},
}

Respawn
{
	WaitTime = 1,
	Conditions = {
		IsNpcFlagTrue{Name = "AllowRespawn", UpdateInterval = 10},
	}, 
	Actions = {
		SetNpcFlagFalse{Name = "AllowRespawn"},
		SetNpcFlagFalse{Name = "NowVanishing"},
		SetGlobalFlagFalse{Name = "GhostIsNowVanishing"},
		SetEffect{Effect = "Materialize", X = _X, Y = _Y, Length = 1500},
		LookAtDirection{Direction = SouthWest},
		SetNpcFlagTrue{Name = "UdwinMustChangeRace"},
		RemoveDialog{NpcId = self},
	}, 
	DeathActions = {
		SetFreezeFlagFalse{},
	} 
}

OnEvent
{
	Conditions = {
		IsNpcFlagTrue{Name = "UdwinMustChangeRace", UpdateInterval = 10},
	},
	Actions = {
		SetNpcFlagFalse{Name = "UdwinMustChangeRace"},
		ChangeRace{Race = 118 , NpcId = 1398},
		--AttackTarget{Target = Avatar , FriendlyFire = TRUE}, 
	},
}



--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p1\n1398_Udwin.txt


	

	OnBeginDialog{
		Conditions = {
			IsPlayerFlagFalse{Name = "FlagUdwinKnown"},
		},
		Actions = {
			Say{Tag = "udwin001", String = "Wo... bin ich?"},
			Answer{Tag = "udwin001PC", String = "In Nortander, im Jahre Acht nach der Konvokation! Ihr habt lange geschlafen, wenn Ihr der seid, für den ich Euch halte!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUdwinKnown"}),
			QuestState{QuestId = 49 , State = StateUnknown},
			PlayerHasItem{ItemId = 2003},
		},
		Actions = {
			Say{Tag = "udwin004", String = "Was... wollt Ihr?"},
			OfferAnswer{Tag = "udwin004PC", String = "Erinnert Ihr Euch, Udwin?", AnswerId = 3},
			OfferAnswer{Tag = "udwin006PC", String = "Vielleicht erkennt Ihr dieses Buch?", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUdwinKnown"}),
			QuestState{QuestId = 49 , State = StateUnknown},
			Negated(PlayerHasItem{ItemId = 2003}),
		},
		Actions = {
			Say{Tag = "udwin004", String = "Was... wollt Ihr?"},
			OfferAnswer{Tag = "udwin004PC", String = "Erinnert Ihr Euch, Udwin?", AnswerId = 3},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUdwinKnown"}),
			Negated(QuestState{QuestId = 49 , State = StateUnknown}),
			PlayerHasItem{ItemId = 2003},
		},
		Actions = {
			Say{Tag = "udwin004", String = "Was... wollt Ihr?"},
			OfferAnswer{Tag = "udwin006PC", String = "Vielleicht erkennt Ihr dieses Buch?", AnswerId = 6},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsPlayerFlagFalse{Name = "FlagUdwinKnown"}),
			Negated(QuestState{QuestId = 49 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 2003}),
		},
		Actions = {
			Say{Tag = "udwin004", String = "Was... wollt Ihr?"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "udwin002", String = "Ich... wanderte lange durch dunkle Gänge... sehr lange... mein Name..."},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 49 , State = StateUnknown},
			PlayerHasItem{ItemId = 2003},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUdwinKnown"},
			Say{Tag = "udwin003", String = "Ist... Udwin..."},
			OfferAnswer{Tag = "udwin004PC", String = "Erinnert Ihr Euch, Udwin?", AnswerId = 3},
			OfferAnswer{Tag = "udwin006PC", String = "Vielleicht erkennt Ihr dieses Buch?", AnswerId = 6},
		}}

	OnAnswer{2;
		Conditions = {
			QuestState{QuestId = 49 , State = StateUnknown},
			Negated(PlayerHasItem{ItemId = 2003}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUdwinKnown"},
			Say{Tag = "udwin003", String = "Ist... Udwin..."},
			OfferAnswer{Tag = "udwin004PC", String = "Erinnert Ihr Euch, Udwin?", AnswerId = 3},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 49 , State = StateUnknown}),
			PlayerHasItem{ItemId = 2003},
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUdwinKnown"},
			Say{Tag = "udwin003", String = "Ist... Udwin..."},
			OfferAnswer{Tag = "udwin006PC", String = "Vielleicht erkennt Ihr dieses Buch?", AnswerId = 6},
		}}

	OnAnswer{2;
		Conditions = {
			Negated(QuestState{QuestId = 49 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 2003}),
		},
		Actions = {
			SetPlayerFlagTrue{Name = "FlagUdwinKnown"},
			Say{Tag = "udwin003", String = "Ist... Udwin..."},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "udwin005", String = "Was ist geschehen? Nur schwarze Nebel füllen meinen Geist..."},
			Answer{Tag = "udwin005PC", String = "Ihr seid an die Oberfläche zurückgekehrt, wie Eure einstigen Gefährten!", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			QuestBegin{QuestId = 49} , QuestSolve{QuestId = 558} , SetPlayerFlagTrue{Name = "Q49PlayerHasSeenUdwin"},
			Say{Tag = "udwin006", String = "Nur Nebel... Stimmen... ich kann mich... nicht erinnern..."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 49 , State = StateUnknown},
			PlayerHasItem{ItemId = 2003},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "udwin004PC", String = "Erinnert Ihr Euch, Udwin?", AnswerId = 3},
			OfferAnswer{Tag = "udwin006PC", String = "Vielleicht erkennt Ihr dieses Buch?", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			QuestState{QuestId = 49 , State = StateUnknown},
			Negated(PlayerHasItem{ItemId = 2003}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "udwin004PC", String = "Erinnert Ihr Euch, Udwin?", AnswerId = 3},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 49 , State = StateUnknown}),
			PlayerHasItem{ItemId = 2003},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "udwin006PC", String = "Vielleicht erkennt Ihr dieses Buch?", AnswerId = 6},
		}}

	OnAnswer{5;
		Conditions = {
			Negated(QuestState{QuestId = 49 , State = StateUnknown}),
			Negated(PlayerHasItem{ItemId = 2003}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "udwin007", String = "Ich kenne es... gebt es mir."},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "udwin008", String = "Ja, ich errinnere mich! Das ist meines Schreibers Hand..."},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "udwin009", String = "Eine Reise in die Tiefe... Abgründe über ewigem Feuer..."},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{9;
		Conditions = {
		},
		Actions = {
			Say{Tag = "udwin010", String = "Und Klauen... Klauen in der Finsternis..."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "udwin011", String = "Ketten... Haken... Körper... Blut, überall Blut..:"},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "udwin012", String = "Ich höre ihre Schreie... Der Schmerz... Unerträglicher Schmerz!"},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			Say{Tag = "udwin013", String = "Eine Fratze... Das Monstrum... Argh, fort mit Dir, Ungetüm!"},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
		},
		Actions = {
			TransferItem{TakeItem = 2003 ,  Flag = Take},
			QuestSolve{QuestId = 50} , QuestBegin{QuestId = 51} , QuestSolve{QuestId = 46}, QuestSolve{QuestId = 43},
			ChangeRace{Race = 118 , NpcId = 1398},
				QuestSolve{QuestId = 558},
				SetPlayerFlagFalse{Name = "Q49PlayerHasSeenUdwin"},
				SetNpcFlagTrue{Name = "UdwinMustAttackAvatar"},
				RemoveDialog{NpcId = self},
			EndDialog(),
		}}


	EndDefinition()
end