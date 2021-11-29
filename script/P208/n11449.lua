MyFarbe =
{
	[1] = { Zeile = "g_Mastergame_Zeile1Weiss", Spalte = "g_Mastergame_Spalte1Weiss"},
	[2] = { Zeile = "g_Mastergame_Zeile2Weiss", Spalte = "g_Mastergame_Spalte2Weiss"},
	[3] = { Zeile = "g_Mastergame_Zeile3Weiss", Spalte = "g_Mastergame_Spalte3Weiss"},
	[4] = { Zeile = "g_Mastergame_Zeile4Weiss", Spalte = "g_Mastergame_Spalte4Weiss"},
	[5] = { Zeile = "g_Mastergame_Zeile5Weiss", Spalte = "g_Mastergame_Spalte5Weiss"},
}

MyColorCode = 5   --  1: grün
				  --  2: gelb
				  --  3: rot
				  --  4: braun
				  --  5: weiß
				  
MyRound = 3

MyFunctionInGame = 1     -- 1: Goblin
                 		 -- 2: Spielmeister

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/P208/n11440_Spielgoblins.lua")
dofile("script/P208/n11440_Dialogue.lua")


EndDefinition()
end
