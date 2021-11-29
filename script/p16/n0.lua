REM = [[
PortalFlight = CreateCameraScript
{
Script =
		{
		CameraReset(),
  	   AddMoveTo(0.3,0.1,    64,  362,  87.5),
  	   AddLookAt(0.3,0.1,    64,  378,   0.0),
		CameraStart(),
		}
}
]]

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


dofile("script/p16/n2576_CutsceneHokanII_nomask.lua")	
dofile("script/p16/n2576_CutsceneHokanI_nomask.lua")		
dofile("script/p16/n2576_CutsceneHokanII_mask.lua")		
dofile("script/p16/n2576_CutsceneHokanI_mask.lua")
dofile("script/p16/n2497_CutsceneIsmailEntry.lua")

--PATCH Greif Dialog entfernen
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 493 , State = StateUnknown},
				},
Actions =		{
				RemoveDialog{NpcId = 3605},
				}
}
--PATCH und wieder an
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 493 , State = StateActive},
				},
Actions =		{
				EnableDialog{NpcId = 3605},
				}
}

---MAINQUEST Maske des Belial (solver für Maske nochmal)

--Solver für Maske Korshar Part
OnOneTimeEvent
{
Conditions =	{
				PlayerHasItem{ItemId = 2337},
--				PlayerHasItem{ItemId = 2615},
				QuestState{QuestId = 217 , State = StateActive},
				},
Actions =		{
				QuestSolve{QuestId = 217},
				QuestSolve{QuestId = 215},
				SetRewardFlagTrue{ Name = "MaskeDesBelial2"}
				}
}
-- Solver für Maske gesamt
OnOneTimeEvent
{
Conditions =	{
				PlayerHasItem{ItemId = 2337},
				PlayerHasItem{ItemId = 2615},
				QuestState{QuestId = 212 , State = StateSolved},
				QuestState{QuestId = 215 , State = StateSolved},
				QuestState{QuestId = 218 , State = StateUnknown},
				},
Actions =		{
				QuestSolve{QuestId = 211},
				QuestBegin{QuestId = 218},
				}
}
---MAINQUEST Maske des Belial Ende

--MAINQUEST Q242 BEGINS HERE
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 247 , State = StateActive},
				},
Actions =		{
--				QuestBegin{QuestId = 242},
				QuestBegin{QuestId = 243},
				QuestSolve{QuestId = 247},
				}
}
---Alternativer Start
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 247 , State = StateUnknown},
				},
Actions =		{
				QuestBegin{QuestId = 242},
				QuestBegin{QuestId = 243},
				QuestSolve{QuestId = 247},
				}
}

--Suche beginnen
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 490 , State = StateSolved},
				},
Actions =		{
				QuestBegin{QuestId = 244},
				}
}

--Maskenqueste geben wenn unbekannt
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 211 , State = StateUnknown},
				IsGlobalFlagTrue{Name = "Q210HokanWantsMask" , UpdateInterval = 10}
				},
Actions =		{
--				QuestBegin{QuestId = 211},
				QuestBegin{QuestId = 559},
				}
}

----Suche Solven, wenn P keine Maske hat
--OnOneTimeEvent
--{
--Conditions =	{
--				QuestState{QuestId = 244 , State = StateActive},
--				IsPlayerFlagTrue{Name = "Q245SpokenToHokanNoMask"}, --kommt aus Cutscene!!TO DO!!
--				},
--Actions =		{
--				QuestSolve{QuestId = 244},
--				QuestBegin{QuestId = 245}
--				}
--}
----Suche Solven, wenn Dialog ok
--OnOneTimeEvent
--{
--Conditions =	{
--				QuestState{QuestId = 244 , State = StateActive},
--				IsPlayerFlagTrue{Name = "Q245SpokenToHokanMaskOk"}, --kommt aus Cutscene!!TO DO!!
--				},
--Actions =		{
--				QuestSolve{QuestId = 244},
--				QuestSolve{QuestId = 242}
--				}
--}
--Schwert gefunden?
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 491 , State = StateActive},
				PlayerHasItem{ItemId = 3245},
				},
Actions =		{
				QuestSolve{QuestId = 491},
				SetRewardFlagTrue{ Name = "FluesterndeStadt1Item1"}
				}
}
--Rüstung gefunden?
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 492 , State = StateActive},
				PlayerHasItem{ItemId = 3246},
				},
Actions =		{
				QuestSolve{QuestId = 492},
				SetRewardFlagTrue{ Name = "FluesterndeStadt1Item2"}
				}
}
--alles da?
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 491 , State = StateSolved},
				QuestState{QuestId = 492 , State = StateSolved},
				QuestState{QuestId = 493 , State = StateSolved},
				},
Actions =		{
				QuestBegin{QuestId = 494},
				SetRewardFlagTrue{ Name = "FluesterndeStadt1Item3"}
				}
}
--Ismail hin?
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 490 , State = StateActive},
				FigureDead{NpcId = 2497},
				},
Actions =		{
				QuestSolve{QuestId = 490},
				SetRewardFlagTrue{ Name = "FluesterndeStadt4Endkampf"}
				}
}
--MAINQUEST Q242 ENDS HERE


--Amra und Lea
OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 2909},
		IsGlobalFlagTrue {Name = "Quest387Helper"},
	},
	Actions =
	{
		QuestSolve {QuestId = 387},
		QuestBegin {QuestId = 388},
		SetRewardFlagTrue{ Name = "AmraLeaGrab"}
	}
	
}


--Amra und Lea Ende

-------EVERWHITE SILK BEGINS HERE
OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem{ItemId = 3437 , Amount = 2},
		QuestState{QuestId = 525 , State = StateActive}
	},
	Actions =
	{
		QuestSolve {QuestId = 525},
	}
	
}
--alles da?
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 525 , State = StateSolved},
				QuestState{QuestId = 524 , State = StateSolved},
				QuestState{QuestId = 526 , State = StateUnknown},
				},
Actions =		{
				QuestBegin{QuestId = 526},
				}
}
-------EVERWHITE SILK ENDS HERE

-- Outcries

-- Uthar sieht Greif
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRangeNpc {TargetNpcId = 3605, NpcId = 3602, Range = 10, UpdateInterval = 20},
	},
	Actions =
	{
		Outcry{ Tag = "outcryUtharWhisper001", NpcId = 3602, String = "Ah, mein treuer Freund!", Color = ColorWhite },
	}
}


-- Uthar sieht Ismail
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {NpcId = 3602, Range = 10, X = 326, Y = 385},
	},
	Actions =
	{
		Outcry{ Tag = "outcryUtharWhisper002", NpcId = 3602, String = "Das ist Dein Ende, Totenbeschwörer! Meine Rache ist nah!", Color = ColorWhite },
		SetGlobalTimeStamp {Name = "IsmailOutcry"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "IsmailOutcry", Seconds = 8},
	},
	Actions =
	{
		Outcry{ Tag = "outcryIsmailWhisper001", NpcId = 2497, String = "Kommt nur! Gleich werdet Ihr Bekanntschaft mit dem Tod schließen!", Color = ColorWhite },	
	}
}


EndDefinition()
end
