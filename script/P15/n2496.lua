function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


rem = [[
OnIdleGoHome
{
	WalkMode = Walk, X = 448 Y = 229, Direction = 4,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "KorsharGehZumDialog"}
	},
}]]
rem = nil

EndDefinition()

end
