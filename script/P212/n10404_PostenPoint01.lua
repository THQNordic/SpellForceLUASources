CoordsBlockade =
{
	[1] = { X = 261, Y = 103 },
	[2] = { X = 263, Y = 103 },
	[3] = { X = 265, Y = 103 },
	[4] = { X = 260, Y = 91 },
	[5] = { X = 262, Y = 91 },
	[6] = { X = 264, Y = 91 },
	
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
	X = 42 , Y = 395 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint01On"},
		IsGlobalTimeElapsed{ Name = "P212Spawnpoint01Running", Seconds = (Waiting[MyNumber].SpawnTime) },
	},
}

Respawn
{
	WaitTime = (random(100)+25) ,
	X = 42 , Y = 395 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint01On"},
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
