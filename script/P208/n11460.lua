MyFarbe =
{
	[1] = { Zeile = "", Spalte = ""},
	[2] = { Zeile = "", Spalte = ""},
	[3] = { Zeile = "", Spalte = ""},
	[4] = { Zeile = "", Spalte = ""},
	[5] = { Zeile = "", Spalte = ""},
}

MyColorCode = 0   --  1: grün
				  --  2: gelb
				  --  3: rot
				  --  4: braun
				  --  5: weiß
				  
MyRound = 0

MyFunctionInGame = 2     -- 1: Goblin
                 		 -- 2: Spielmeister




function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	Conditions =
	{
		QuestState{ QuestId = 1070, State = StateActive},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_Mastergame_AllGoHome"}
	},
	Actions =
	{
		SetEffect {Effect ="DeMaterialize", TargetType = Figure, NpcId = Self},
		SetNpcTimeStamp{Name = "npc_Despawn"}
	}
}

Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_Mastergame_AllGoHome"},
		IsNpcTimeElapsed{Name = "npc_Despawn", Seconds = 3}
	},
}

dofile("script/P208/n11440_Spielgoblins.lua")

EndDefinition()

end
