CoordsBlockade =
{
	[1] = { X = 260, Y = 103 },
	[2] = { X = 262, Y = 103 },
	[3] = { X = 264, Y = 103 },
	[4] = { X = 266, Y = 103 },
	[5] = { X = 261, Y = 91 },
	[6] = { X = 263, Y = 91 },
	
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
	X = 470 , Y = 210 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint04On"},
		IsGlobalTimeElapsed{ Name = "P212Spawnpoint04Running", Seconds = (Waiting[MyNumber].SpawnTime) },
	},
}

Respawn
{
	WaitTime = (random(100)+25) ,
	X = 470 , Y = 210 ,
	Conditions =
	{
		IsGlobalFlagTrue{Name = "P212Spawnpoint04On"},
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
