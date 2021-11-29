--Das Tier

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



-----------------------------------------------
--Hoehlen abgehen, wenn Spielerunits dastehen
-----------------------------------------------
AddGotoLocation{X = 143, Y = 79, Radius = 3} --Höhle 1
AddGotoLocation{X = 216, Y = 82, Radius = 3} --Höhle4
AddGotoLocation{X = 185, Y = 177, Radius = 3} --Höhle3
AddGotoLocation{X = 127, Y = 164, Radius = 3} --Höhle2


OnIdleWalkPath
{
  WaitForIdle = FALSE, WaitForPlayerInRange = 0, Loop = 1, NotInDialog = FALSE, UpdateInterval = 30,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211DasTierGehtUm", UpdateInterval = 10}
	},
	Actions = 
	{
		ChangeRace {Race = 195, NpcId = 9720} --Race Werewolf
	},
	EndConditions = 
	{
		IsGlobalFlagFalse {Name = "g_P211DasTierGehtUm", UpdateInterval = 10}
	},
	EndActions = 
	{
		ChangeRace {Race = 152, NpcId = 9720} --Race TestNeutral
	},
}

EndDefinition()

end
