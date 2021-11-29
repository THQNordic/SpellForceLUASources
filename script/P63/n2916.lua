function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 82, Y = 246,
	-- test: X = 125, Y = 234,
	Conditions =
	{
		IsGlobalFlagTrue {Name =  "BotenSpawnFlag"},
	},
	Actions = {
	},
}

-- vor cutscene umspawnen ...
Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "BoteUmspawning", UpdateInterval = 3},	
		IsNpcFlagFalse {Name = "DespawnOnlyOnce", UpdateInterval = 3},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "BoteVanishedBeforeCutscene"},
		SetNpcFlagTrue {Name = "DespawnOnlyOnce"},
	},
}
Respawn
{
	WaitTime = 0.1, X = 123, Y = 224, NoSpawnEffect = TRUE,
	Conditions = {
		IsNpcFlagTrue {Name = "BoteVanishedBeforeCutscene", UpdateInterval = 1},
	},
	Actions = {
		SetNpcFlagTrue {Name = "BoteRespawnedBeforeCutscene"},
		SetNpcFlagFalse {Name = "BoteVanishedBeforeCutscene"},
	},
}
OnOneTimeEvent
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "BoteRespawnedBeforeCutscene", UpdateInterval = 3},
	},
	Actions =
	{
		SetNoFightFlagTrue{NpcId = 2916},
		Goto {X = 127, Y = 239, NpcId = 2916, Range = 0, WalkMode = Run, GotoMode = GotoForced},	-- bote
	},
}

OnOneTimeEvent
{
	Conditions = {
		IsGlobalFlagTrue {Name = "BoteMustAttackAvatar", UpdateInterval = 5},
	},
	Actions = {
		--AttackTarget{Target = Avatar, NpcId = self, FriendlyFire = TRUE},
		SetNoFightFlagFalse {NpcId = 2916},
	},
}



OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "FollowSummoner"},
		IsNpcFlagFalse{Name = "BoteFollowOn"},
		IsGlobalFlagFalse {Name = "BoteUmspawning", UpdateInterval = 10},
		FigureAlive{NpcId = Avatar},
	},
	Actions =
	{
		SetNpcFlagTrue{Name = "BoteFollowOn"},
		-- follow des boten ist safe, da spieler mit ihm nie ein portal erreichen wird!
		ChangeRace{Race = 139}, -- wulfgar human clan
		Follow {Target = 0},
	},
}

OnToggleEvent
{
OnConditions = {
				IsGlobalFlagTrue {Name = "FollowSummoner", UpdateInterval = 10},
				FigureJob{Job = JobIdle , NpcId = self},
				Negated(FigureHasAggro{NpcId = self , UpdateInterval = 5}),
				IsGlobalFlagFalse {Name = "BoteUmspawning", UpdateInterval = 10},
				FigureAlive{NpcId = Avatar},
				},
OnActions = 	{
				-- safe, da nur über aggro und dem follow flag getoggled wird
				Follow{Target = Avatar , NpcId = self},
				},
OffConditions = {
				IsGlobalFlagTrue {Name = "FollowSummoner", UpdateInterval = 10},
				FigureHasAggro{NpcId = self , UpdateInterval = 5},
				IsGlobalFlagFalse {Name = "BoteUmspawning", UpdateInterval = 10},
				FigureAlive{NpcId = Avatar},
				},
OffActions =	{
				StopFollow{Target = Avatar , NpcId = self},
				}
}

OnEvent
{
	Conditions = {
		FigureHasHealth{Percent = 90, UpdateInterval = 2},
		IsGlobalFlagTrue {Name = "FollowSummoner", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "BoteUmspawning", UpdateInterval = 10},
	},
	Actions = {
		CGdsFigureSetHealth:new(_NpcId, 14),
	},
}


OnDeadPlayerGoHome
{
	X = _X, Y = _Y, Direction = random(0,7), KeepFollowing = TRUE,
	Conditions = {  
		FigureJob{Job = JobIdle , NpcId = self},
		Negated(FigureHasAggro{NpcId = self , UpdateInterval = 5}),
		IsGlobalFlagTrue {Name = "FollowSummoner", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "BoteUmspawning", UpdateInterval = 10},
	},
	Actions = {  
	},
	HomeActions = {  
	},
}

Respawn
{
	WaitTime = 0.1, X = _X, Y = _Y,
	Conditions = {
		IsGlobalFlagTrue {Name = "FollowSummoner", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "BoteUmspawning", UpdateInterval = 10},
	},
	Actions = {
		SetNpcFlagFalse{Name = "BoteFollowOn"},
	},
}


EndDefinition()

end
