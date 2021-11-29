CoordsBlockade =
{
	[1] = { X = 263, Y = 87 },
	[2] = { X = 265, Y = 87 },
	[3] = { X = 260, Y = 95 },
	[4] = { X = 262, Y = 95 },
	[5] = { X = 264, Y = 95 },
	[6] = { X = 266, Y = 95 },
	
}


Waiting =
{
	[1] = { SpawnTime = 7 },
	[2] = { SpawnTime = 17 },
	[3] = { SpawnTime = 27 },
	[4] = { SpawnTime = 37 },
	[5] = { SpawnTime = 47 },
	[6] = { SpawnTime = 57 },
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
	WaitTime = (random(100)+25) ,
	X = 87 , Y = 55 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint05On"},
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
