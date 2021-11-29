CoordsAufbaustoeren =
{
	[1] = { X = 211, Y = 464 },
	[2] = { X = 213, Y = 426 },
	[3] = { X = 310, Y = 430 },
	[4] = { X = 182, Y = 416 },
	[5] = { X = 196, Y = 465 },
	[6] = { X = 344, Y = 452},
	
}

CoordsSchalterBewachen =
{
	[1] = { X = 39, Y = 387 },
	[2] = { X = 50, Y = 387 },
	[3] = { X = 31, Y = 384 },
	[4] = { X = 38, Y = 382 },
	[5] = { X = 38, Y = 378 },
	[6] = { X = 49, Y = 380 },
	
}

Waiting =
{
	[1] = { SpawnTime = 5, GuardTime = 450 },
	[2] = { SpawnTime = 20, GuardTime = 960 },
	[3] = { SpawnTime = 50, GuardTime = 1640 },
	[4] = { SpawnTime = 100, GuardTime = 2050 },
	[5] = { SpawnTime = 150, GuardTime = 3100 },
	[6] = { SpawnTime = 200, GuardTime = 3700 },
}

SpawnOnlyWhen
{
	X = 42 , Y = 395 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint01On"},
		IsGlobalTimeElapsed{ Name = "P212Spawnpoint01Running", Seconds = (Waiting[MyNumber].SpawnTime) },
	},
}

Respawn
{
	WaitTime = (random(100)+120) ,
	X = 42 , Y = 395 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint01On"},
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
		Negated(IsGlobalTimeElapsed{Name = "g_P212_Spawnpoint01_Timer", Seconds = (Waiting[MyNumber].GuardTime)}),
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
		IsGlobalTimeElapsed{Name = "g_P212_Spawnpoint01_Timer", Seconds = (Waiting[MyNumber].GuardTime)}
	},
}
