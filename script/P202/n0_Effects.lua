-----------------------------------
-- P 202 Effekte zum schön machen
---------------------------------

--Fog
OnOneTimeEvent
{
	Conditions = { },
	Actions = 
	{ 
		SetEffect{Effect = "FogForever", X = 55, Y = 217, Length = 0, TargetType = World}, --Brunnen
		SetEffect{Effect = "FogForever", X = 32, Y = 245, Length = 0, TargetType = World}, --Wasser bei Brunnentor
		SetEffect{Effect = "FogForever", X = 157, Y = 220, Length = 0, TargetType = World}, --beim Wachgeist
		SetEffect{Effect = "FogForever", X = 160, Y = 191, Length = 0, TargetType = World}, --Eingang zur Stadt
		SetEffect{Effect = "FogForever", X = 177, Y = 191, Length = 0, TargetType = World}, --genauso
	}
}


--Fackeln und Feuer
OnOneTimeEvent
{
	Conditions = { },
	Actions = 
	{ 
		SetEffect{Effect = "Torch", X = 470, Y = 300, Length = 0, TargetType = World}, --Seelengräber
		SetEffect{Effect = "Torch", X = 470, Y = 304, Length = 0, TargetType = World}, 
		SetEffect{Effect = "Torch", X = 470, Y = 308, Length = 0, TargetType = World}, 
		SetEffect{Effect = "Torch", X = 470, Y = 312, Length = 0, TargetType = World}, 
		
		SetEffect{Effect = "Torch", X = 372, Y = 266, Length = 0, TargetType = World}, --Grabmal Urne
		SetEffect{Effect = "Torch", X = 376, Y = 266, Length = 0, TargetType = World},
		SetEffect{Effect = "Torch", X = 380, Y = 266, Length = 0, TargetType = World},
		SetEffect{Effect = "Torch", X = 377, Y = 263, Length = 0, TargetType = World},
		SetEffect{Effect = "Torch", X = 380, Y = 258, Length = 0, TargetType = World},
		SetEffect{Effect = "Torch", X = 369, Y = 263, Length = 0, TargetType = World},
		SetEffect{Effect = "Torch", X = 369, Y = 259, Length = 0, TargetType = World},
		SetEffect{Effect = "Torch", X = 369, Y = 255, Length = 0, TargetType = World},
		SetEffect{Effect = "Torch", X = 372, Y = 258, Length = 0, TargetType = World},
		SetEffect{Effect = "Torch", X = 377, Y = 255, Length = 0, TargetType = World},
		
		SetEffect{Effect = "Torch", X = 134, Y = 180, Length = 0, TargetType = World}, --Uhr
		SetEffect{Effect = "Torch", X = 132, Y = 174, Length = 0, TargetType = World},
		SetEffect{Effect = "Torch", X = 126, Y = 172, Length = 0, TargetType = World},
		SetEffect{Effect = "Torch", X = 120, Y = 174, Length = 0, TargetType = World},
		SetEffect{Effect = "Torch", X = 118, Y = 180, Length = 0, TargetType = World},
		SetEffect{Effect = "Torch", X = 120, Y = 186, Length = 0, TargetType = World},
		SetEffect{Effect = "Torch", X = 126, Y = 188, Length = 0, TargetType = World},
		SetEffect{Effect = "Torch", X = 132, Y = 186, Length = 0, TargetType = World}
	}
}


