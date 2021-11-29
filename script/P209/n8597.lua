--> Magierunterstützung für Xalabar

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X,
	Y = _Y,
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP209ArtefaktAnzahl", Value = 1, Operator = IsGreaterOrEqual}
	},
	Actions =
	{

	}
}	
	 
EndDefinition()

end
