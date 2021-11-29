-- Generelle Definition der X- und Y-Koordinaten der 25 Plattem
PlattenCoordsGeneral =
{
	[1] = { SpalteX = 412, ZeileY = 365},
	[2] = { SpalteX = 414, ZeileY = 363},
	[3] = { SpalteX = 416, ZeileY = 361},
	[4] = { SpalteX = 418, ZeileY = 359},
	[5] = { SpalteX = 420, ZeileY = 357},
} 

DefColorCounter = 
{
	[1] = "g_Mastergame_PlayerColorAtDef1",
	[2] = "g_Mastergame_PlayerColorAtDef2",
	[3] = "g_Mastergame_PlayerColorAtDef3",
	[4] = "g_Mastergame_PlayerColorAtDef4",
	[5] = "g_Mastergame_PlayerColorAtDef5",
}

SpeechOutput =
{
	[1] = { TagName = "oca2zerbiteghostP208_002", TextOutput = "Gespielt wird die Stellung des Drachen."},
	[2] = { TagName = "oca2zerbiteghostP208_003", TextOutput = "Gespielt wird die Stellung des Löwen."},
	[3] = { TagName = "oca2zerbiteghostP208_004", TextOutput = "Gespielt wird die Stellung des Raben."},
	[4] = { TagName = "oca2zerbiteghostP208_005", TextOutput = "Gespielt wird die Stellung des Affen."},
	[5] = { TagName = "oca2zerbiteghostP208_006", TextOutput = "Gespielt wird die Stellung der Ratte."},
	[6] = { TagName = "oca2zerbiteghostP208_007", TextOutput = "Gespielt wird die Stellung des Widders."},
	[7] = { TagName = "oca2zerbiteghostP208_008", TextOutput = "Gespielt wird die Stellung des Kraken."},
	[8] = { TagName = "oca2zerbiteghostP208_009", TextOutput = "Gespielt wird die Stellung der Spinne."},
	[9] = { TagName = "oca2zerbiteghostP208_010", TextOutput = "Gespielt wird die Stellung des Stiers."},
	[10] = { TagName = "oca2zerbiteghostP208_011", TextOutput = "Gespielt wird die Stellung des Greifen."},
	[11] = { TagName = "oca2zerbiteghostP208_012", TextOutput = "Gespielt wird die Stellung des Panthers."},
	[12] = { TagName = "oca2zerbiteghostP208_013", TextOutput = "Gespielt wird die Stellung der Eidechse."},
	[13] = { TagName = "oca2zerbiteghostP208_014", TextOutput = "Gespielt wird die Stellung des Ebers."},
	[14] = { TagName = "oca2zerbiteghostP208_015", TextOutput = "Gespielt wird die Stellung des Falken."},
	[15] = { TagName = "oca2zerbiteghostP208_016", TextOutput = "Gespielt wird die Stellung der Katze."},
}

--- Definition der Abfolge der Platten pro Figuren-Stellung

if SpielStellung == 1 then

StellungOrder =
{
	[1] = {
			[1] = {PlatteReihe = 5 , PlatteSpalte = 5, ColorDef = 1 },
		  	[2] = {PlatteReihe = 5 , PlatteSpalte = 1, ColorDef = 2 },
		    [3] = {PlatteReihe = 1 , PlatteSpalte = 3, ColorDef = 3 },
		    [4] = {PlatteReihe = 2 , PlatteSpalte = 5, ColorDef = 4 },
		    [5] = {PlatteReihe = 3 , PlatteSpalte = 2, ColorDef = 5 },
			},
	[2] = {
			[1] = {PlatteReihe = 2 , PlatteSpalte = 1, ColorDef = 5 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 4, ColorDef = 3 },
		    [3] = {PlatteReihe = 4 , PlatteSpalte = 5, ColorDef = 2 },
		    [4] = {PlatteReihe = 4 , PlatteSpalte = 2, ColorDef = 4 },
		    [5] = {PlatteReihe = 2 , PlatteSpalte = 2, ColorDef = 1 },
			},
	[3] = {
			[1] = {PlatteReihe = 3 , PlatteSpalte = 1, ColorDef = 4 },
		  	[2] = {PlatteReihe = 3 , PlatteSpalte = 4, ColorDef = 2 },
		    [3] = {PlatteReihe = 4 , PlatteSpalte = 1, ColorDef = 3 },
		    [4] = {PlatteReihe = 4 , PlatteSpalte = 4, ColorDef = 1 },
		    [5] = {PlatteReihe = 1 , PlatteSpalte = 5, ColorDef = 5 },
			},
	[4] = {
			[1] = {PlatteReihe = 5 , PlatteSpalte = 2, ColorDef = 3 },
		  	[2] = {PlatteReihe = 4 , PlatteSpalte = 3, ColorDef = 5 },
		    [3] = {PlatteReihe = 1 , PlatteSpalte = 1, ColorDef = 1 },
		    [4] = {PlatteReihe = 1 , PlatteSpalte = 4, ColorDef = 4 },
		    [5] = {PlatteReihe = 2 , PlatteSpalte = 3, ColorDef = 2 },
			},
	[5] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 2, ColorDef = 2 },
		  	[2] = {PlatteReihe = 3 , PlatteSpalte = 3, ColorDef = 1 },
		    [3] = {PlatteReihe = 3 , PlatteSpalte = 5, ColorDef = 3 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 4, ColorDef = 5 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 3, ColorDef = 4 },
			},	
}

end

if SpielStellung == 2 then

StellungOrder =
{
	[1] = {
			[1] = {PlatteReihe = 5 , PlatteSpalte = 5, ColorDef = 1 },
		  	[2] = {PlatteReihe = 5 , PlatteSpalte = 3, ColorDef = 2 },
		    [3] = {PlatteReihe = 3 , PlatteSpalte = 1, ColorDef = 3 },
		    [4] = {PlatteReihe = 1 , PlatteSpalte = 4, ColorDef = 4 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 4, ColorDef = 5 },
			},
	[2] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 1, ColorDef = 1 },
		  	[2] = {PlatteReihe = 1 , PlatteSpalte = 3, ColorDef = 5 },
		    [3] = {PlatteReihe = 1 , PlatteSpalte = 5, ColorDef = 3 },
		    [4] = {PlatteReihe = 3 , PlatteSpalte = 5, ColorDef = 2 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 1, ColorDef = 4 },
			},
	[3] = {
			[1] = {PlatteReihe = 4 , PlatteSpalte = 4, ColorDef = 2 },
		  	[2] = {PlatteReihe = 4 , PlatteSpalte = 3, ColorDef = 3 },
		    [3] = {PlatteReihe = 3 , PlatteSpalte = 2, ColorDef = 5 },
		    [4] = {PlatteReihe = 3 , PlatteSpalte = 3, ColorDef = 4 },
		    [5] = {PlatteReihe = 3 , PlatteSpalte = 4, ColorDef = 1 },
			},
	[4] = {
			[1] = {PlatteReihe = 2 , PlatteSpalte = 1, ColorDef = 2 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 3, ColorDef = 1 },
		    [3] = {PlatteReihe = 2 , PlatteSpalte = 5, ColorDef = 5 },
		    [4] = {PlatteReihe = 4 , PlatteSpalte = 5, ColorDef = 4 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 2, ColorDef = 3 },
			},
	[5] = {
			[1] = {PlatteReihe = 2 , PlatteSpalte = 4, ColorDef = 3 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 2, ColorDef = 4 },
		    [3] = {PlatteReihe = 4 , PlatteSpalte = 2, ColorDef = 1 },
		    [4] = {PlatteReihe = 1 , PlatteSpalte = 2, ColorDef = 2 },
		    [5] = {PlatteReihe = 4 , PlatteSpalte = 1, ColorDef = 5 },
			},	
}

end

if SpielStellung == 3 then

