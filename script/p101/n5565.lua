function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnIdleGoHome
{
X = _X , Y = _Y , Direction = 0 , Range = 0 , WalkMode = Walk , UpdateInterval = 10 ,
}

EndDefinition()

end
