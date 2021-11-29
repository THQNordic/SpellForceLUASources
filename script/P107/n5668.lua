function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--Elfischer Geistergeneral Garvyn


--Toggle zwischen Geisterkampf und Kampf gegen Spieler (Avatar)
OnToggleEvent
{

UpdateInterval = 10 ,
	OnConditions = 
	{
		--IsGlobalFlagTrue { Name ="TorGeoeffnet"}, --Für Testzwecke
		FigureInRange { X = 109, Y = 35 , NpcId = 5668 , Range = 3},
		FigureInRange { X = 109 , Y = 35 , NpcId = 5669 , Range = 3},
		IsGlobalFlagTrue {Name = "ZwergundElfamAusgangspunkt"},
	},
	OnActions = 
	{
		--Goto { X = 93 , Y = 51, NpcId = self , Range = 3 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},	
		ChangeUnit{ Unit = 1586 , NpcId = 5668},
		ChangeUnit{ Unit = 1585 , NpcId = 5669},
		AttackTarget { Target = 5669, NpcId = 5668, FriendlyFire = TRUE},
		AttackTarget { Target = 5668, NpcId = 5669, FriendlyFire = TRUE},
	},
	
	OffConditions = 
	{
		--IsGlobalFlagTrue {Name = "ZwergundElfamAusgangspunkt"},
		--EnemyUnitInRange { X = 93 , Y = 51 , NpcId = 5668, Range = 6 , UnitId = 0 , UpdateInterval = 60}
		FigureInRange { X = 109 , Y = 35, NpcId = Avatar , Range = 23},
	},
	OffActions =
	{
		ChangeUnit{ Unit = 1680 , NpcId = 5668},
		ChangeUnit{ Unit = 1679 , NpcId = 5669},
		AttackTarget { Target = Avatar, NpcId = 5668, FriendlyFire = FALSE},
		AttackTarget { Target = Avatar, NpcId = 5669, FriendlyFire = FALSE},
	},
}

--Fragt ab ob Geist sich schon zuweit vom Startpunkt entfernt hat


OnEvent
{

	Conditions = 
	{
		Negated(FigureInRange { X = 109 , Y = 35 , NpcId = 5668 , Range = 25}),
		Negated(FigureInRange { X = 109 , Y = 35 , NpcId = 5669 , Range = 25}),
	},
	Actions = 
	{
		Goto { X = 109 , Y = 35, NpcId = 5668 , Range = 3 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},
		Goto { X = 109 , Y = 35, NpcId = 5669 , Range = 3 , WalkMode = Run , GotoMode = GotoForced , XRand = 0 , YRand = 0},
		SetGlobalFlagFalse {Name = "ZwergundElfamAusgangspunkt"},
	},
}

--Gewährleistet das der Geist wieder zum Startpunkt zurückkehrt

OnEvent
{

	Conditions = 
	{
		IsGlobalFlagFalse {Name = "ZwergundElfamAusgangspunkt"},
		FigureInRange { X = 109, Y = 35 , NpcId = 5668 , Range = 3},
		FigureInRange { X = 109, Y = 35 , NpcId = 5669 , Range = 3},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "ZwergundElfamAusgangspunkt"},
	},
}

--Outcry
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange { X = 109 , Y = 35, NpcId = Avatar , Range = 25},
	},
	Actions =
	{
		Outcry { NpcId = 5668 , String = "Dies ist für meine Schwestern, Zwerg! Stirb!" , Tag = "ocGarvinP107_001" },
		Outcry { NpcId = 5669 , String = "Kommt und kostet meine Axt, Weib!" , Tag = "ocRograsP107_001" },
	}
}


EndDefinition()

end
