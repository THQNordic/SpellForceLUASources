-- breathing forest baum
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

Respawn
{
	WaitTime = 0.1,
	Conditions = {
		Negated(PlayerHasItem{ItemId = 3460}),
	},
}

OnIdleGoHome{
	WalkMode = Walk, X = 289, Y = 248, Direction = 4,
	Conditions = {
		Negated(PlayerHasItem{ItemId = 3460}),
		IsGlobalFlagTrue {Name = "TreeIdleOn", UpdateInterval = 10},
	},
	AbortConditions = {
		PlayerHasItem{ItemId = 3460},
		IsGlobalFlagTrue {Name = "TreeIdleOn", UpdateInterval = 10},
		FigureAlive{NpcId = Avatar},
	},
	AbortActions = {
		Stop{},
		Follow{Target = Avatar},
	},
}

OnToggleEvent
{
	UpdateInterval = 10,
	OnConditions = {
		Negated(FigureHasAggro{UpdateInterval = 10}),
		PlayerHasItem{ItemId = 3460, UpdateInterval = 10},
		IsGlobalFlagFalse{Name = "GDS_PlayerIsTalking", UpdateInterval = 10},
		FigureAlive{NpcId = Avatar},
	},
	OnActions = {
		ChangeRace{Race = 184},	-- race bloodesh
		SetGlobalFlagTrue{Name = "BloodEshIsEvil"},
		Outcry{ Tag = "outcryBloodashBF001"      , NpcId = 4177, String = "Ooh! Mein Kleinod! Leg es zurück, Wurm! Ich werde Dich zerschmetteren!"                      , Color = ColorWhite },
		Stop{},
		Follow{Target = Avatar},
	},
	OffConditions = {
		Negated(PlayerHasItem{ItemId = 3460, UpdateInterval = 10}),
		--IsGlobalFlagFalse{Name = "GDS_PlayerIsTalking", UpdateInterval = 10},
		FigureAlive{NpcId = Avatar},
	},
	OffActions = {
		ChangeRace{Race = 152},	-- clan elf prisoner (Testneutral)
		StopFollow{Target = Avatar},
		Goto{X = 289, Y = 248, Range = 15 , WalkMode = Walk , GotoMode = GotoForced},
		SetGlobalFlagFalse{Name = "BloodEshIsEvil"},
		Outcry{ Tag = "outcryBloodashBF002"      , NpcId = 4177, String = "Ah! Mein Kleinod!"                                                                           , Color = ColorWhite },
	},
}

OnIdleEvent
{
	Conditions = {
		Negated(FigureHasAggro{}),
		IsGlobalFlagTrue{Name = "BloodEshIsEvil", UpdateInterval = 30},
		FigureAlive{NpcId = Avatar},
	},
	Actions = {
		--StopFollow{Target = Avatar},
		--Stop{},
		Follow{Target = Avatar},
	},
}

OnToggleEvent
{
	UpdateInterval = 4,
	OnConditions = {
		IsGlobalFlagTrue{Name = "BloodEshIsEvil", UpdateInterval = 20},
		FigureDead{NpcId = Avatar},
	},
	OnActions = {
		--Goto{X = 289, Y = 248, Range = 15 , WalkMode = Walk , GotoMode = GotoForced},
	},
	OffConditions = {
		IsGlobalFlagTrue{Name = "BloodEshIsEvil", UpdateInterval = 20},
		Negated(FigureHasAggro{}),
		FigureAlive{NpcId = Avatar},
	},
	OffActions = {
		Stop{},
		Follow{Target = Avatar},
	},
}


REM = [[
OnPlatformOneTimeEvent
{
	Conditions = {
		PlayerHasItem{ItemId = 3460},
		IsGlobalFlagFalse{Name = "GDS_PlayerIsTalking", UpdateInterval = 10},
		--IsGlobalFlagTrue {Name = "TreeIdleOn", UpdateInterval = 10},
	},
	Actions = {
		SetNpcFlagTrue{Name = "BloodEshStartFollowNow"},
	},
}
]]


EndDefinition()
end