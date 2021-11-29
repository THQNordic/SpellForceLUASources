function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Laden der Cutscenes
dofile("script/p30/n4177_CutsceneTreeAttack.lua")

--Nightwhisper solven
OnEvent
{
Conditions = {
		QuestState{QuestId = 539 , State = StateActive}
		},
Actions = {
		QuestSolve{QuestId = 539},
		QuestSolve{QuestId = 534},
		}
}
------------MAIN QUEST Q540 Breathing Forest begins here
--MainQuest Starten
OnOneTimeEvent
{
Conditions = {
		QuestState{QuestId = 540 , State = StateUnknown}
		},
Actions = {
		QuestBegin{QuestId = 540},
		QuestBegin{QuestId = 541},
		}
}
--Herz genommen?
OnOneTimeEvent
{
Conditions = {
		PlayerHasItem{ItemId = 3460}
		},
Actions = {
		SetRewardFlagTrue{ Name = "AtmenderWald1Waldherz"}
		}
}
--amPortal?
OnOneTimeEvent
{
Conditions = {
		QuestState{QuestId = 541 , State = StateActive},
		FigureInRange{X = 142 , Y = 245 , Range = 10 , NpcId = Avatar}
		},
Actions = {
		QuestBegin{QuestId = 542},
		QuestSolve{QuestId = 541},
		SetRewardFlagTrue{ Name = "AtmenderWald2Portal"}
		}
}
------------MAIN QUEST Q540 Breathing Forest ends here


---- SIDEQUEST Q395 BLUT begins here
---- Q 395, Q 396 ---

---- Prüfen, ob der Spieler das Blut der Spinne hat --
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
----------

---- Prüfen, ob der Spieler das Blut aller drei Monster hat (Blut-Quest) ---

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 2540 },
		PlayerHasItem {ItemId = 3165 },
		PlayerHasItem {ItemId = 3166 },
	},
	Actions =
	{
		SetPlayerFlagTrue {Name = "Q395AllBlood"},
	}
}

------- SIDEQUEST Q395 BLUT ends here


EndDefinition()

end
