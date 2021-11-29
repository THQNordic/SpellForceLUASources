-->INFO Kaiserl. Anführer der SüdArmee

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
		Goto {X = 225, Y = 106, NpcId = self , Range = 5 , WalkMode = Walk, GotoMode = GotoContinuous},
		SetGlobalFlagTrue {Name = "g_sP209AnfuehrerSuedgesetzt"},
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
		IsGlobalFlagFalse {Name = "g_sP209ChiefSouthDead"},
	},
	Actions = 
	{
		Goto {X = 225, Y = 106, NpcId = self, Range = 3, WalkMode = Run, GotoMode = GotoContinuous},
	},
	DeathActions = 
	{
	
	}
} 

EndDefinition()

end