StellungOrder =
{
	[1] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 2, ColorDef = 5 },
		  	[2] = {PlatteReihe = 1 , PlatteSpalte = 4, ColorDef = 3 },
		    [3] = {PlatteReihe = 3 , PlatteSpalte = 5, ColorDef = 1 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 5, ColorDef = 2 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 1, ColorDef = 4 },
			},
	[2] = {
			[1] = {PlatteReihe = 4 , PlatteSpalte = 1, ColorDef = 5 },
		  	[2] = {PlatteReihe = 5 , PlatteSpalte = 4, ColorDef = 1 },
		    [3] = {PlatteReihe = 4 , PlatteSpalte = 5, ColorDef = 3 },
		    [4] = {PlatteReihe = 1 , PlatteSpalte = 5, ColorDef = 4 },
		    [5] = {PlatteReihe = 1 , PlatteSpalte = 3, ColorDef = 2 },
			},
	[3] = {
			[1] = {PlatteReihe = 3 , PlatteSpalte = 3, ColorDef = 4 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 2, ColorDef = 1 },
		    [3] = {PlatteReihe = 4 , PlatteSpalte = 4, ColorDef = 2 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 3, ColorDef = 5 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 2, ColorDef = 2 },
			},
	[4] = {
			[1] = {PlatteReihe = 2 , PlatteSpalte = 1, ColorDef = 2 },
		  	[2] = {PlatteReihe = 3 , PlatteSpalte = 1, ColorDef = 3 },
		    [3] = {PlatteReihe = 2 , PlatteSpalte = 4, ColorDef = 4 },
		    [4] = {PlatteReihe = 3 , PlatteSpalte = 4, ColorDef = 5 },
		    [5] = {PlatteReihe = 4 , PlatteSpalte = 3, ColorDef = 1 },
			},
	[5] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 1, ColorDef = 1 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 3, ColorDef = 3 },
		    [3] = {PlatteReihe = 2 , PlatteSpalte = 5, ColorDef = 5 },
		    [4] = {PlatteReihe = 3 , PlatteSpalte = 2, ColorDef = 2 },
		    [5] = {PlatteReihe = 4 , PlatteSpalte = 2, ColorDef = 4 },
			},	
}

end



if SpielStellung == 4 then

StellungOrder =
{
	[1] = {
			[1] = {PlatteReihe = 2 , PlatteSpalte = 4, ColorDef = 2 },
		  	[2] = {PlatteReihe = 5 , PlatteSpalte = 4, ColorDef = 5 },
		    [3] = {PlatteReihe = 4 , PlatteSpalte = 2, ColorDef = 4 },
		    [4] = {PlatteReihe = 3 , PlatteSpalte = 2, ColorDef = 3 },
		    [5] = {PlatteReihe = 2 , PlatteSpalte = 2, ColorDef = 1 },
			},
	[2] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 1, ColorDef = 1 },
		  	[2] = {PlatteReihe = 1 , PlatteSpalte = 4, ColorDef = 4 },
		    [3] = {PlatteReihe = 2 , PlatteSpalte = 5, ColorDef = 5 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 1, ColorDef = 3 },
		    [5] = {PlatteReihe = 4 , PlatteSpalte = 1, ColorDef = 2 },
			},
	[3] = {
			[1] = {PlatteReihe = 4 , PlatteSpalte = 3, ColorDef = 5 },
		  	[2] = {PlatteReihe = 4 , PlatteSpalte = 4, ColorDef = 3 },
		    [3] = {PlatteReihe = 1 , PlatteSpalte = 3, ColorDef = 2 },
		    [4] = {PlatteReihe = 3 , PlatteSpalte = 3, ColorDef = 4 },
		    [5] = {PlatteReihe = 3 , PlatteSpalte = 4, ColorDef = 1 },
			},
	[4] = {
			[1] = {PlatteReihe = 2 , PlatteSpalte = 3, ColorDef = 3 },
		  	[2] = {PlatteReihe = 4 , PlatteSpalte = 5, ColorDef = 1 },
		    [3] = {PlatteReihe = 3 , PlatteSpalte = 5, ColorDef = 2 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 5, ColorDef = 4 },
		    [5] = {PlatteReihe = 1 , PlatteSpalte = 2, ColorDef = 5 },
			},
	[5] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 5, ColorDef = 3 },
		  	[2] = {PlatteReihe = 5 , PlatteSpalte = 3, ColorDef = 1 },
		    [3] = {PlatteReihe = 5 , PlatteSpalte = 2, ColorDef = 2 },
		    [4] = {PlatteReihe = 3 , PlatteSpalte = 1, ColorDef = 5 },
		    [5] = {PlatteReihe = 2 , PlatteSpalte = 1, ColorDef = 4 },
			},	
}

end


if SpielStellung == 5 then

StellungOrder =
{
	[1] = {
			[1] = {PlatteReihe = 4 , PlatteSpalte = 1, ColorDef = 4 },
		  	[2] = {PlatteReihe = 4 , PlatteSpalte = 2, ColorDef = 5 },
		    [3] = {PlatteReihe = 2 , PlatteSpalte = 3, ColorDef = 2 },
		    [4] = {PlatteReihe = 1 , PlatteSpalte = 3, ColorDef = 3 },
		    [5] = {PlatteReihe = 1 , PlatteSpalte = 1, ColorDef = 1 },
			},
	[2] = {
			[1] = {PlatteReihe = 2 , PlatteSpalte = 2, ColorDef = 1 },
		  	[2] = {PlatteReihe = 1 , PlatteSpalte = 2, ColorDef = 2 },
		    [3] = {PlatteReihe = 2 , PlatteSpalte = 4, ColorDef = 3 },
		    [4] = {PlatteReihe = 1 , PlatteSpalte = 4, ColorDef = 4 },
		    [5] = {PlatteReihe = 2 , PlatteSpalte = 1, ColorDef = 5 },
			},
	[3] = {
			[1] = {PlatteReihe = 5 , PlatteSpalte = 4, ColorDef = 5 },
		  	[2] = {PlatteReihe = 4 , PlatteSpalte = 5, ColorDef = 3 },
		    [3] = {PlatteReihe = 5 , PlatteSpalte = 3, ColorDef = 4 },
		    [4] = {PlatteReihe = 4 , PlatteSpalte = 4, ColorDef = 2 },
		    [5] = {PlatteReihe = 4 , PlatteSpalte = 3, ColorDef = 1 },
			},
	[4] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 5, ColorDef = 5 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 5, ColorDef = 4 },
		    [3] = {PlatteReihe = 5 , PlatteSpalte = 5, ColorDef = 1 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 1, ColorDef = 2 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 2, ColorDef = 3 },
			},
	[5] = {
			[1] = {PlatteReihe = 3 , PlatteSpalte = 1, ColorDef = 3 },
		  	[2] = {PlatteReihe = 3 , PlatteSpalte = 2, ColorDef = 4 },
		    [3] = {PlatteReihe = 3 , PlatteSpalte = 3, ColorDef = 5 },
		    [4] = {PlatteReihe = 3 , PlatteSpalte = 4, ColorDef = 1 },
		    [5] = {PlatteReihe = 3 , PlatteSpalte = 5, ColorDef = 2 },
			},	
}

end

if SpielStellung == 6 then

StellungOrder =
{
	[1] = {
			[1] = {PlatteReihe = 3 , PlatteSpalte = 3, ColorDef = 1 },
		  	[2] = {PlatteReihe = 3 , PlatteSpalte = 5, ColorDef = 2 },
		    [3] = {PlatteReihe = 1 , PlatteSpalte = 3, ColorDef = 3 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 2, ColorDef = 4 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 3, ColorDef = 5 },
			},
	[2] = {
			[1] = {PlatteReihe = 5 , PlatteSpalte = 1, ColorDef = 2 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 1, ColorDef = 5 },
		    [3] = {PlatteReihe = 2 , PlatteSpalte = 2, ColorDef = 1 },
		    [4] = {PlatteReihe = 2 , PlatteSpalte = 5, ColorDef = 3 },
		    [5] = {PlatteReihe = 4 , PlatteSpalte = 5, ColorDef = 4 },
			},
	[3] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 4, ColorDef = 4 },
		  	[2] = {PlatteReihe = 4 , PlatteSpalte = 3, ColorDef = 2 },
		    [3] = {PlatteReihe = 4 , PlatteSpalte = 1, ColorDef = 3 },
		    [4] = {PlatteReihe = 4 , PlatteSpalte = 2, ColorDef = 5 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 5, ColorDef = 1 },
			},
	[4] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 5, ColorDef = 5 },
		  	[2] = {PlatteReihe = 4 , PlatteSpalte = 4, ColorDef = 1 },
		    [3] = {PlatteReihe = 1 , PlatteSpalte = 2, ColorDef = 2 },
		    [4] = {PlatteReihe = 3 , PlatteSpalte = 2, ColorDef = 3 },
		    [5] = {PlatteReihe = 3 , PlatteSpalte = 1, ColorDef = 4 },
			},
	[5] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 1, ColorDef = 1 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 3, ColorDef = 4 },
		    [3] = {PlatteReihe = 2 , PlatteSpalte = 4, ColorDef = 2 },
		    [4] = {PlatteReihe = 3 , PlatteSpalte = 4, ColorDef = 5 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 4, ColorDef = 3 },
			},	
}

end


if SpielStellung == 7 then

