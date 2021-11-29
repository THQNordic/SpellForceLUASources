-->INFO: Rohen
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

SpawnOnlyWhen
{
	X = 190, Y = 192,
	--X = _X, Y = _Y,
	-- X = 175, Y = 192 : Startposition im level
	Conditions =
	{
		IsGlobalFlagTrue {Name =  "RohenLastSpawn"},
	},
	Actions =
	{

	},
}

EndDefinition()

end
