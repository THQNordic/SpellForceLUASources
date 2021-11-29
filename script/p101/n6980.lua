--INFO: Zschauer OrkGoblinball
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


SpawnOnlyWhen
{
	X = 248 , Y = 282 , Clan = 0 , UnitId = 0 , NoSpawnEffect = TRUE ,
	Conditions = 
	{
		IsGlobalFlagTrue{ Name = "P101_DunkelElfBossKilled", UpdateInterval = 30}
	},
	Actions = 
	{
	--Zuschauer auf die Ränge
		
		Goto{X = _X, Y = _Y, NpcId = self, Range = 1, WalkMode = Run, GotoMode = GotoForced}, 
	} 
}


--wenn  Zuschauer auf Basepoint, dann Direction
OnIdleGoHome
{
	X = _X, Y = _Y, Direction = 1, Range = 5 , WalkRange = 10 , WaitTime = 0 , WalkMode = Walk , GotoMode = GotoForced,
	Conditions = 
	{
		IsGlobalFlagFalse{Name = "P101OrksGewinnen", UpdateInterval = 20},
	},
	Actions = { },
	HomeActions = 
	{ 
		HoldPosition{NpcId = self},
	},
	AbortConditions = {},
	AbortActions = {},
}

EndDefinition()

end