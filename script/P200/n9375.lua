function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OneTimeInitAction (ChangeRace {Race = 152, NpcId = self})


OnOneTimeEvent
{
	Conditions = 
	{
	
	},
	Actions = 	
	{
		LookAtDirection {Direction = West, NpcId = self},
	},
}

OnIdleGoHome
{
X = _X,
Y = _Y,
Direction = North,
Range = 1,
WalkRange = 1,
WaitTime = 0, 
WalkMode = Walk, 
GotoMode = GotoForced,

	Conditions = 
	{
		FigureInRange { X = _X, Y = _Y, NpcId = self , Range = 3},
	},
	Actions = 
	{
		
	},

	HomeActions = 
	{
		LookAtDirection {Direction = West, NpcId = self},
		
	},

}

EndDefinition()

end
