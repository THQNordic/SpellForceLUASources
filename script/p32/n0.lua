function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p32/n3029_CutsceneFlightBadGuys.lua")
dofile("script/p32/n3028_CutsceneTheEnd.lua")

-- ab hier scriptbefehle:

--Breathing Forest Solven
OnOneTimeEvent
{
	Conditions =
	{
		ODER(QuestState{QuestId = 542 , State = StateActive}, QuestState{QuestId = 541 , State = StateActive})
	},
	Actions =
	{
		QuestSolve{QuestId = 542},
		QuestSolve{QuestId = 541},
		QuestSolve{QuestId = 540},

	}
}

-------------------MAINQUEST Q543 Der KReis schließt sich begins here
----MainQuest starten
OnOneTimeEvent
{
	Conditions =
	{
		QuestState{QuestId = 543 , State = StateUnknown},
	},
	Actions =
	{
		QuestBegin{QuestId = 543},
		QuestBegin{QuestId = 544},
	}
}

---unteres Tor gesehen?
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "Q543HassSeenLowGate"},
		QuestState{QuestId = 545 , State = StateUnknown},
	},
	Actions =
	{
		QuestBegin{QuestId = 545},
	}
}
---unteres Tor lösen
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "SharrowGateLowOpen"},
		QuestState{QuestId = 545 , State = StateActive},
	},
	Actions =
	{
		QuestSolve{QuestId = 545},
	}
}
---oberes Tor gesehen?
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "Q543HassSeenHighGate"},
		QuestState{QuestId = 546 , State = StateUnknown},
	},
	Actions =
	{
		QuestBegin{QuestId = 546},
	}
}
---oberes Tor lösen
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "SharrowGateHighOpen"},
		QuestState{QuestId = 546 , State = StateActive},
	},
	Actions =
	{
		QuestSolve{QuestId = 546},
	}
}

---Soulforger tot?
OnOneTimeEvent
{
	Conditions =
	{
		FigureDead{NpcId = 4202}
	},
	Actions =
	{
		SetRewardFlagTrue{ Name = "KreisSchluss4Soulforger"},
		QuestSolve{QuestId = 547},
		QuestSolve{QuestId = 543},
		
	}
}

OnOneTimeEvent
{
	Conditions = {
		IsGlobalFlagTrue{Name = "BladeArmyAttackNow", UpdateInterval = 5},
	},
	Actions = {
		Outcry{ Tag = "outcrySoulforgerSwd002"   , NpcId = 4202, String = "Ah! Schon lange habe ich diesen Kampf herbeigesehnt! Kommt! Bringen wir es zu Ende!"         , Color = ColorWhite },
	},
}

-------------------MAINQUEST Q543 Der KReis schließt sich ends here
		
EndDefinition()
end