StellungOrder =
{
	[1] = {
			[1] = {PlatteReihe = 5 , PlatteSpalte = 3, ColorDef = 3 },
		  	[2] = {PlatteReihe = 4 , PlatteSpalte = 1, ColorDef = 5 },
		    [3] = {PlatteReihe = 1 , PlatteSpalte = 3, ColorDef = 4 },
		    [4] = {PlatteReihe = 2 , PlatteSpalte = 4, ColorDef = 1 },
		    [5] = {PlatteReihe = 3 , PlatteSpalte = 3, ColorDef = 2 },
			},
	[2] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 1, ColorDef = 1 },
		  	[2] = {PlatteReihe = 3 , PlatteSpalte = 1, ColorDef = 3 },
		    [3] = {PlatteReihe = 5 , PlatteSpalte = 1, ColorDef = 4 },
		    [4] = {PlatteReihe = 4 , PlatteSpalte = 5, ColorDef = 2 },
		    [5] = {PlatteReihe = 1 , PlatteSpalte = 5, ColorDef = 5 },
			},
	[3] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 2, ColorDef = 2 },
		  	[2] = {PlatteReihe = 4 , PlatteSpalte = 2, ColorDef = 3 },
		    [3] = {PlatteReihe = 5 , PlatteSpalte = 2, ColorDef = 5 },
		    [4] = {PlatteReihe = 3 , PlatteSpalte = 5, ColorDef = 4 },
		    [5] = {PlatteReihe = 4 , PlatteSpalte = 3, ColorDef = 1 },
			},
	[4] = {
			[1] = {PlatteReihe = 2 , PlatteSpalte = 5, ColorDef = 3 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 3, ColorDef = 5 },
		    [3] = {PlatteReihe = 2 , PlatteSpalte = 2, ColorDef = 4 },
		    [4] = {PlatteReihe = 2 , PlatteSpalte = 1, ColorDef = 2 },
		    [5] = {PlatteReihe = 3 , PlatteSpalte = 2, ColorDef = 1 },
			},
	[5] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 4, ColorDef = 3 },
		  	[2] = {PlatteReihe = 3 , PlatteSpalte = 4, ColorDef = 5 },
		    [3] = {PlatteReihe = 4 , PlatteSpalte = 4, ColorDef = 4 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 4, ColorDef = 2 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 5, ColorDef = 1 },
			},	
}

end



if SpielStellung == 8 then

StellungOrder =
{
	[1] = {
			[1] = {PlatteReihe = 5 , PlatteSpalte = 5, ColorDef = 4 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 5, ColorDef = 3 },
		    [3] = {PlatteReihe = 1 , PlatteSpalte = 1, ColorDef = 1 },
		    [4] = {PlatteReihe = 2 , PlatteSpalte = 1, ColorDef = 5 },
		    [5] = {PlatteReihe = 4 , PlatteSpalte = 1, ColorDef = 2 },
			},
	[2] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 2, ColorDef = 3 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 2, ColorDef = 4 },
		    [3] = {PlatteReihe = 4 , PlatteSpalte = 2, ColorDef = 5 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 2, ColorDef = 2 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 3, ColorDef = 1 },
			},
	[3] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 5, ColorDef = 5 },
		  	[2] = {PlatteReihe = 3 , PlatteSpalte = 4, ColorDef = 3 },
		    [3] = {PlatteReihe = 2 , PlatteSpalte = 4, ColorDef = 1 },
		    [4] = {PlatteReihe = 1 , PlatteSpalte = 3, ColorDef = 4 },
		    [5] = {PlatteReihe = 2 , PlatteSpalte = 3, ColorDef = 2 },
			},
	[4] = {
			[1] = {PlatteReihe = 3 , PlatteSpalte = 1, ColorDef = 4 },
		  	[2] = {PlatteReihe = 5 , PlatteSpalte = 4, ColorDef = 5 },
		    [3] = {PlatteReihe = 1 , PlatteSpalte = 4, ColorDef = 2 },
		    [4] = {PlatteReihe = 4 , PlatteSpalte = 5, ColorDef = 1 },
		    [5] = {PlatteReihe = 4 , PlatteSpalte = 3, ColorDef = 3 },
			},
	[5] = {
			[1] = {PlatteReihe = 5 , PlatteSpalte = 1, ColorDef = 3 },
		  	[2] = {PlatteReihe = 3 , PlatteSpalte = 2, ColorDef = 1 },
		    [3] = {PlatteReihe = 3 , PlatteSpalte = 3, ColorDef = 5 },
		    [4] = {PlatteReihe = 4 , PlatteSpalte = 4, ColorDef = 4 },
		    [5] = {PlatteReihe = 3 , PlatteSpalte = 5, ColorDef = 2 },
			},	
}

end


if SpielStellung == 9 then

StellungOrder =
{
	[1] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 2, ColorDef = 3 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 5, ColorDef = 2 },
		    [3] = {PlatteReihe = 2 , PlatteSpalte = 1, ColorDef = 4 },
		    [4] = {PlatteReihe = 3 , PlatteSpalte = 1, ColorDef = 5 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 4, ColorDef = 1 },
			},
	[2] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 3, ColorDef = 2 },
		  	[2] = {PlatteReihe = 4 , PlatteSpalte = 5, ColorDef = 1 },
		    [3] = {PlatteReihe = 4 , PlatteSpalte = 1, ColorDef = 3 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 2, ColorDef = 4 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 5, ColorDef = 5 },
			},
	[3] = {
			[1] = {PlatteReihe = 3 , PlatteSpalte = 3, ColorDef = 1 },
		  	[2] = {PlatteReihe = 4 , PlatteSpalte = 4, ColorDef = 2 },
		    [3] = {PlatteReihe = 3 , PlatteSpalte = 5, ColorDef = 3 },
		    [4] = {PlatteReihe = 1 , PlatteSpalte = 4, ColorDef = 5 },
		    [5] = {PlatteReihe = 1 , PlatteSpalte = 5, ColorDef = 4 },
			},
	[4] = {
			[1] = {PlatteReihe = 2 , PlatteSpalte = 3, ColorDef = 5 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 4, ColorDef = 3 },
		    [3] = {PlatteReihe = 1 , PlatteSpalte = 1, ColorDef = 1 },
		    [4] = {PlatteReihe = 3 , PlatteSpalte = 2, ColorDef = 2 },
		    [5] = {PlatteReihe = 4 , PlatteSpalte = 3, ColorDef = 4 },
			},
	[5] = {
			[1] = {PlatteReihe = 3 , PlatteSpalte = 4, ColorDef = 4 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 2, ColorDef = 1 },
		    [3] = {PlatteReihe = 5 , PlatteSpalte = 1, ColorDef = 2 },
		    [4] = {PlatteReihe = 4 , PlatteSpalte = 2, ColorDef = 5 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 3, ColorDef = 3 },
			},	
}

end


if SpielStellung == 10 then

StellungOrder =
{
	[1] = {
			[1] = {PlatteReihe = 2 , PlatteSpalte = 5, ColorDef = 1 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 2, ColorDef = 2 },
		    [3] = {PlatteReihe = 5 , PlatteSpalte = 1, ColorDef = 3 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 4, ColorDef = 4 },
		    [5] = {PlatteReihe = 2 , PlatteSpalte = 4, ColorDef = 5 },
			},
	[2] = {
			[1] = {PlatteReihe = 4 , PlatteSpalte = 1, ColorDef = 5 },
		  	[2] = {PlatteReihe = 1 , PlatteSpalte = 1, ColorDef = 1 },
		    [3] = {PlatteReihe = 4 , PlatteSpalte = 5, ColorDef = 2 },
		    [4] = {PlatteReihe = 1 , PlatteSpalte = 2, ColorDef = 4 },
		    [5] = {PlatteReihe = 4 , PlatteSpalte = 2, ColorDef = 3 },
			},
	[3] = {
			[1] = {PlatteReihe = 3 , PlatteSpalte = 3, ColorDef = 1 },
		  	[2] = {PlatteReihe = 3 , PlatteSpalte = 5, ColorDef = 4 },
		    [3] = {PlatteReihe = 3 , PlatteSpalte = 1, ColorDef = 2 },
		    [4] = {PlatteReihe = 1 , PlatteSpalte = 5, ColorDef = 3 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 5, ColorDef = 5 },
			},
	[4] = {
			[1] = {PlatteReihe = 2 , PlatteSpalte = 1, ColorDef = 4 },
		  	[2] = {PlatteReihe = 1 , PlatteSpalte = 3, ColorDef = 5 },
		    [3] = {PlatteReihe = 5 , PlatteSpalte = 2, ColorDef = 1 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 3, ColorDef = 2 },
		    [5] = {PlatteReihe = 3 , PlatteSpalte = 4, ColorDef = 3 },
			},
	[5] = {
			[1] = {PlatteReihe = 4 , PlatteSpalte = 4, ColorDef = 1 },
		  	[2] = {PlatteReihe = 1 , PlatteSpalte = 4, ColorDef = 2 },
		    [3] = {PlatteReihe = 3 , PlatteSpalte = 2, ColorDef = 5 },
		    [4] = {PlatteReihe = 4 , PlatteSpalte = 3, ColorDef = 4 },
		    [5] = {PlatteReihe = 2 , PlatteSpalte = 3, ColorDef = 3 },
			},	
}

