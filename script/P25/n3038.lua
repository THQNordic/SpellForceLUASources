function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


----------- CUTSCENE ------------------------------------
SpawnOnlyWhen
{
	X = _X, Y = _Y, Conditions =
	{
		IsGlobalFlagTrue {Name = "BladeSpawns", UpdateInterval = 5},
	},
	Actions =
	{
		-- SetEffect {Effect = "SimpleInvis", TargetType = Figure, X = 0, Y = 0, Length = 0, NpcId = _NpcId}
		--SetNoFightFlagTrue {},					
	}
}
---------------------------------------------------------

REM = [[ -- wird nicht mehr benötigt, und würde als OnEvent nur das scriptsystem jeden step mit einem goto spammen!
-- Follow Dunkler für Cutscene
OnEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "BladesLaufenLos", UpdateInterval = 10},
	},
	Actions = 
	{
		Follow{Target = 3037}
	},
}
]]

EndDefinition()

end
