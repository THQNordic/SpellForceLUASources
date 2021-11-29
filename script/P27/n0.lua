function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--Queststatus initialisieren
OnOneTimeEvent
{
Conditions = {
		QuestState{QuestId = 534 , State = StateUnknown}
		},
Actions = {
		QuestBegin{QuestId = 534},
		QuestBegin{QuestId = 535},
		}
}
--Southern Godmark solven
OnOneTimeEvent
{
Conditions = {
		QuestState{QuestId = 533 , State = StateActive}
		},
Actions = {
		QuestSolve{QuestId = 533},
		QuestSolve{QuestId = 531},
		}
}
-- Monument erobert?
OnOneTimeEvent
{
Conditions = {
		QuestState{QuestId = 537 , State = StateActive},
		IsMonumentInUse{X = 387 , Y = 45 , Range = 5}
		},
Actions = {
		QuestSolve{QuestId = 537},
		QuestBegin{QuestId = 538},
		SetRewardFlagTrue{ Name = "NachUrgath2Monument"}
		}
}

OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 4354},
		FigureDead {NpcId = 4355},
		FigureDead {NpcId = 4356},
		FigureDead {NpcId = 4357},
		FigureDead {NpcId = 4358},
		FigureDead {NpcId = 4359},
		FigureDead {NpcId = 4360},
		FigureDead {NpcId = 4361},
		FigureDead {NpcId = 4362},
		FigureDead {NpcId = 4363},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "Q537MenDead"},
	}
}

-- Outcry
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRangeNpc {NpcId = 0, TargetNpcId = 4201, Range = 10, UpdateInterval = 10},
	},
	Actions =
	{
		Outcry{ Tag = "outcryCraigIceG001", NpcId = 4201, String = "Setzt mich frei, Lichtbeter!", Color = ColorWhite },
		LookAtFigure{NpcId = 4201, Target = Avatar},
	}
}

----------BLUT
---- Prüfen, ob der Spieler das Blut der Riesenspinne hat --

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 3165 },
		QuestState {QuestId = 406, State = StateActive},
	},
	Actions =
	{
		QuestSolve{QuestId = 406} ,
	}
}
EndDefinition()

end
