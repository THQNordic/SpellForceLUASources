-->INFO Kaiserl. Anführer Hauptstreitmacht

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen 
{
	NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209CutszeneBoteStart"},
	},
	Actions = 
	{
		Goto {X = 239, Y = 291, NpcId = self , Range = 5 , WalkMode = Walk, GotoMode = GotoContinuous},
		SetGlobalFlagTrue {Name = "g_sP209AnfuehrerEastgesetzt"},
	}
} 

Respawn
{
	WaitTime = 10,
	UnitId = self,
	X = _X,
	Y = _Y,
	Conditions = 
	{
		IsGlobalFlagFalse {Name = "g_sP209ChiefEastDead"},
	},
	Actions = 
	{
		Goto {X = 239, Y = 291, NpcId = self, Range = 3, WalkMode = Run, GotoMode = GotoContinuous},
	},
	DeathActions = 
	{
	
	}
} 

EndDefinition()

end
