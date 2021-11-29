MyFarbe =
{
	[1] = { Zeile = "g_Mastergame_Zeile1Braun", Spalte = "g_Mastergame_Spalte1Braun"},
	[2] = { Zeile = "g_Mastergame_Zeile2Braun", Spalte = "g_Mastergame_Spalte2Braun"},
	[3] = { Zeile = "g_Mastergame_Zeile3Braun", Spalte = "g_Mastergame_Spalte3Braun"},
	[4] = { Zeile = "g_Mastergame_Zeile4Braun", Spalte = "g_Mastergame_Spalte4Braun"},
	[5] = { Zeile = "g_Mastergame_Zeile5Braun", Spalte = "g_Mastergame_Spalte5Braun"},
}

MyColorCode = 4   --  1: grün
				  --  2: gelb
				  --  3: rot
				  --  4: braun
				  --  5: weiß
				  
MyRound = 5

MyFunctionInGame = 1     -- 1: Goblin
                 		 -- 2: Spielmeister

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/P208/n11440_Spielgoblins.lua")
dofile("script/P208/n11440_Dialogue.lua")


EndDefinition()
end
