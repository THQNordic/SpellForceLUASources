CoordsAufbaustoeren =
{
	[1] = { X = 264, Y = 431 },
	[2] = { X = 212, Y = 472 },
	[3] = { X = 321, Y = 452 },
	[4] = { X = 182, Y = 435 },
	[5] = { X = 184, Y = 439 },
	[6] = { X = 206, Y = 430 },
	[7] = { X = 247, Y = 464 },
	[8] = { X = 177, Y = 417 },
	[9] = { X = 312, Y = 446 },
	[10] = { X = 303, Y = 427 },
	[11] = { X = 284, Y = 435 },
	
}

CoordsSchalterBewachen =
{
	[1] = { X = 78, Y = 50 },
	[2] = { X = 84, Y = 46 },
	[3] = { X = 80, Y = 46 },
	[4] = { X = 92, Y = 46 },
	[5] = { X = 94, Y = 48 },
	[6] = { X = 97, Y = 53 },
	[7] = { X = 87, Y = 38 },
	[8] = { X = 76, Y = 50 },
	[9] = { X = 102, Y = 49 },
	[10] = { X = 74, Y = 52 },
	[11] = { X = 104, Y = 52 },
	
}

Waiting =
{
	[1] = { SpawnTime = 5, GuardTime = 550 },
	[2] = { SpawnTime = 20, GuardTime = 860 },
	[3] = { SpawnTime = 100, GuardTime = 1250 },
	[4] = { SpawnTime = 200, GuardTime = 2100 },
	[5] = { SpawnTime = 300, GuardTime = 2300 },
	[6] = { SpawnTime = 350, GuardTime = 3300 },
	[7] = { SpawnTime = 400, GuardTime = 3500 },
	[8] = { SpawnTime = 450, GuardTime = 4200 },
	[9] = { SpawnTime = 500, GuardTime = 4400 },
	[10] = { SpawnTime = 550, GuardTime = 5100 },
	[11] = { SpawnTime = 600, GuardTime = 5300 },
}

SpawnOnlyWhen
{
	X = 87 , Y = 55 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint05On"},
		IsGlobalTimeElapsed{ Name = "P212Spawnpoint05Running", Seconds = (Waiting[MyNumber].SpawnTime) },
	},
}

Respawn
{
	WaitTime = (random(100)+120) ,
	X = 87 , Y = 55 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint05On"},
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
		Negated(IsGlobalTimeElapsed{Name = "g_P212_Spawnpoint05_Timer", Seconds = (Waiting[MyNumber].GuardTime)}),
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
		IsGlobalTimeElapsed{Name = "g_P212_Spawnpoint05_Timer", Seconds = (Waiting[MyNumber].GuardTime)}
	},
}
