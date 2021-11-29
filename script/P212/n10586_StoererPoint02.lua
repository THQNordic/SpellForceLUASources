CoordsAufbaustoeren =
{
	[1] = { X = 313, Y = 426 },
	[2] = { X = 304, Y = 449 },
	[3] = { X = 326, Y = 435 },
	[4] = { X = 197, Y = 442 },
	[5] = { X = 172, Y = 410 },
	[6] = { X = 328, Y = 433 },
	
}

CoordsSchalterBewachen =
{
	[1] = { X = 466, Y = 408 },
	[2] = { X = 472, Y = 407 },
	[3] = { X = 475, Y = 400 },
	[4] = { X = 478, Y = 403 },
	[5] = { X = 479, Y = 397 },
	[6] = { X = 480, Y = 407 },
	
}

Waiting =
{
	[1] = { SpawnTime = 5, GuardTime = 500 },
	[2] = { SpawnTime = 15, GuardTime = 1500 },
	[3] = { SpawnTime = 85, GuardTime = 2100 },
	[4] = { SpawnTime = 135, GuardTime = 2500 },
	[5] = { SpawnTime = 185, GuardTime = 3200 },
	[6] = { SpawnTime = 235, GuardTime = 3800 },
}

SpawnOnlyWhen
{
	X = 479 , Y = 414 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint02On"},
		IsGlobalTimeElapsed{ Name = "P212Spawnpoint02Running", Seconds = (Waiting[MyNumber].SpawnTime) },
	},
}

Respawn
{
	WaitTime = (random(100)+120) ,
	X = 479 , Y = 414 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint02On"},
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
		Negated(IsGlobalTimeElapsed{Name = "g_P212_Spawnpoint02_Timer", Seconds = (Waiting[MyNumber].GuardTime)}),
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
		IsGlobalTimeElapsed{Name = "g_P212_Spawnpoint02_Timer", Seconds = (Waiting[MyNumber].GuardTime)}
	},
}
