CoordsBlockade =
{
	[1] = { X = 264, Y = 87 },
	[2] = { X = 266, Y = 87 },
	[3] = { X = 261, Y = 95 },
	[4] = { X = 263, Y = 95 },
	[5] = { X = 265, Y = 95 },
	[6] = { X = 263, Y = 107 },
	
}


Waiting =
{
	[1] = { SpawnTime = 12 },
	[2] = { SpawnTime = 22 },
	[3] = { SpawnTime = 32 },
	[4] = { SpawnTime = 42 },
	[5] = { SpawnTime = 52 },
	[6] = { SpawnTime = 62 },
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
	WaitTime = (random(100)+25) ,
	X = 76 , Y = 235 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint03On"},
	},
}



-- Figur läuft in Barrikade
OnIdleGoHome
{
	X = (CoordsBlockade[MyNumber].X) ,
	Y = (CoordsBlockade[MyNumber].Y) ,
	Range = 1, WalkMode = Run,
	Direction = North,
}
