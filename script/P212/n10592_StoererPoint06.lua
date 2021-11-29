CoordsAufbaustoeren =
{
	[1] = { X = 292, Y = 428 },
	[2] = { X = 284, Y = 424 },
	[3] = { X = 234, Y = 474 },
	[4] = { X = 191, Y = 424 },
	[5] = { X = 219, Y = 436 },
	[6] = { X = 276, Y = 458 },
	[7] = { X = 305, Y = 431 },
	[8] = { X = 220, Y = 429 },
	[9] = { X = 209, Y = 468 },
	[10] = { X = 228, Y = 470 },
	[11] = { X = 203, Y = 444 },
	
}

CoordsSchalterBewachen =
{
	[1] = { X = 448, Y = 96 },
	[2] = { X = 451, Y = 93 },
	[3] = { X = 449, Y = 87 },
	[4] = { X = 460, Y = 87 },
	[5] = { X = 454, Y = 91 },
	[6] = { X = 447, Y = 81 },
	[7] = { X = 460, Y = 80 },
	[8] = { X = 465, Y = 89 },
	[9] = { X = 449, Y = 78 },
	[10] = { X = 467, Y = 99 },
	[11] = { X = 465, Y = 84 },
	
}

Waiting =
{
	[1] = { SpawnTime = 5, GuardTime = 650 },
	[2] = { SpawnTime = 20, GuardTime = 900 },
	[3] = { SpawnTime = 130, GuardTime = 1200 },
	[4] = { SpawnTime = 180, GuardTime = 1960 },
	[5] = { SpawnTime = 230, GuardTime = 2250 },
	[6] = { SpawnTime = 280, GuardTime = 3000 },
	[7] = { SpawnTime = 320, GuardTime = 3250 },
	[8] = { SpawnTime = 380, GuardTime = 3950 },
	[9] = { SpawnTime = 450, GuardTime = 4100 },
	[10] = { SpawnTime = 500, GuardTime = 4800 },
	[11] = { SpawnTime = 550, GuardTime = 5000 },
}

SpawnOnlyWhen
{
	X = 442 , Y = 89 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint06On"},
		IsGlobalTimeElapsed{ Name = "P212Spawnpoint06Running", Seconds = (Waiting[MyNumber].SpawnTime) },
	},
}

Respawn
{
	WaitTime = (random(100)+120) ,
	X = 442 , Y = 89 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint06On"},
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
		Negated(IsGlobalTimeElapsed{Name = "g_P212_Spawnpoint06_Timer", Seconds = (Waiting[MyNumber].GuardTime)}),
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
		IsGlobalTimeElapsed{Name = "g_P212_Spawnpoint06_Timer", Seconds = (Waiting[MyNumber].GuardTime)}
	},
}
