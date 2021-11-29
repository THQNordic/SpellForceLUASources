function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
--SpawnOnlyWhen
--{
--	X = _X , Y = _Y ,
--	Conditions = {
--			 IsGlobalFlagTrue{Name = "GodwallDemoCutsceneToggle"}
--		}
--}
--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3, Conditions = {IsGlobalFlagFalse{Name = "DemoElvesGoHomeOff"}}}
--!EDS ONIDLEGOHOME END

EndDefinition()

end
