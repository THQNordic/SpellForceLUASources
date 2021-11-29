function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{ 
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
			IsGlobalFlagTrue{Name = "g_P204_StreitWachenSpawn"},
	},
	Actions = 
	{
			SetGlobalFlagTrue{Name = "g_P204_ZumStreitGehen"},
			ChangeRace{Race = 152, NpcId = self},			
	},
}


OnIdleGoHome
{

	X = 257, Y = 254, WalkMode = Run, Direction = South,
	
	Conditions =
	{
			IsGlobalFlagTrue {Name = "g_P204_ZumStreitGehen"},
	},
	
	HomeActions =
	{
		SetGlobalFlagFalse{Name = "g_P204_ZumStreitGehen"},
		Outcry { NpcId = 11604, Tag = "oca2sergeantP204_004", String = "Holla! Ihr Zwei da! Auseinander! Los, mitkommen, Streithähne wollen wir hier nicht!"},	
		SetGlobalTimeStamp{Name = "c_P204_StreiterEinsperren"},			
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
	   IsGlobalTimeElapsed{Name = "c_P204_StreiterEinsperren", Seconds = 4, UpdateInterval = 10}, 
	},
	
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_WieselAbgang"},
		SetGlobalFlagTrue{Name = "g_P204_ZanziAbgang"},
		QuestSolve {QuestId = 1075}, QuestSolve {QuestId = 1076},		
	}
}


OnOneTimeEvent
{
	Conditions = 
	{
	   IsGlobalTimeElapsed{Name = "c_P204_StreiterEinsperren", Seconds = 6, UpdateInterval = 10}, 
	},
	
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P204_Wache1Abgang"},	
		SetGlobalFlagTrue{Name = "g_P204_Wache2Abgang"},	
	}
}


OnIdleGoHome
{

	X = 248, Y = 269, WalkMode = Walk, Direction = South,
	
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P204_Wache1Abgang"},
	},
	
	HomeActions =
	{
		SetGlobalFlagFalse{Name = "g_P204_Wache1Abgang"},
		SetGlobalFlagTrue{Name = "g_P204_Wache1Despawn"},		
	}
}


Despawn
{
	PlayDeathAnim = FALSE,

	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P204_Wache1Despawn", UpdateInterval = 60},
	}
}

------OutcryDummy Event für Scriptparser
OnOneTimeEvent
{
Conditions = {
			IsGlobalFlagTrue{Name = "NeverTrue"}
			},
Actions = {
		Outcry { NpcId = 11604, Tag = "oca2sergeantP204_003", String = "Da! General Yrmir ist tot! Eine blaue Rose ... Die Assassinen haben Yrmir getötet!"},	
		}
}
EndDefinition()

end
