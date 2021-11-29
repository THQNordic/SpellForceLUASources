function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Anführer Flankenangriff

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "TorFlankenangriff" }, --Das Tor wird geoeffnet
		IsGlobalTimeElapsed { Name = "WaitFlankenangriff", Seconds = 3, UpdateInterval = 10}, --Angreifer warten bis Tor geoeffnet wurde
	},
	Actions = 
	{
 		Goto{X = 171 , Y = 190 , NpcId = self , Range = 3, WalkMode = Run , GotoMode = GotoNormal , XRand = 0 , YRand = 0},
	},
}

EndDefinition()

end
