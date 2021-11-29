function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p7/n3035_CutsceneRohenDeath.lua")

--Auf Reise 4 Setzen
--DebugInitAction( SetGlobalState{Name = "Plot", State = "JourneyFour"} )
---Queststatus init
--Wildland solven
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 106 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 106},
		QuestSolve{QuestId = 101}
		}
}

--Reise 4 Beginn
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 555 , State = StateActive},
		},
Actions =	{
		QuestSolve{QuestId = 555},
		QuestSolve{QuestId = 554},
		QuestBegin{QuestId = 519},
		QuestBegin{QuestId = 520}
		}
}
--Einheitenplä-Flags
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 1075}
		},
Actions =	{
		SetGlobalFlagTrue{Name = "Q523Has1075"},
		}
}
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 865}
		},
Actions =	{
		SetGlobalFlagTrue{Name = "Q523Has865"},
		}
}
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 1081}
		},
Actions =	{
		SetGlobalFlagTrue{Name = "Q523Has1081"},
		}
}
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 1105}
		},
Actions =	{
		SetGlobalFlagTrue{Name = "Q523Has1105"},
		}
}
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 1109}
		},
Actions =	{
		SetGlobalFlagTrue{Name = "Q523Has1109"},
		}
}
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 1111}
		},
Actions =	{
		SetGlobalFlagTrue{Name = "Q523Has1111"},
		}
}
--alle Sachen da?
OnOneTimeEvent
{
Conditions =	{
		IsGlobalFlagTrue{Name = "Q523Has1075"},
		IsGlobalFlagTrue{Name = "Q523Has865"}, 
		IsGlobalFlagTrue{Name = "Q523Has1081"},
		IsGlobalFlagTrue{Name = "Q523Has1105"},
		IsGlobalFlagTrue{Name = "Q523Has1109"},
		IsGlobalFlagTrue{Name = "Q523Has1111"},

		},                          
Actions =	{                       
		SetGlobalFlagTrue{Name = "Q523HasAllItems"}
		}
}
--eine Sache?
OnOneTimeEvent
{
Conditions =	{
		ODER(IsGlobalFlagTrue{Name = "Q523Has1075"}, 
			ODER(IsGlobalFlagTrue{Name = "Q523Has865"}, 
					ODER(IsGlobalFlagTrue{Name = "Q523Has1081"},
							ODER(IsGlobalFlagTrue{Name = "Q523Has1105"},
									ODER(IsGlobalFlagTrue{Name = "Q523Has1109"},
		IsGlobalFlagTrue{Name = "Q523Has1111"}))))),

		},                          
Actions =	{                       
		SetGlobalFlagTrue{Name = "Q523HasASomeItems"}
		}
}

-- Outcry
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRangeNpc {NpcId = 0, TargetNpcId = 4009, Range = 10, UpdateInterval = 10},
	},
	Actions =
	{
		Outcry{ Tag = "outcryUriasIceG001", NpcId = 4009, String = "Freund! Hier herüber!", Color = ColorWhite },
	}
}

EndDefinition()
end
