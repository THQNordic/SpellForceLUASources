-->  INFO: Brathase fuer Dark Rohen Cutscene in Grreyfell
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnIdleGoHome
{
	WalkMode = Walk, Direction = 0, X = 123, Y = 235, 
}

Rem = [[
SpawnOnlyWhen
{
	--X = _X, Y = _Y,
	X = 123, Y = 235,
	--X = 120, Y = 228,
	Conditions =
	{
		IsGlobalFlagTrue {Name =  "RabbitSpawns"},
	},
}
]]

EndDefinition()

end