end


if SpielStellung == 11 then

StellungOrder =
{
	[1] = {
			[1] = {PlatteReihe = 2 , PlatteSpalte = 3, ColorDef = 5 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 1, ColorDef = 4 },
		    [3] = {PlatteReihe = 3 , PlatteSpalte = 4, ColorDef = 1 },
		    [4] = {PlatteReihe = 4 , PlatteSpalte = 5, ColorDef = 2 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 3, ColorDef = 3 },
			},
	[2] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 3, ColorDef = 2 },
		  	[2] = {PlatteReihe = 1 , PlatteSpalte = 5, ColorDef = 3 },
		    [3] = {PlatteReihe = 3 , PlatteSpalte = 3, ColorDef = 4 },
		    [4] = {PlatteReihe = 3 , PlatteSpalte = 5, ColorDef = 5 },
		    [5] = {PlatteReihe = 4 , PlatteSpalte = 3, ColorDef = 1 },
			},
	[3] = {
			[1] = {PlatteReihe = 2 , PlatteSpalte = 2, ColorDef = 3 },
		  	[2] = {PlatteReihe = 1 , PlatteSpalte = 2, ColorDef = 5 },
		    [3] = {PlatteReihe = 5 , PlatteSpalte = 1, ColorDef = 2 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 5, ColorDef = 4 },
		    [5] = {PlatteReihe = 2 , PlatteSpalte = 5, ColorDef = 1 },
			},
	[4] = {
			[1] = {PlatteReihe = 2 , PlatteSpalte = 4, ColorDef = 2 },
		  	[2] = {PlatteReihe = 4 , PlatteSpalte = 4, ColorDef = 3 },
		    [3] = {PlatteReihe = 4 , PlatteSpalte = 2, ColorDef = 4 },
		    [4] = {PlatteReihe = 4 , PlatteSpalte = 1, ColorDef = 5 },
		    [5] = {PlatteReihe = 1 , PlatteSpalte = 1, ColorDef = 1 },
			},
	[5] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 4, ColorDef = 4 },
		  	[2] = {PlatteReihe = 3 , PlatteSpalte = 1, ColorDef = 3 },
		    [3] = {PlatteReihe = 5 , PlatteSpalte = 2, ColorDef = 1 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 4, ColorDef = 5 },
		    [5] = {PlatteReihe = 3 , PlatteSpalte = 2, ColorDef = 2 },
			},	
}

end


if SpielStellung == 12 then

StellungOrder =
{
	[1] = {
			[1] = {PlatteReihe = 4 , PlatteSpalte = 3, ColorDef = 2 },
		  	[2] = {PlatteReihe = 3 , PlatteSpalte = 4, ColorDef = 3 },
		    [3] = {PlatteReihe = 3 , PlatteSpalte = 2, ColorDef = 4 },
		    [4] = {PlatteReihe = 2 , PlatteSpalte = 4, ColorDef = 5 },
		    [5] = {PlatteReihe = 2 , PlatteSpalte = 5, ColorDef = 1 },
			},
	[2] = {
			[1] = {PlatteReihe = 3 , PlatteSpalte = 3, ColorDef = 1 },
		  	[2] = {PlatteReihe = 4 , PlatteSpalte = 5, ColorDef = 4 },
		    [3] = {PlatteReihe = 3 , PlatteSpalte = 5, ColorDef = 5 },
		    [4] = {PlatteReihe = 2 , PlatteSpalte = 2, ColorDef = 2 },
		    [5] = {PlatteReihe = 1 , PlatteSpalte = 3, ColorDef = 3 },
			},
	[3] = {
			[1] = {PlatteReihe = 5 , PlatteSpalte = 2, ColorDef = 1 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 1, ColorDef = 3 },
		    [3] = {PlatteReihe = 5 , PlatteSpalte = 3, ColorDef = 5 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 4, ColorDef = 2 },
		    [5] = {PlatteReihe = 2 , PlatteSpalte = 3, ColorDef = 4 },
			},
	[4] = {
			[1] = {PlatteReihe = 5 , PlatteSpalte = 5, ColorDef = 3 },
		  	[2] = {PlatteReihe = 3 , PlatteSpalte = 1, ColorDef = 2 },
		    [3] = {PlatteReihe = 1 , PlatteSpalte = 4, ColorDef = 4 },
		    [4] = {PlatteReihe = 1 , PlatteSpalte = 1, ColorDef = 1 },
		    [5] = {PlatteReihe = 1 , PlatteSpalte = 2, ColorDef = 5 },
			},
	[5] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 5, ColorDef = 2 },
		  	[2] = {PlatteReihe = 4 , PlatteSpalte = 1, ColorDef = 5 },
		    [3] = {PlatteReihe = 4 , PlatteSpalte = 2, ColorDef = 3 },
		    [4] = {PlatteReihe = 4 , PlatteSpalte = 4, ColorDef = 1 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 1, ColorDef = 4 },
			},	
}

end



if SpielStellung == 13 then

StellungOrder =
{
	[1] = {
			[1] = {PlatteReihe = 3 , PlatteSpalte = 5, ColorDef = 5 },
		  	[2] = {PlatteReihe = 5 , PlatteSpalte = 4, ColorDef = 3 },
		    [3] = {PlatteReihe = 5 , PlatteSpalte = 2, ColorDef = 4 },
		    [4] = {PlatteReihe = 1 , PlatteSpalte = 1, ColorDef = 1 },
		    [5] = {PlatteReihe = 1 , PlatteSpalte = 5, ColorDef = 2 },
			},
	[2] = {
			[1] = {PlatteReihe = 5 , PlatteSpalte = 5, ColorDef = 1 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 1, ColorDef = 2 },
		    [3] = {PlatteReihe = 1 , PlatteSpalte = 2, ColorDef = 3 },
		    [4] = {PlatteReihe = 1 , PlatteSpalte = 4, ColorDef = 5 },
		    [5] = {PlatteReihe = 2 , PlatteSpalte = 5, ColorDef = 4 },
			},
	[3] = {
			[1] = {PlatteReihe = 4 , PlatteSpalte = 3, ColorDef = 5 },
		  	[2] = {PlatteReihe = 3 , PlatteSpalte = 2, ColorDef = 2 },
		    [3] = {PlatteReihe = 3 , PlatteSpalte = 4, ColorDef = 4 },
		    [4] = {PlatteReihe = 3 , PlatteSpalte = 1, ColorDef = 3 },
		    [5] = {PlatteReihe = 2 , PlatteSpalte = 4, ColorDef = 1 },
			},
	[4] = {
			[1] = {PlatteReihe = 4 , PlatteSpalte = 1, ColorDef = 4 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 2, ColorDef = 5 },
		    [3] = {PlatteReihe = 3 , PlatteSpalte = 3, ColorDef = 1 },
		    [4] = {PlatteReihe = 4 , PlatteSpalte = 5, ColorDef = 3 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 3, ColorDef = 2 },
			},
	[5] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 3, ColorDef = 4 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 3, ColorDef = 3 },
		    [3] = {PlatteReihe = 4 , PlatteSpalte = 4, ColorDef = 2 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 1, ColorDef = 5 },
		    [5] = {PlatteReihe = 4 , PlatteSpalte = 2, ColorDef = 1 },
			},	
}

end



if SpielStellung == 14 then

