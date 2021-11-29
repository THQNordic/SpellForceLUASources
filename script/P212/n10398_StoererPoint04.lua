CoordsAufbaustoeren =
{
	[1] = { X = 245, Y = 464 },
	[2] = { X = 191, Y = 453 },
	[3] = { X = 283, Y = 428 },
	[4] = { X = 225, Y = 470 },
	[5] = { X = 283, Y = 437 },
	[6] = { X = 217, Y = 450 },
	
}

CoordsSchalterBewachen =
{
	[1] = { X = 474, Y = 218 },
	[2] = { X = 475, Y = 213 },
	[3] = { X = 475, Y = 204 },
	[4] = { X = 472, Y = 199 },
	[5] = { X = 476, Y = 198 },
	[6] = { X = 470, Y = 194 },
	
}

Waiting =
{
	[1] = { SpawnTime = 5, GuardTime = 600 },
	[2] = { SpawnTime = 15, GuardTime = 1200 },
	[3] = { SpawnTime = 55, GuardTime = 1450 },
	[4] = { SpawnTime = 105, GuardTime = 1850 },
	[5] = { SpawnTime = 155, GuardTime = 2800 },
	[6] = { SpawnTime = 205, GuardTime = 3400 },
}

SpawnOnlyWhen
{
	X = 470 , Y = 210 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint04On"},
		IsGlobalTimeElapsed{ Name = "P212Spawnpoint04Running", Seconds = (Waiting[MyNumber].SpawnTime) },
	},
}

Respawn
{
	WaitTime = (random(100)+120) ,
	X = 470 , Y = 210 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint04On"},
	},
}


-- Figur bewacht Monumentschalter
OnIdleGoHome
{
	X = (CoordsSchalterBewachen[MyNumber].X) ,
	Y = (CoordsSchalterBewachen[MyNumber].Y) ,
	Range = 5, WalkMode = Run,
	Conditions = 
	{
		ODER9
		{
			UND9
			{
			Negated(IsMonumentInUse {X = 313, Y = 423, Range = 5}),
			Negated(IsMonumentInUse {X = 207, Y = 473, Range = 5}),
			},
		Negated(IsGlobalTimeElapsed{Name = "g_P212_Spawnpoint04_Timer", Seconds = (Waiting[MyNumber].GuardTime)}),
		}, 
	},
}


-- Figur läuft in Barrikade
OnIdleGoHome
{
	X = (CoordsAufbaustoeren[MyNumber].X) ,
	Y = (CoordsAufbaustoeren[MyNumber].Y) , 
	Range = 5, WalkMode = Run,
	Conditions = 
	{
		ODER9
		{
		IsMonumentInUse {X = 313, Y = 423, Range = 5},
		IsMonumentInUse {X = 207, Y = 473, Range = 5},
		}, 
		IsGlobalTimeElapsed{Name = "g_P212_Spawnpoint04_Timer", Seconds = (Waiting[MyNumber].GuardTime)}
	},
}
