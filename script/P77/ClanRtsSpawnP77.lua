--DebugInitAction ( SetGlobalTimeStamp{Name = "TestStartTimer"} )



--Ork/Goblin Dorf
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 25,
	X = 73,
	Y = 140,
	Range = 3,
	
	
	Timer	= "TestStartTimer",
	Init	= {779, 783, 777, 784, 779, 779, 777, 777, 779, 784}, 	
	SpawnData =
	{
		[0]		= {Seconds = 15, 	Units = {779}},
		[10]	= {Minutes = 2.5, 	Units = {783}},	
		[23]	= {Minutes = 1.5, 	Units = {784}},	
		[35]	= {Minutes = 1, 	Units = {783}}, 	
		[45]	= {Seconds = 50, 	Units = {779}},
		[70]	= {Seconds = 50, 	Units = {783}},
	},
	NpcBuildingsExist = {X = 73, Y = 147, Range = 4},
}

PlatformInitAction ( SetGlobalTimeStamp{Name = "TestStartTimer"} )