StellungOrder =
{
	[1] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 1, ColorDef = 1 },
		  	[2] = {PlatteReihe = 1 , PlatteSpalte = 4, ColorDef = 4 },
		    [3] = {PlatteReihe = 3 , PlatteSpalte = 5, ColorDef = 3 },
		    [4] = {PlatteReihe = 4 , PlatteSpalte = 1, ColorDef = 5 },
		    [5] = {PlatteReihe = 3 , PlatteSpalte = 1, ColorDef = 2 },
			},
	[2] = {
			[1] = {PlatteReihe = 3 , PlatteSpalte = 2, ColorDef = 5 },
		  	[2] = {PlatteReihe = 5 , PlatteSpalte = 1, ColorDef = 4 },
		    [3] = {PlatteReihe = 5 , PlatteSpalte = 2, ColorDef = 1 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 4, ColorDef = 3 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 5, ColorDef = 2 },
			},
	[3] = {
			[1] = {PlatteReihe = 2 , PlatteSpalte = 2, ColorDef = 4 },
		  	[2] = {PlatteReihe = 1 , PlatteSpalte = 3, ColorDef = 3 },
		    [3] = {PlatteReihe = 2 , PlatteSpalte = 4, ColorDef = 5 },
		    [4] = {PlatteReihe = 4 , PlatteSpalte = 4, ColorDef = 2 },
		    [5] = {PlatteReihe = 3 , PlatteSpalte = 4, ColorDef = 1 },
			},
	[4] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 2, ColorDef = 2 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 5, ColorDef = 1 },
		    [3] = {PlatteReihe = 4 , PlatteSpalte = 2, ColorDef = 3 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 3, ColorDef = 5 },
		    [5] = {PlatteReihe = 4 , PlatteSpalte = 5, ColorDef = 4 },
			},
	[5] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 5, ColorDef = 5 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 1, ColorDef = 3 },
		    [3] = {PlatteReihe = 2 , PlatteSpalte = 3, ColorDef = 2 },
		    [4] = {PlatteReihe = 3 , PlatteSpalte = 3, ColorDef = 4 },
		    [5] = {PlatteReihe = 4 , PlatteSpalte = 3, ColorDef = 1 },
			},	
}

end


if SpielStellung == 15 then

StellungOrder =
{
	[1] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 1, ColorDef = 1 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 1, ColorDef = 4 },
		    [3] = {PlatteReihe = 3 , PlatteSpalte = 2, ColorDef = 5 },
		    [4] = {PlatteReihe = 4 , PlatteSpalte = 5, ColorDef = 3 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 5, ColorDef = 2 },
			},
	[2] = {
			[1] = {PlatteReihe = 3 , PlatteSpalte = 1, ColorDef = 2 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 2, ColorDef = 3 },
		    [3] = {PlatteReihe = 5 , PlatteSpalte = 3, ColorDef = 4 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 4, ColorDef = 5 },
		    [5] = {PlatteReihe = 2 , PlatteSpalte = 5, ColorDef = 1 },
			},
	[3] = {
			[1] = {PlatteReihe = 4 , PlatteSpalte = 4, ColorDef = 1 },
		  	[2] = {PlatteReihe = 1 , PlatteSpalte = 2, ColorDef = 2 },
		    [3] = {PlatteReihe = 1 , PlatteSpalte = 3, ColorDef = 3 },
		    [4] = {PlatteReihe = 1 , PlatteSpalte = 5, ColorDef = 5 },
		    [5] = {PlatteReihe = 3 , PlatteSpalte = 5, ColorDef = 4 },
			},
	[4] = {
			[1] = {PlatteReihe = 2 , PlatteSpalte = 4, ColorDef = 2 },
		  	[2] = {PlatteReihe = 3 , PlatteSpalte = 3, ColorDef = 1 },
		    [3] = {PlatteReihe = 4 , PlatteSpalte = 2, ColorDef = 4 },
		    [4] = {PlatteReihe = 5 , PlatteSpalte = 1, ColorDef = 3 },
		    [5] = {PlatteReihe = 4 , PlatteSpalte = 1, ColorDef = 5 },
			},
	[5] = {
			[1] = {PlatteReihe = 1 , PlatteSpalte = 4, ColorDef = 4 },
		  	[2] = {PlatteReihe = 2 , PlatteSpalte = 3, ColorDef = 5 },
		    [3] = {PlatteReihe = 3 , PlatteSpalte = 4, ColorDef = 3 },
		    [4] = {PlatteReihe = 4 , PlatteSpalte = 3, ColorDef = 2 },
		    [5] = {PlatteReihe = 5 , PlatteSpalte = 2, ColorDef = 1 },
			},	
}

end

--- Aktuelle Anordnung 
	
Runde =
{
	[1] = 	{ [1] = { X = PlattenCoordsGeneral[StellungOrder[1][1].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[1][1].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[1][1].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[1][1].PlatteSpalte].Spalte
					  },	  
			  [2] = { X = PlattenCoordsGeneral[StellungOrder[1][2].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[1][2].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[1][2].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[1][2].PlatteSpalte].Spalte
					  },
			  [3] = { X = PlattenCoordsGeneral[StellungOrder[1][3].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[1][3].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[1][3].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[1][3].PlatteSpalte].Spalte
					  },
			  [4] = { X = PlattenCoordsGeneral[StellungOrder[1][4].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[1][4].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[1][4].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[1][4].PlatteSpalte].Spalte
					  },
			  [5] = { X = PlattenCoordsGeneral[StellungOrder[1][5].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[1][5].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[1][5].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[1][5].PlatteSpalte].Spalte
					  },
			},
			
	[2] = 	{ [1] = { X = PlattenCoordsGeneral[StellungOrder[2][1].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[2][1].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[2][1].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[2][1].PlatteSpalte].Spalte
					  },	  
			  [2] = { X = PlattenCoordsGeneral[StellungOrder[2][2].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[2][2].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[2][2].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[2][2].PlatteSpalte].Spalte
					  },
			  [3] = { X = PlattenCoordsGeneral[StellungOrder[2][3].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[2][3].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[2][3].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[2][3].PlatteSpalte].Spalte
					  },
			  [4] = { X = PlattenCoordsGeneral[StellungOrder[2][4].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[2][4].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[2][4].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[2][4].PlatteSpalte].Spalte
					  },
			  [5] = { X = PlattenCoordsGeneral[StellungOrder[2][5].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[2][5].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[2][5].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[2][5].PlatteSpalte].Spalte
					  },
			},
			
	[3] =  {  [1] = { X = PlattenCoordsGeneral[StellungOrder[3][1].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[3][1].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[3][1].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[3][1].PlatteSpalte].Spalte
					  },	  
			  [2] = { X = PlattenCoordsGeneral[StellungOrder[3][2].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[3][2].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[3][2].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[3][2].PlatteSpalte].Spalte
					  },
			  [3] = { X = PlattenCoordsGeneral[StellungOrder[3][3].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[3][3].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[3][3].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[3][3].PlatteSpalte].Spalte
					  },
			  [4] = { X = PlattenCoordsGeneral[StellungOrder[3][4].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[3][4].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[3][4].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[3][4].PlatteSpalte].Spalte
					  },
			  [5] = { X = PlattenCoordsGeneral[StellungOrder[3][5].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[3][5].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[3][5].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[3][5].PlatteSpalte].Spalte
					  },
			},
			
	[4] = 	{ [1] = { X = PlattenCoordsGeneral[StellungOrder[4][1].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[4][1].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[4][1].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[4][1].PlatteSpalte].Spalte
					  },	  
			  [2] = { X = PlattenCoordsGeneral[StellungOrder[4][2].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[4][2].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[4][2].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[4][2].PlatteSpalte].Spalte
					  },
			  [3] = { X = PlattenCoordsGeneral[StellungOrder[4][3].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[4][3].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[4][3].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[4][3].PlatteSpalte].Spalte
					  },
			  [4] = { X = PlattenCoordsGeneral[StellungOrder[4][4].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[4][4].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[4][4].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[4][4].PlatteSpalte].Spalte
					  },
			  [5] = { X = PlattenCoordsGeneral[StellungOrder[4][5].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[4][5].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[4][5].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[4][5].PlatteSpalte].Spalte
					  },
			},
	[5] = 	{ [1] = { X = PlattenCoordsGeneral[StellungOrder[5][1].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[5][1].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[5][1].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[5][1].PlatteSpalte].Spalte
					  },	  
			  [2] = { X = PlattenCoordsGeneral[StellungOrder[5][2].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[5][2].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[5][2].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[5][2].PlatteSpalte].Spalte
					  },
			  [3] = { X = PlattenCoordsGeneral[StellungOrder[5][3].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[5][3].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[5][3].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[5][3].PlatteSpalte].Spalte
					  },
			  [4] = { X = PlattenCoordsGeneral[StellungOrder[5][4].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[5][4].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[5][4].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[5][4].PlatteSpalte].Spalte
					  },
			  [5] = { X = PlattenCoordsGeneral[StellungOrder[5][5].PlatteSpalte].SpalteX ,
	  				  Y = PlattenCoordsGeneral[StellungOrder[5][5].PlatteReihe].ZeileY ,
					  ZeilenCounter = MyFarbe[StellungOrder[5][5].PlatteReihe].Zeile ,
					  SpaltenCounter = MyFarbe[StellungOrder[5][5].PlatteSpalte].Spalte
					  },
			},
}
			  


---IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
---III																					   III
---III	                         Wird nur von Goblins ausgeführt                           III
---III                                                                                     III
if (MyFunctionInGame == 1) then
---III                                      Beginn                                         III
---III                                                                                     III
---IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
                                    


SpawnOnlyWhen
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = (MyRound), Operator = IsEqual}
	},
}


OnOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
		IsNpcFlagFalse{Name ="npc_Mastergame_OnBoard"},
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
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
		IsNpcFlagFalse{Name ="npc_Mastergame_OnBoard"},
		IsNpcTimeElapsed{Name = "npc_Despawn", Seconds = 2}
	},
	Actions =
	{
		SetNpcFlagTrue{Name ="npc_Mastergame_OnBoard"},
	}
}


---I++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++I
---I                                                                          I
---I Conditions & Actions, die nur von Goblins der 1. Runde ausgeführt werden I
---I                                                                          I
---I++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++I


if ( MyRound == 1 ) then

Respawn
{
	WaitTime = 1,
	X = (Runde[1][1].X),
	Y = (Runde[1][1].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 1, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 1, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[1][1].X), Y = (Runde[1][1].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[1][1].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[1][1].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		IncreaseGlobalCounter{ Name = DefColorCounter[StellungOrder[1][1].ColorDef], Step = MyColorCode},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}


Respawn
{
	WaitTime = 1,
	X = (Runde[1][2].X),
	Y = (Runde[1][2].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 1, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 2, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[1][2].X), Y = (Runde[1][2].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[1][2].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[1][2].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		IncreaseGlobalCounter{ Name = DefColorCounter[StellungOrder[1][2].ColorDef], Step = MyColorCode},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}

Respawn
{
	WaitTime = 1,
	X = (Runde[1][3].X),
	Y = (Runde[1][3].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 1, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 3, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[1][3].X), Y = (Runde[1][3].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[1][3].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[1][3].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		IncreaseGlobalCounter{ Name = DefColorCounter[StellungOrder[1][3].ColorDef], Step = MyColorCode},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}

Respawn
{
	WaitTime = 1,
	X = (Runde[1][4].X),
	Y = (Runde[1][4].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 1, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 4, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[1][4].X), Y = (Runde[1][4].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[1][4].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[1][4].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		IncreaseGlobalCounter{ Name = DefColorCounter[StellungOrder[1][4].ColorDef], Step = MyColorCode},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}

Respawn
{
	WaitTime = 1,
	X = (Runde[1][5].X),
	Y = (Runde[1][5].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 1, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 5, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[1][5].X), Y = (Runde[1][5].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[1][5].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[1][5].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		IncreaseGlobalCounter{ Name = DefColorCounter[StellungOrder[1][5].ColorDef], Step = MyColorCode},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}

end



---I++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++I
---I                                                                          I
---I Conditions & Actions, die nur von Goblins der 2. Runde ausgeführt werden I
---I                                                                          I
---I++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++I

if ( MyRound == 2 ) then


OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			UND9{
				IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 1, Operator = IsEqual},
				IsGlobalCounter{Name = DefColorCounter[StellungOrder[2][1].ColorDef], Value = MyColorCode, Operator = IsEqual}
				},
			UND9{
				IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 2, Operator = IsEqual},
				IsGlobalCounter{Name = DefColorCounter[StellungOrder[2][2].ColorDef], Value = MyColorCode, Operator = IsEqual}
				},
			UND9{
				IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 3, Operator = IsEqual},
				IsGlobalCounter{Name = DefColorCounter[StellungOrder[2][3].ColorDef], Value = MyColorCode, Operator = IsEqual}
				},
			UND9{
				IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 4, Operator = IsEqual},
				IsGlobalCounter{Name = DefColorCounter[StellungOrder[2][4].ColorDef], Value = MyColorCode, Operator = IsEqual}
				},
			UND9{
				IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 5, Operator = IsEqual},
				IsGlobalCounter{Name = DefColorCounter[StellungOrder[2][5].ColorDef], Value = MyColorCode, Operator = IsEqual}
				},
		},
	},
	Actions =
	{
		SetNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
}



