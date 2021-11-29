CoordsAufbaustoeren =
{
	[1] = { X = 247, Y = 437 },
	[2] = { X = 286, Y = 442 },
	[3] = { X = 315, Y = 431 },
	[4] = { X = 238, Y = 468 },
	[5] = { X = 198, Y = 466 },
	[6] = { X = 223, Y = 436 },
	
}

CoordsSchalterBewachen =
{
	[1] = { X = 81, Y = 243 },
	[2] = { X = 87, Y = 238 },
	[3] = { X = 95, Y = 231 },
	[4] = { X = 89, Y = 231 },
	[5] = { X = 90, Y = 225 },
	[6] = { X = 93, Y = 235 },
	
}

Waiting =
{
	[1] = { SpawnTime = 5, GuardTime = 400 },
	[2] = { SpawnTime = 15, GuardTime = 650 },
	[3] = { SpawnTime = 75, GuardTime = 880 },
	[4] = { SpawnTime = 125, GuardTime = 1300 },
	[5] = { SpawnTime = 175, GuardTime = 1700 },
	[6] = { SpawnTime = 225, GuardTime = 2200 },

}

SpawnOnlyWhen
{
	X = 76 , Y = 235 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint03On"},
		IsGlobalTimeElapsed{ Name = "P212Spawnpoint03Running", Seconds = (Waiting[MyNumber].SpawnTime) },
	},
}

Respawn
{
	WaitTime = (random(100)+120) ,
	X = 76 , Y = 235 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint03On"},
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
		Negated(IsGlobalTimeElapsed{Name = "g_P212_Spawnpoint03_Timer", Seconds = (Waiting[MyNumber].GuardTime)}),
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
		IsGlobalTimeElapsed{Name = "g_P212_Spawnpoint03_Timer", Seconds = (Waiting[MyNumber].GuardTime)}
	},
}
