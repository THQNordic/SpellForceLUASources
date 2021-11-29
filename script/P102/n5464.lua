function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "DialogStartEnd" }, --KitharAnführer greift Janina an sobald Erste CutSzene vorbei ist		
	},
	Actions = 
	{
		Goto{X  = 72 , Y = 125 , NpcId = self , Range = 3, WalkMode = Run , GotoMode = GotoNormal , XRand = 0 , YRand = 0},
	},
}

EndDefinition()

end