Respawn
{
	WaitTime = 1,
	X = (Runde[2][1].X),
	Y = (Runde[2][1].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 2, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 1, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[2][1].X), Y = (Runde[2][1].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[2][1].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[2][1].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetGlobalFlagTrue{Name = "npc_Mastergame_WaitForApproval"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}


Respawn
{
	WaitTime = 1,
	X = (Runde[2][2].X),
	Y = (Runde[2][2].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 2, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 2, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[2][2].X), Y = (Runde[2][2].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[2][2].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[2][2].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetGlobalFlagTrue{Name = "npc_Mastergame_WaitForApproval"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}

Respawn
{
	WaitTime = 1,
	X = (Runde[2][3].X),
	Y = (Runde[2][3].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 2, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 3, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[2][3].X), Y = (Runde[2][3].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[2][3].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[2][3].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetGlobalFlagTrue{Name = "npc_Mastergame_WaitForApproval"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}

Respawn
{
	WaitTime = 1,
	X = (Runde[2][4].X),
	Y = (Runde[2][4].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 2, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 4, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[2][4].X), Y = (Runde[2][4].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[2][4].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[2][4].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetGlobalFlagTrue{Name = "npc_Mastergame_WaitForApproval"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}

Respawn
{
	WaitTime = 1,
	X = (Runde[2][5].X),
	Y = (Runde[2][5].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 2, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 5, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[2][5].X), Y = (Runde[2][5].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[2][5].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[2][5].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetGlobalFlagTrue{Name = "npc_Mastergame_WaitForApproval"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}

end


---I++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++I
---I                                                                          I
---I Conditions & Actions, die nur von Goblins der 3. Runde ausgeführt werden I
---I                                                                          I
---I++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++I

if ( MyRound == 3 ) then

Respawn
{
	WaitTime = 1,
	X = (Runde[3][1].X),
	Y = (Runde[3][1].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 3, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 1, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[3][1].X), Y = (Runde[3][1].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[3][1].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[3][1].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}


Respawn
{
	WaitTime = 1,
	X = (Runde[3][2].X),
	Y = (Runde[3][2].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 3, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 2, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[3][2].X), Y = (Runde[3][2].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[3][2].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[3][2].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}

Respawn
{
	WaitTime = 1,
	X = (Runde[3][3].X),
	Y = (Runde[3][3].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 3, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 3, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[3][3].X), Y = (Runde[3][3].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[3][3].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[3][3].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}

Respawn
{
	WaitTime = 1,
	X = (Runde[3][4].X),
	Y = (Runde[3][4].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 3, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 4, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[3][4].X), Y = (Runde[3][4].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[3][4].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[3][4].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}

Respawn
{
	WaitTime = 1,
	X = (Runde[3][5].X),
	Y = (Runde[3][5].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 3, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 5, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[3][5].X), Y = (Runde[3][5].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[3][5].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[3][5].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}


end


---I++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++I
---I                                                                          I
---I Conditions & Actions, die nur von Goblins der 4. Runde ausgeführt werden I
---I                                                                          I
---I++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++I

if ( MyRound == 4 ) then


OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			UND9{
				IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 1, Operator = IsEqual},
				IsGlobalCounter{Name = DefColorCounter[StellungOrder[4][1].ColorDef], Value = MyColorCode, Operator = IsEqual}
				},
			UND9{
				IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 2, Operator = IsEqual},
				IsGlobalCounter{Name = DefColorCounter[StellungOrder[4][2].ColorDef], Value = MyColorCode, Operator = IsEqual}
				},
			UND9{
				IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 3, Operator = IsEqual},
				IsGlobalCounter{Name = DefColorCounter[StellungOrder[4][3].ColorDef], Value = MyColorCode, Operator = IsEqual}
				},
			UND9{
				IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 4, Operator = IsEqual},
				IsGlobalCounter{Name = DefColorCounter[StellungOrder[4][4].ColorDef], Value = MyColorCode, Operator = IsEqual}
				},
			UND9{
				IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 5, Operator = IsEqual},
				IsGlobalCounter{Name = DefColorCounter[StellungOrder[4][5].ColorDef], Value = MyColorCode, Operator = IsEqual}
				},
		},
	},
	Actions =
	{
		SetNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
}


Respawn
{
	WaitTime = 1,
	X = (Runde[4][1].X),
	Y = (Runde[4][1].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 4, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 1, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[4][1].X), Y = (Runde[4][1].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[4][1].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[4][1].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetGlobalFlagTrue{Name = "npc_Mastergame_WaitForApproval"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}


Respawn
{
	WaitTime = 1,
	X = (Runde[4][2].X),
	Y = (Runde[4][2].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 4, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 2, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[4][2].X), Y = (Runde[4][2].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[4][2].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[4][2].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetGlobalFlagTrue{Name = "npc_Mastergame_WaitForApproval"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}

Respawn
{
	WaitTime = 1,
	X = (Runde[4][3].X),
	Y = (Runde[4][3].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 4, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 3, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[4][3].X), Y = (Runde[4][3].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[4][3].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[4][3].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetGlobalFlagTrue{Name = "npc_Mastergame_WaitForApproval"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}

Respawn
{
	WaitTime = 1,
	X = (Runde[4][4].X),
	Y = (Runde[4][4].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 4, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 4, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[4][4].X), Y = (Runde[4][4].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[4][4].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[4][4].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetGlobalFlagTrue{Name = "npc_Mastergame_WaitForApproval"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}

Respawn
{
	WaitTime = 1,
	X = (Runde[4][5].X),
	Y = (Runde[4][5].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 4, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 5, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[4][5].X), Y = (Runde[4][5].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[4][5].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[4][5].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetGlobalFlagTrue{Name = "npc_Mastergame_WaitForApproval"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}

end


---I++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++I
---I                                                                          I
---I Conditions & Actions, die nur von Goblins der 5. Runde ausgeführt werden I
---I                                                                          I
---I++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++I

if ( MyRound == 5 ) then

Respawn
{
	WaitTime = 1,
	X = (Runde[5][1].X),
	Y = (Runde[5][1].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 5, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 1, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[5][1].X), Y = (Runde[5][1].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[5][1].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[5][1].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}


Respawn
{
	WaitTime = 1,
	X = (Runde[5][2].X),
	Y = (Runde[5][2].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 5, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 2, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[5][2].X), Y = (Runde[5][2].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[5][2].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[5][2].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}

Respawn
{
	WaitTime = 1,
	X = (Runde[5][3].X),
	Y = (Runde[5][3].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 5, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 3, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[5][3].X), Y = (Runde[5][3].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[5][3].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[5][3].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}

Respawn
{
	WaitTime = 1,
	X = (Runde[5][4].X),
	Y = (Runde[5][4].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 5, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 4, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[5][4].X), Y = (Runde[5][4].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[5][4].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[5][4].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}

Respawn
{
	WaitTime = 1,
	X = (Runde[5][5].X),
	Y = (Runde[5][5].Y),
	Conditions = 
	{
		--IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 5, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 5, Operator = IsEqual},
		IsNpcFlagTrue{Name ="npc_Mastergame_GoNow"},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[5][5].X), Y = (Runde[5][5].Y), Object = 3052},
		IncreaseGlobalCounter { Name = Runde[5][5].ZeilenCounter},
		IncreaseGlobalCounter { Name = Runde[5][5].SpaltenCounter},
		SetGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		SetNpcFlagFalse{Name ="npc_Mastergame_GoNow"},
		RemoveDialog{NpcId = self},
		HoldPosition{NpcId = self}
	}
}

end


---IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
---III																					   III
---III	                         Wird nur von Goblins ausgeführt                           III
---III                                                                                     III
end
---III                                       Ende                                          III
---III                                                                                     III
---IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII




---IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
---III																					   III
---III	                         Wird von Spielmeister ausgeführt                          III
---III                                                                                     III
if (MyFunctionInGame == 2) then
---III                                      Beginn                                         III
---III                                                                                     III
---IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P208_Mastergame_StartMastergame"},
	},
	Actions =
	{
		IncreaseGlobalCounter{Name = "g_Mastergame_Rundenzaehler"},
		Outcry {Tag = SpeechOutput[SpielStellung].TagName, NpcId = 11464, String = SpeechOutput[SpielStellung].TextOutput, Color = ColorWhite},
	}
}

--- Augenplatten von Runde 1 freischalten

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 1, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 0, Operator = IsEqual},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[1][1].X), Y = (Runde[1][1].Y), Object = 3051},
		ChangeObject{ X = (Runde[1][2].X), Y = (Runde[1][2].Y), Object = 3051},
		ChangeObject{ X = (Runde[1][3].X), Y = (Runde[1][3].Y), Object = 3051},
		ChangeObject{ X = (Runde[1][4].X), Y = (Runde[1][4].Y), Object = 3051},
		ChangeObject{ X = (Runde[1][5].X), Y = (Runde[1][5].Y), Object = 3051},
		IncreaseGlobalCounter{Name = "g_Mastergame_Plattenzaehler"},
	}
}


--- Augenplatten von Runde 2 freischalten

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 2, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 0, Operator = IsEqual},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[2][1].X), Y = (Runde[2][1].Y), Object = 3051},
		ChangeObject{ X = (Runde[2][2].X), Y = (Runde[2][2].Y), Object = 3051},
		ChangeObject{ X = (Runde[2][3].X), Y = (Runde[2][3].Y), Object = 3051},
		ChangeObject{ X = (Runde[2][4].X), Y = (Runde[2][4].Y), Object = 3051},
		ChangeObject{ X = (Runde[2][5].X), Y = (Runde[2][5].Y), Object = 3051},
		IncreaseGlobalCounter{Name = "g_Mastergame_Plattenzaehler"},
	}
}

--- Augenplatten von Runde 3 freischalten

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 3, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 0, Operator = IsEqual},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[3][1].X), Y = (Runde[3][1].Y), Object = 3051},
		ChangeObject{ X = (Runde[3][2].X), Y = (Runde[3][2].Y), Object = 3051},
		ChangeObject{ X = (Runde[3][3].X), Y = (Runde[3][3].Y), Object = 3051},
		ChangeObject{ X = (Runde[3][4].X), Y = (Runde[3][4].Y), Object = 3051},
		ChangeObject{ X = (Runde[3][5].X), Y = (Runde[3][5].Y), Object = 3051},
		IncreaseGlobalCounter{Name = "g_Mastergame_Plattenzaehler"},
	}
}

--- Augenplatten von Runde 4 freischalten

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 4, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 0, Operator = IsEqual},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[4][1].X), Y = (Runde[4][1].Y), Object = 3051},
		ChangeObject{ X = (Runde[4][2].X), Y = (Runde[4][2].Y), Object = 3051},
		ChangeObject{ X = (Runde[4][3].X), Y = (Runde[4][3].Y), Object = 3051},
		ChangeObject{ X = (Runde[4][4].X), Y = (Runde[4][4].Y), Object = 3051},
		ChangeObject{ X = (Runde[4][5].X), Y = (Runde[4][5].Y), Object = 3051},
		IncreaseGlobalCounter{Name = "g_Mastergame_Plattenzaehler"},
	}
}

--- Augenplatten von Runde 5 freischalten

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 5, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 0, Operator = IsEqual},
	},
	Actions =
	{
		ChangeObject{ X = (Runde[5][1].X), Y = (Runde[5][1].Y), Object = 3051},
		ChangeObject{ X = (Runde[5][2].X), Y = (Runde[5][2].Y), Object = 3051},
		ChangeObject{ X = (Runde[5][3].X), Y = (Runde[5][3].Y), Object = 3051},
		ChangeObject{ X = (Runde[5][4].X), Y = (Runde[5][4].Y), Object = 3051},
		ChangeObject{ X = (Runde[5][5].X), Y = (Runde[5][5].Y), Object = 3051},
		IncreaseGlobalCounter{Name = "g_Mastergame_Plattenzaehler"},
	}
}

