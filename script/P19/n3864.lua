function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)


-- Cutscene Spawn ---------------------------------
SpawnOnlyWhen
{
	X = _X , Y = _Y ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "MechlanSpawns"},
	},
	Actions = 
	{
		LookAtFigure {Target = 2850}, 
	}
}
---------------------------------------------------

EndDefinition()

end
