
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p17/n3027_CutsceneMechlanAndVintus.lua")
OneTimeInitAction(	SetGlobalState{Name = "Plot" , State = "JourneyThree" }	)

OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 248 , State = StateUnknown},
				},
Actions = 		{
				QuestBegin{QuestId = 248},
				QuestBegin{QuestId = 249} 
				}
}	
	
DebugInitAction(	QuestBegin{QuestId = 265}	)
DebugInitAction(	QuestBegin{QuestId = 318}	)
DebugInitAction(	QuestBegin{QuestId = 552}	)

OneTimeInitAction( SetEffect{Effect = "Chain" , Length = 0 , TargetType = Figure , NpcId = 2619} )



--MAINQUEST Q248 BEGINS HERE
--Solver für Erklimmen des Walles
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 257 , State = StateActive},
				FigureInRange{X = 371 , Y = 371 , NpcId =Avatar , Range = 10}
				},
Actions = 		{
				QuestSolve{QuestId = 257},
				}
}
--Solver für das Weitergehen
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 257 , State = StateSolved},
				QuestState{QuestId = 264 , State = StateSolved},
				QuestState{QuestId = 250 , State = StateSolved},
				},
Actions = 		{
				QuestBegin{QuestId = 253},
				}
}
--Timer für Resourcen AH
OnEvent
{
Conditions =	{
				IsGlobalTimeElapsed{Name = "Q248ResourcesAHTimer" , Seconds = 900},
				IsGlobalFlagFalse{Name = "Q248AHNewRessourcesReady"},
				IsPlayerFlagTrue{Name = "Q248RessourcesAHGivenOnce"},
				},
Actions = 		{
				SetGlobalFlagTrue{Name = "Q248AHNewRessourcesReady"},
				}
}
--Timer für Resourcen AH
OnEvent
{
Conditions =	{
				IsGlobalTimeElapsed{Name = "Q248OVoneTimer" , Seconds = 1200},
				IsGlobalFlagFalse{Name = "Q248WaresVoneOk"},
				IsPlayerFlagTrue{Name = "Q248RessourcesVoneGiven"},
				},
Actions = 		{
				SetGlobalFlagTrue{Name = "Q248WaresVoneOk"},
				}
}
--Timer für Resourcen Main
OnEvent
{
Conditions =	{
				IsGlobalTimeElapsed{Name = "Q248OMainResTimer" , Seconds = 1200},
				IsGlobalFlagFalse{Name = "Q248WaresMainOk"},
				IsPlayerFlagTrue{Name = "Q248RessourcesVoneGiven"},
				},
Actions = 		{
				SetGlobalFlagTrue{Name = "Q248WaresMainOk"},
				}
}
--MAINQUEST Q248 ENDS HERE

--MAINQUEST Q294 Splitter BEGINS HERE
--SpringDance solver > Auch auf Godwall
OnOneTimeEvent
{
Conditions = 
	{
	QuestState{QuestId = 296 , State = StateActive},
	PlayerHasItem{ItemId = 2634},
	},
Actions =	
	{
	QuestSolve{QuestId = 297},
	QuestSolve{QuestId = 296},
	}
}
--MAINQUEST Q294 Splitter ENDS HERE

--SIDEQUEST Q248 BEGINS HERE
--Solver für Medizin
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 259 , State = StateActive},
				PlayerHasItem{ItemId = 2635},
				},
Actions = 		{
				QuestSolve{QuestId = 259},
				QuestBegin{QuestId = 260},
				}
}
--SIDEQUEST Q248 ENDS HERE

OnOneTimeEvent
{
	Conditions =
	{
		IsMonumentInUse {X = 180, Y = 232, Range = 0},
	},
	Actions =
	{
		ChangeBuildingOwner {X = 166, Y = 191},
		ChangeBuildingOwner {X = 166, Y = 197},
		ChangeBuildingOwner {X = 183, Y = 195},
		ChangeBuildingOwner {X = 164, Y = 219},
		ChangeBuildingOwner {X = 191, Y = 192},
		ChangeBuildingOwner {X = 159, Y = 209},
		ChangeBuildingOwner {X = 189, Y = 206},
		ChangeBuildingOwner {X = 170, Y = 210},
		ChangeBuildingOwner {X = 181, Y = 200},
		ChangeBuildingOwner {X = 182, Y = 209},
		ChangeBuildingOwner {X = 160, Y = 199},
		ChangeBuildingOwner {X = 151, Y = 210},
		ChangeBuildingOwner {X = 151, Y = 202},
		ChangeBuildingOwner {X = 151, Y = 191},
		ChangeBuildingOwner {X = 153, Y = 225},
	}
}
 --DO NOT REMOVE THIS LINE ;)
 
 -- Outcry
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "BrenBraunblatt", Seconds = 5, UpdateInterval = 10},
	},
	Actions =
	{
		Outcry{ Tag = "outcryBrenGodw001", NpcId = 2615, String = "Wir sind frei! Sie sind weg! Kommt raus Leute!", Color = ColorWhite },
	}
	
} 

	EndDefinition()
end
