function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	Conditions = {
		IsGlobalFlagTrue { Name = "TorFlankenangriff" },		
	},
	Actions = {
		Goto{X  = 167 , Y = 190 , NpcId = self , Range = 3, WalkMode = Run , GotoMode = GotoNormal , XRand = 0 , YRand = 0},
	},
}


EndDefinition()

end
