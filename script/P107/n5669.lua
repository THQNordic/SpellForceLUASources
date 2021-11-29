function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Zwergischer Geistergeneral Rogras

--Toggle zwischen Geisterkampf und Kampf gegen Spieler (Avatar)

REM = [[
OnToggleEvent
{

UpdateInterval = 60 ,
	OnConditions = 
	{
		IsGlobalFlagTrue { Name ="TorGeoeffnet"}, --Für Testzwecke
		FigureInRange { X = 93 , Y = 51 , NpcId = self , Range = 3},
		IsGlobalFlagTrue {Name = "ZwergundElfamAusgangspunkt"},
	},
	OnActions = 
	{
		--Goto { X = 93 , Y = 51, NpcId = self , Range = 3 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},	
		ChangeEquipment{ Slot = SlotRightHand, Item = 3743, NpcId = self},
		AttackTarget { Target = 5668, NpcId = self, FriendlyFire = TRUE},
	},
	
	OffConditions = 
	{
		--IsGlobalFlagTrue {Name = "ZwergundElfamAusgangspunkt"},
		--EnemyUnitInRange { X = 93 , Y = 51 , NpcId = 5669, Range = 6 , UnitId = 0 , UpdateInterval = 60}
		FigureInRange { X = 93 , Y = 51, NpcId = Avatar , Range = 10},

	},
	OffActions =
	{
		ChangeEquipment{ Slot = SlotRightHand, Item = 2753, NpcId = self},	
		AttackTarget { Target = Avatar, NpcId = self, FriendlyFire = FALSE},
	},
}

--Fragt ab ob Geist sich schon zuweit vom Startpunkt entfernt hat


OnEvent
{

	Conditions = 
	{
		Negated(FigureInRange { X = 93 , Y = 51 , NpcId = self , Range = 25}),
	},
	Actions = 
	{
		Goto { X = 93 , Y = 51, NpcId = self , Range = 3 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},
		SetGlobalFlagFalse {Name = "ZwergundElfamAusgangspunkt"},
	},
}

--Gewährleistet das der Geist wieder zum Startpunkt zurückkehrt

OnEvent
{

	Conditions = 
	{
		IsGlobalFlagFalse {Name = "ZwergundElfamAusgangspunkt"},
		FigureInRange { X = 93 , Y = 51 , NpcId = self , Range = 3},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "ZwergundElfamAusgangspunkt"},
	},
}

]]
EndDefinition()

end

