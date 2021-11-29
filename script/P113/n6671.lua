--Boss Werwolf Süd
--Ahrr

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)




OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = { },
	Actions =
	{ 
		SetEffect{Effect = "Spawnboss",  Length = 0 , TargetType = Figure , NpcId = self},
	},
}

EndDefinition()

end