--- Blitz!-Magament

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 1, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 1, Operator = IsEqual},
	},
	Actions =
	{
		SetEffect { X = (Runde[1][1].X), Y = (Runde[1][1].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 1, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 2, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[1][1].X), Y = (Runde[1][1].Y), TargetType = World },
		SetEffect { X = (Runde[1][2].X), Y = (Runde[1][2].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 1, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 3, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[1][2].X), Y = (Runde[1][2].Y), TargetType = World },
		SetEffect { X = (Runde[1][3].X), Y = (Runde[1][3].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 1, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 4, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[1][3].X), Y = (Runde[1][3].Y), TargetType = World },
		SetEffect { X = (Runde[1][4].X), Y = (Runde[1][4].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 1, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 5, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[1][4].X), Y = (Runde[1][4].Y), TargetType = World },
		SetEffect { X = (Runde[1][5].X), Y = (Runde[1][5].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 1, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 6, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Securityzaehler", Value = 5, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[1][5].X), Y = (Runde[1][5].Y), TargetType = World },
		ResetGlobalCounter{Name = "g_Mastergame_Plattenzaehler"},
		IncreaseGlobalCounter{Name = "g_Mastergame_Rundenzaehler"},
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 2, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 1, Operator = IsEqual},
	},
	Actions =
	{
		SetEffect { X = (Runde[2][1].X), Y = (Runde[2][1].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 2, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 2, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[2][1].X), Y = (Runde[2][1].Y), TargetType = World },
		SetEffect { X = (Runde[2][2].X), Y = (Runde[2][2].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 2, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 3, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[2][2].X), Y = (Runde[2][2].Y), TargetType = World },
		SetEffect { X = (Runde[2][3].X), Y = (Runde[2][3].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 2, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 4, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[2][3].X), Y = (Runde[2][3].Y), TargetType = World },
		SetEffect { X = (Runde[2][4].X), Y = (Runde[2][4].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 2, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 5, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[2][4].X), Y = (Runde[2][4].Y), TargetType = World },
		SetEffect { X = (Runde[2][5].X), Y = (Runde[2][5].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 2, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 6, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Securityzaehler", Value = 10, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[2][5].X), Y = (Runde[2][5].Y), TargetType = World },
		ResetGlobalCounter{Name = "g_Mastergame_Plattenzaehler"},
		IncreaseGlobalCounter{Name = "g_Mastergame_Rundenzaehler"},
	},
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 3, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 1, Operator = IsEqual},
	},
	Actions =
	{
		SetEffect { X = (Runde[3][1].X), Y = (Runde[3][1].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 3, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 2, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[3][1].X), Y = (Runde[3][1].Y), TargetType = World },
		SetEffect { X = (Runde[3][2].X), Y = (Runde[3][2].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 3, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 3, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[3][2].X), Y = (Runde[3][2].Y), TargetType = World },
		SetEffect { X = (Runde[3][3].X), Y = (Runde[3][3].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 3, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 4, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[3][3].X), Y = (Runde[3][3].Y), TargetType = World },
		SetEffect { X = (Runde[3][4].X), Y = (Runde[3][4].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 3, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 5, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[3][4].X), Y = (Runde[3][4].Y), TargetType = World },
		SetEffect { X = (Runde[3][5].X), Y = (Runde[3][5].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 3, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 6, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Securityzaehler", Value = 15, Operator = IsEqual},
		IsGlobalFlagFalse{Name ="g_Mastergame_YouScrewedUp"}
	},
	Actions =
	{
		StopEffect {X = (Runde[3][5].X), Y = (Runde[3][5].Y), TargetType = World },
		ResetGlobalCounter{Name = "g_Mastergame_Plattenzaehler"},
		IncreaseGlobalCounter{Name = "g_Mastergame_Rundenzaehler"},
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 4, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 1, Operator = IsEqual},
	},
	Actions =
	{
		SetEffect { X = (Runde[4][1].X), Y = (Runde[4][1].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 4, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 2, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[4][1].X), Y = (Runde[4][1].Y), TargetType = World },
		SetEffect { X = (Runde[4][2].X), Y = (Runde[4][2].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 4, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 3, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[4][2].X), Y = (Runde[4][2].Y), TargetType = World },
		SetEffect { X = (Runde[4][3].X), Y = (Runde[4][3].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 4, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 4, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[4][3].X), Y = (Runde[4][3].Y), TargetType = World },
		SetEffect { X = (Runde[4][4].X), Y = (Runde[4][4].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 4, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 5, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[4][4].X), Y = (Runde[4][4].Y), TargetType = World },
		SetEffect { X = (Runde[4][5].X), Y = (Runde[4][5].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 4, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 6, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Securityzaehler", Value = 20, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[4][5].X), Y = (Runde[4][5].Y), TargetType = World },
		ResetGlobalCounter{Name = "g_Mastergame_Plattenzaehler"},
		IncreaseGlobalCounter{Name = "g_Mastergame_Rundenzaehler"},
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 5, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 1, Operator = IsEqual},
	},
	Actions =
	{
		SetEffect { X = (Runde[5][1].X), Y = (Runde[5][1].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 5, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 2, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[5][1].X), Y = (Runde[5][1].Y), TargetType = World },
		SetEffect { X = (Runde[5][2].X), Y = (Runde[5][2].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 5, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 3, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[5][2].X), Y = (Runde[5][2].Y), TargetType = World },
		SetEffect { X = (Runde[5][3].X), Y = (Runde[5][3].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 5, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 4, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[5][3].X), Y = (Runde[5][3].Y), TargetType = World },
		SetEffect { X = (Runde[5][4].X), Y = (Runde[5][4].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 5, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 5, Operator = IsEqual},
	},
	Actions =
	{
		StopEffect {X = (Runde[5][4].X), Y = (Runde[5][4].Y), TargetType = World },
		SetEffect { X = (Runde[5][5].X), Y = (Runde[5][5].Y), Effect = "Lightning", Length = 0, TargetType = World },
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "g_Mastergame_Rundenzaehler", Value = 5, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Plattenzaehler", Value = 6, Operator = IsEqual},
		IsGlobalCounter{Name = "g_Mastergame_Securityzaehler", Value = 25, Operator = IsEqual},
		IsGlobalFlagFalse{Name ="g_Mastergame_YouScrewedUp"}
	},
	Actions =
	{
		StopEffect {X = (Runde[5][5].X), Y = (Runde[5][5].Y), TargetType = World },
		ResetGlobalCounter{Name = "g_Mastergame_Plattenzaehler"},
		IncreaseGlobalCounter{Name = "g_Mastergame_Rundenzaehler"},
		SetGlobalFlagTrue{Name = "g_Mastergame_PlayerDidFine"},
	},
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name ="g_Mastergame_YouScrewedUp"}
	},
	Actions =
	{
		RemoveDialog{NpcId = 11445},
		RemoveDialog{NpcId = 11446},
		RemoveDialog{NpcId = 11447},
		RemoveDialog{NpcId = 11448},
		RemoveDialog{NpcId = 11449},
		RemoveDialog{NpcId = 11450},
		RemoveDialog{NpcId = 11451},
		RemoveDialog{NpcId = 11452},
		RemoveDialog{NpcId = 11453},
		RemoveDialog{NpcId = 11454},
		StopEffect {X = (Runde[3][1].X), Y = (Runde[3][1].Y), TargetType = World },
		StopEffect {X = (Runde[3][2].X), Y = (Runde[3][2].Y), TargetType = World },
		StopEffect {X = (Runde[3][3].X), Y = (Runde[3][3].Y), TargetType = World },
		StopEffect {X = (Runde[3][4].X), Y = (Runde[3][4].Y), TargetType = World },
		StopEffect {X = (Runde[3][5].X), Y = (Runde[3][5].Y), TargetType = World },
		StopEffect {X = (Runde[4][1].X), Y = (Runde[4][1].Y), TargetType = World },
		StopEffect {X = (Runde[4][2].X), Y = (Runde[4][2].Y), TargetType = World },
		StopEffect {X = (Runde[4][3].X), Y = (Runde[4][3].Y), TargetType = World },
		StopEffect {X = (Runde[4][4].X), Y = (Runde[4][4].Y), TargetType = World },
		StopEffect {X = (Runde[4][5].X), Y = (Runde[4][5].Y), TargetType = World },
		StopEffect {X = (Runde[5][1].X), Y = (Runde[5][1].Y), TargetType = World },
		StopEffect {X = (Runde[5][2].X), Y = (Runde[5][2].Y), TargetType = World },
		StopEffect {X = (Runde[5][3].X), Y = (Runde[5][3].Y), TargetType = World },
		StopEffect {X = (Runde[5][4].X), Y = (Runde[5][4].Y), TargetType = World },
		StopEffect {X = (Runde[5][5].X), Y = (Runde[5][5].Y), TargetType = World },
	},
}

OnEvent -- Qualitätskontrolle nach jedem Spielerzug
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "npc_Mastergame_WaitForApproval"},
		IsGlobalFlagTrue{Name = "g_Mastergame_TellCheckerImOnBoard"},
		IsGlobalFlagFalse{Name ="g_Mastergame_YouScrewedUp"}
	},
	Actions =
	{
		SetGlobalFlagFalse{Name = "npc_Mastergame_WaitForApproval"},
		SetGlobalFlagFalse{Name = "g_Mastergame_TellCheckerImOnBoard"},
		IncreaseGlobalCounter { Name = "g_Mastergame_Plattenzaehler"},
		IncreaseGlobalCounter { Name = "g_Mastergame_Securityzaehler"},
	},
}


---IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
---III																					   III
----III	                         Wird von Spielmeister ausgeführt                          III
---III                                                                                     III
end
---III                                       Ende                                          III
---III                                                                                     III
---IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII