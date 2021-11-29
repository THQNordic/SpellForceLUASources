MyFarbe =
{
	[1] = { Zeile = "g_Mastergame_Zeile1Gelb", Spalte = "g_Mastergame_Spalte1Gelb"},
	[2] = { Zeile = "g_Mastergame_Zeile2Gelb", Spalte = "g_Mastergame_Spalte2Gelb"},
	[3] = { Zeile = "g_Mastergame_Zeile3Gelb", Spalte = "g_Mastergame_Spalte3Gelb"},
	[4] = { Zeile = "g_Mastergame_Zeile4Gelb", Spalte = "g_Mastergame_Spalte4Gelb"},
	[5] = { Zeile = "g_Mastergame_Zeile5Gelb", Spalte = "g_Mastergame_Spalte5Gelb"},
}

MyColorCode = 2   --  1: grün
				  --  2: gelb
				  --  3: rot
				  --  4: braun
				  --  5: weiß
				  
MyRound = 1

MyFunctionInGame = 1     -- 1: Goblin
                 		 -- 2: Spielmeister

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/P208/n11440_Spielgoblins.lua")
dofile("script/P208/n11440_Dialogue.lua")


EndDefinition()
end
